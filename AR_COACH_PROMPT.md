# 🎯 SPEZIAL-PROMPT: AR COACH FEATURE (DETAILLIERT)

**Für KI-Assistenten: Komplette AR Coach Implementierung**

---

## KONTEXT

Ich entwickle eine Fitness-App "IronReign Pro" und brauche eine vollständige Implementierung des AR Coach Features mit ARCore und ML Kit Pose Detection.

## TECHNISCHE SPECS

- **ARCore**: Version 1.44.0
- **ML Kit Pose Detection**: Version 17.0.0 (Accurate Mode)
- **Kotlin**: 1.9.0
- **Min SDK**: 26
- **Target SDK**: 34

## ANFORDERUNGEN

### 1. ARCoachActivity - Vollständige Klasse

Erstelle eine vollständige ARCoachActivity.kt mit:

#### A. Initialisierung
```kotlin
class ARCoachActivity : AppCompatActivity() {
    // ViewBinding
    private lateinit var binding: ActivityArcoachBinding
    
    // ARCore
    private var arSession: Session? = null
    private lateinit var surfaceView: GLSurfaceView
    
    // ML Kit
    private lateinit var poseDetector: PoseDetector
    private var currentPose: Pose? = null
    
    // Camera
    private lateinit var cameraSource: CameraSource
    
    // Rep Counter
    private var repCount = 0
    private var isInDownPosition = false
    private var lastRepTime = 0L
    
    // Audio
    private var mediaPlayer: MediaPlayer? = null
    
    // State
    private var isPaused = false
    private var currentExercise = ExerciseType.SQUATS
    
    enum class ExerciseType {
        SQUATS, PUSHUPS, PLANK
    }
}
```

#### B. onCreate() - Vollständig

```kotlin
override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    binding = ActivityArcoachBinding.inflate(layoutInflater)
    setContentView(binding.root)
    
    // UI Setup
    setupUI()
    
    // Permissions
    if (checkCameraPermission()) {
        initializeAR()
    } else {
        requestCameraPermission()
    }
}

private fun setupUI() {
    binding.btnStopAr.setOnClickListener {
        finish()
    }
    
    binding.btnPauseAr.setOnClickListener {
        togglePause()
    }
    
    // Exercise Selector (optional)
    binding.spinnerExercise?.let { spinner ->
        val exercises = ExerciseType.values().map { it.name }
        spinner.adapter = ArrayAdapter(this, android.R.layout.simple_spinner_item, exercises)
        spinner.onItemSelectedListener = object : AdapterView.OnItemSelectedListener {
            override fun onItemSelected(parent: AdapterView<*>?, view: View?, position: Int, id: Long) {
                currentExercise = ExerciseType.values()[position]
                resetCounter()
            }
            override fun onNothingSelected(parent: AdapterView<*>?) {}
        }
    }
}
```

#### C. ARCore Initialisierung

```kotlin
private fun initializeAR() {
    try {
        // ARCore Availability Check
        when (ArCoreApk.getInstance().requestInstall(this, true)) {
            ArCoreApk.InstallStatus.INSTALL_REQUESTED -> {
                updateStatus("📦 ARCore wird installiert...")
                return
            }
            ArCoreApk.InstallStatus.INSTALLED -> {
                updateStatus("✓ ARCore bereit")
            }
        }
        
        // Session erstellen
        arSession = Session(this).apply {
            // Config
            val config = Config(this).apply {
                lightEstimationMode = Config.LightEstimationMode.AMBIENT_INTENSITY
                focusMode = Config.FocusMode.AUTO
            }
            configure(config)
        }
        
        // ML Kit Pose Detector
        val options = PoseDetectorOptions.Builder()
            .setDetectorMode(PoseDetectorOptions.STREAM_MODE)
            .build()
        poseDetector = PoseDetection.getClient(options)
        
        // Camera Source
        setupCameraSource()
        
        // Audio
        try {
            mediaPlayer = MediaPlayer.create(this, R.raw.beep)
        } catch (e: Exception) {
            Log.w(TAG, "Beep sound nicht gefunden: ${e.message}")
        }
        
        updateStatus("✅ AR Coach bereit!")
        
    } catch (e: Exception) {
        handleARError(e)
    }
}
```

#### D. Camera Source Setup

```kotlin
private fun setupCameraSource() {
    cameraSource = CameraSource(this, object : CameraSource.CameraSourceListener {
        override fun onFrame(frame: Frame) {
            processFrame(frame)
        }
        
        override fun onError(error: Exception) {
            Log.e(TAG, "Camera Error: ${error.message}")
            updateStatus("❌ Kamera-Fehler")
        }
    })
    
    // SurfaceView für Camera Preview
    binding.arSurfaceContainer.removeAllViews()
    
    val surfaceView = SurfaceView(this).apply {
        layoutParams = FrameLayout.LayoutParams(
            FrameLayout.LayoutParams.MATCH_PARENT,
            FrameLayout.LayoutParams.MATCH_PARENT
        )
    }
    
    binding.arSurfaceContainer.addView(surfaceView)
    
    surfaceView.holder.addCallback(object : SurfaceHolder.Callback {
        override fun surfaceCreated(holder: SurfaceHolder) {
            try {
                cameraSource.start(holder)
            } catch (e: Exception) {
                Log.e(TAG, "Kamera start fehlgeschlagen: ${e.message}")
            }
        }
        
        override fun surfaceChanged(holder: SurfaceHolder, format: Int, width: Int, height: Int) {}
        override fun surfaceDestroyed(holder: SurfaceHolder) {
            cameraSource.stop()
        }
    })
    
    // Overlay für Skelett-Rendering
    val overlayView = PoseOverlayView(this)
    overlayView.layoutParams = FrameLayout.LayoutParams(
        FrameLayout.LayoutParams.MATCH_PARENT,
        FrameLayout.LayoutParams.MATCH_PARENT
    )
    binding.arSurfaceContainer.addView(overlayView)
    
    this.overlayView = overlayView
}
```

#### E. Frame Processing & Pose Detection

```kotlin
private fun processFrame(frame: Frame) {
    if (isPaused) return
    
    try {
        // Frame zu InputImage konvertieren
        val mediaImage = frame.acquireCameraImage()
        val inputImage = InputImage.fromMediaImage(
            mediaImage,
            frame.imageMetadata.rotationDegrees
        )
        
        // Pose Detection
        poseDetector.process(inputImage)
            .addOnSuccessListener { pose ->
                currentPose = pose
                
                // Pose verarbeiten
                processPose(pose)
                
                // Skelett zeichnen
                overlayView?.setPose(pose)
                
                mediaImage.close()
            }
            .addOnFailureListener { e ->
                Log.e(TAG, "Pose detection failed: ${e.message}")
                mediaImage.close()
            }
            
    } catch (e: Exception) {
        Log.e(TAG, "Frame processing error: ${e.message}")
    }
}
```

#### F. Pose Processing & Rep Detection

```kotlin
private fun processPose(pose: Pose) {
    val landmarks = pose.allPoseLandmarks
    if (landmarks.isEmpty()) {
        updatePoseInfo("⚠️ Keine Pose erkannt")
        return
    }
    
    when (currentExercise) {
        ExerciseType.SQUATS -> detectSquatRep(pose)
        ExerciseType.PUSHUPS -> detectPushupRep(pose)
        ExerciseType.PLANK -> analyzePlankForm(pose)
    }
}

private fun detectSquatRep(pose: Pose) {
    try {
        // Landmarks holen
        val leftHip = pose.getPoseLandmark(PoseLandmark.LEFT_HIP)
        val leftKnee = pose.getPoseLandmark(PoseLandmark.LEFT_KNEE)
        val leftAnkle = pose.getPoseLandmark(PoseLandmark.LEFT_ANKLE)
        
        val rightHip = pose.getPoseLandmark(PoseLandmark.RIGHT_HIP)
        val rightKnee = pose.getPoseLandmark(PoseLandmark.RIGHT_KNEE)
        val rightAnkle = pose.getPoseLandmark(PoseLandmark.RIGHT_ANKLE)
        
        if (leftHip == null || leftKnee == null || leftAnkle == null ||
            rightHip == null || rightKnee == null || rightAnkle == null) {
            updatePoseInfo("⚠️ Körper nicht vollständig sichtbar")
            return
        }
        
        // Kniewinkel berechnen (links)
        val leftKneeAngle = calculateAngle(
            leftHip.position,
            leftKnee.position,
            leftAnkle.position
        )
        
        // Kniewinkel berechnen (rechts)
        val rightKneeAngle = calculateAngle(
            rightHip.position,
            rightKnee.position,
            rightAnkle.position
        )
        
        // Durchschnitt
        val kneeAngle = (leftKneeAngle + rightKneeAngle) / 2
        
        // Rep Detection State Machine
        val currentTime = System.currentTimeMillis()
        val debounceTime = 1000L // 1 Sekunde
        
        if (kneeAngle < 90 && !isInDownPosition) {
            // Runter-Position erreicht
            isInDownPosition = true
            updatePoseInfo("⬇️ Tief-Position: ${kneeAngle.toInt()}°")
            
        } else if (kneeAngle > 160 && isInDownPosition) {
            // Hoch-Position erreicht (Rep vollendet)
            if (currentTime - lastRepTime > debounceTime) {
                repCount++
                updateRepCounter(repCount)
                playBeep()
                lastRepTime = currentTime
                updatePoseInfo("✅ Rep $repCount! Winkel: ${kneeAngle.toInt()}°")
            }
            isInDownPosition = false
            
        } else {
            // Zwischen-Position
            val status = if (isInDownPosition) "⬆️ Hoch kommen" else "⬇️ Runter gehen"
            updatePoseInfo("$status (${kneeAngle.toInt()}°)")
        }
        
        // Form Feedback
        checkSquatForm(pose, leftKnee, rightKnee, leftAnkle, rightAnkle)
        
    } catch (e: Exception) {
        Log.e(TAG, "Squat detection error: ${e.message}")
    }
}

private fun detectPushupRep(pose: Pose) {
    try {
        val leftShoulder = pose.getPoseLandmark(PoseLandmark.LEFT_SHOULDER)
        val leftElbow = pose.getPoseLandmark(PoseLandmark.LEFT_ELBOW)
        val leftWrist = pose.getPoseLandmark(PoseLandmark.LEFT_WRIST)
        
        val rightShoulder = pose.getPoseLandmark(PoseLandmark.RIGHT_SHOULDER)
        val rightElbow = pose.getPoseLandmark(PoseLandmark.RIGHT_ELBOW)
        val rightWrist = pose.getPoseLandmark(PoseLandmark.RIGHT_WRIST)
        
        if (leftShoulder == null || leftElbow == null || leftWrist == null ||
            rightShoulder == null || rightElbow == null || rightWrist == null) {
            updatePoseInfo("⚠️ Oberkörper nicht sichtbar")
            return
        }
        
        // Ellbogenwinkel berechnen
        val leftElbowAngle = calculateAngle(
            leftShoulder.position,
            leftElbow.position,
            leftWrist.position
        )
        
        val rightElbowAngle = calculateAngle(
            rightShoulder.position,
            rightElbow.position,
            rightWrist.position
        )
        
        val elbowAngle = (leftElbowAngle + rightElbowAngle) / 2
        
        // Rep Detection
        val currentTime = System.currentTimeMillis()
        val debounceTime = 1000L
        
        if (elbowAngle < 90 && !isInDownPosition) {
            isInDownPosition = true
            updatePoseInfo("⬇️ Unten: ${elbowAngle.toInt()}°")
            
        } else if (elbowAngle > 160 && isInDownPosition) {
            if (currentTime - lastRepTime > debounceTime) {
                repCount++
                updateRepCounter(repCount)
                playBeep()
                lastRepTime = currentTime
                updatePoseInfo("✅ Push-up $repCount!")
            }
            isInDownPosition = false
        }
        
        checkPushupForm(pose)
        
    } catch (e: Exception) {
        Log.e(TAG, "Push-up detection error: ${e.message}")
    }
}

private fun analyzePlankForm(pose: Pose) {
    // Plank-Form-Analyse
    val leftShoulder = pose.getPoseLandmark(PoseLandmark.LEFT_SHOULDER)
    val leftHip = pose.getPoseLandmark(PoseLandmark.LEFT_HIP)
    val leftAnkle = pose.getPoseLandmark(PoseLandmark.LEFT_ANKLE)
    
    if (leftShoulder == null || leftHip == null || leftAnkle == null) {
        updatePoseInfo("⚠️ Körper nicht sichtbar")
        return
    }
    
    // Körperwinkel (sollte ca. 180° sein für gerade Linie)
    val bodyAngle = calculateAngle(
        leftShoulder.position,
        leftHip.position,
        leftAnkle.position
    )
    
    val feedback = when {
        bodyAngle < 165 -> "⚠️ Hüfte zu hoch!"
        bodyAngle > 195 -> "⚠️ Hüfte zu tief!"
        else -> "✅ Perfekte Plank-Form!"
    }
    
    updatePoseInfo("$feedback (${ bodyAngle.toInt()}°)")
}
```

#### G. Winkel-Berechnung

```kotlin
private fun calculateAngle(
    firstPoint: PointF3D,
    midPoint: PointF3D,
    lastPoint: PointF3D
): Double {
    // Vektoren berechnen
    val vector1 = PointF(
        firstPoint.x - midPoint.x,
        firstPoint.y - midPoint.y
    )
    
    val vector2 = PointF(
        lastPoint.x - midPoint.x,
        lastPoint.y - midPoint.y
    )
    
    // Skalarprodukt
    val dotProduct = vector1.x * vector2.x + vector1.y * vector2.y
    
    // Längen
    val magnitude1 = sqrt(vector1.x * vector1.x + vector1.y * vector1.y)
    val magnitude2 = sqrt(vector2.x * vector2.x + vector2.y * vector2.y)
    
    // Winkel in Grad
    val cosineAngle = dotProduct / (magnitude1 * magnitude2)
    val angle = Math.toDegrees(acos(cosineAngle.toDouble()))
    
    return angle
}
```

#### H. Form-Feedback

```kotlin
private fun checkSquatForm(
    pose: Pose,
    leftKnee: PoseLandmark,
    rightKnee: PoseLandmark,
    leftAnkle: PoseLandmark,
    rightAnkle: PoseLandmark
) {
    // Knie über Zehen Check
    if (leftKnee.position.x > leftAnkle.position.x + 20 ||
        rightKnee.position.x > rightAnkle.position.x + 20) {
        showFormFeedback("⚠️ Knie zu weit vorn!", Color.YELLOW)
    } else {
        showFormFeedback("✅ Knie-Position gut!", Color.GREEN)
    }
    
    // Rücken-Geradheit Check (optional)
    val leftShoulder = pose.getPoseLandmark(PoseLandmark.LEFT_SHOULDER)
    val leftHip = pose.getPoseLandmark(PoseLandmark.LEFT_HIP)
    
    if (leftShoulder != null && leftHip != null) {
        val torsoAngle = abs(leftShoulder.position.x - leftHip.position.x)
        if (torsoAngle > 50) {
            showFormFeedback("⚠️ Rücken gerade halten!", Color.YELLOW)
        }
    }
}

private fun checkPushupForm(pose: Pose) {
    // Körpergerade Check
    val leftShoulder = pose.getPoseLandmark(PoseLandmark.LEFT_SHOULDER)
    val leftHip = pose.getPoseLandmark(PoseLandmark.LEFT_HIP)
    val leftAnkle = pose.getPoseLandmark(PoseLandmark.LEFT_ANKLE)
    
    if (leftShoulder != null && leftHip != null && leftAnkle != null) {
        val bodyAngle = calculateAngle(
            leftShoulder.position3D,
            leftHip.position3D,
            leftAnkle.position3D
        )
        
        if (bodyAngle < 170) {
            showFormFeedback("⚠️ Körper gerade halten!", Color.YELLOW)
        } else {
            showFormFeedback("✅ Gute Form!", Color.GREEN)
        }
    }
}
```

#### I. UI Updates

```kotlin
private fun updateRepCounter(count: Int) {
    runOnUiThread {
        binding.textRepCount.text = count.toString()
    }
}

private fun updateStatus(status: String) {
    runOnUiThread {
        binding.textStatus.text = status
    }
}

private fun updatePoseInfo(info: String) {
    runOnUiThread {
        binding.textPoseInfo.text = info
    }
}

private fun showFormFeedback(feedback: String, color: Int) {
    runOnUiThread {
        binding.textFormFeedback?.apply {
            text = feedback
            setTextColor(color)
            visibility = View.VISIBLE
            
            // Auto-hide nach 2 Sekunden
            postDelayed({
                visibility = View.GONE
            }, 2000)
        }
    }
}

private fun playBeep() {
    try {
        mediaPlayer?.start()
    } catch (e: Exception) {
        Log.w(TAG, "Beep abspielen fehlgeschlagen: ${e.message}")
    }
}
```

#### J. Lifecycle Management

```kotlin
override fun onResume() {
    super.onResume()
    if (!isPaused) {
        arSession?.resume()
        cameraSource.start()
    }
}

override fun onPause() {
    super.onPause()
    arSession?.pause()
    cameraSource.stop()
}

override fun onDestroy() {
    super.onDestroy()
    
    try {
        poseDetector.close()
    } catch (e: Exception) {}
    
    mediaPlayer?.release()
    mediaPlayer = null
    
    arSession?.close()
    arSession = null
    
    cameraSource.release()
}

private fun togglePause() {
    isPaused = !isPaused
    if (isPaused) {
        arSession?.pause()
        binding.btnPauseAr.text = "Fortsetzen"
        updateStatus("⏸️ Pausiert")
    } else {
        arSession?.resume()
        binding.btnPauseAr.text = "Pause"
        updateStatus("▶️ AR Coach aktiv")
    }
}

private fun resetCounter() {
    repCount = 0
    isInDownPosition = false
    lastRepTime = 0L
    updateRepCounter(0)
    updatePoseInfo("Bereit für ${currentExercise.name}")
}
```

### 2. PoseOverlayView - Custom View für Skelett

Erstelle eine Custom View zum Zeichnen des Skeletts:

```kotlin
class PoseOverlayView @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = 0
) : View(context, attrs, defStyleAttr) {

    private var currentPose: Pose? = null
    
    private val landmarkPaint = Paint().apply {
        color = Color.parseColor("#00FFFF")  // Neon Cyan
        style = Paint.Style.FILL
        strokeWidth = 12f
    }
    
    private val linePaint = Paint().apply {
        color = Color.parseColor("#00FFFF")
        style = Paint.Style.STROKE
        strokeWidth = 8f
    }
    
    private val goodFormPaint = Paint().apply {
        color = Color.GREEN
        style = Paint.Style.STROKE
        strokeWidth = 8f
    }
    
    private val badFormPaint = Paint().apply {
        color = Color.RED
        style = Paint.Style.STROKE
        strokeWidth = 8f
    }
    
    fun setPose(pose: Pose?) {
        currentPose = pose
        invalidate()  // Trigger redraw
    }
    
    override fun onDraw(canvas: Canvas) {
        super.onDraw(canvas)
        
        val pose = currentPose ?: return
        
        // Skalierungsfaktor für Koordinaten-Transformation
        val scaleX = width.toFloat()
        val scaleY = height.toFloat()
        
        // Zeichne Verbindungen
        drawConnections(canvas, pose, scaleX, scaleY)
        
        // Zeichne Landmarks
        drawLandmarks(canvas, pose, scaleX, scaleY)
    }
    
    private fun drawConnections(canvas: Canvas, pose: Pose, scaleX: Float, scaleY: Float) {
        // Definiere Verbindungen (Skelett)
        val connections = listOf(
            // Kopf
            Pair(PoseLandmark.NOSE, PoseLandmark.LEFT_EYE),
            Pair(PoseLandmark.NOSE, PoseLandmark.RIGHT_EYE),
            Pair(PoseLandmark.LEFT_EYE, PoseLandmark.LEFT_EAR),
            Pair(PoseLandmark.RIGHT_EYE, PoseLandmark.RIGHT_EAR),
            
            // Oberkörper
            Pair(PoseLandmark.LEFT_SHOULDER, PoseLandmark.RIGHT_SHOULDER),
            Pair(PoseLandmark.LEFT_SHOULDER, PoseLandmark.LEFT_HIP),
            Pair(PoseLandmark.RIGHT_SHOULDER, PoseLandmark.RIGHT_HIP),
            Pair(PoseLandmark.LEFT_HIP, PoseLandmark.RIGHT_HIP),
            
            // Arme
            Pair(PoseLandmark.LEFT_SHOULDER, PoseLandmark.LEFT_ELBOW),
            Pair(PoseLandmark.LEFT_ELBOW, PoseLandmark.LEFT_WRIST),
            Pair(PoseLandmark.RIGHT_SHOULDER, PoseLandmark.RIGHT_ELBOW),
            Pair(PoseLandmark.RIGHT_ELBOW, PoseLandmark.RIGHT_WRIST),
            
            // Beine
            Pair(PoseLandmark.LEFT_HIP, PoseLandmark.LEFT_KNEE),
            Pair(PoseLandmark.LEFT_KNEE, PoseLandmark.LEFT_ANKLE),
            Pair(PoseLandmark.RIGHT_HIP, PoseLandmark.RIGHT_KNEE),
            Pair(PoseLandmark.RIGHT_KNEE, PoseLandmark.RIGHT_ANKLE)
        )
        
        connections.forEach { (start, end) ->
            val startLandmark = pose.getPoseLandmark(start)
            val endLandmark = pose.getPoseLandmark(end)
            
            if (startLandmark != null && endLandmark != null) {
                canvas.drawLine(
                    startLandmark.position.x * scaleX,
                    startLandmark.position.y * scaleY,
                    endLandmark.position.x * scaleX,
                    endLandmark.position.y * scaleY,
                    linePaint
                )
            }
        }
    }
    
    private fun drawLandmarks(canvas: Canvas, pose: Pose, scaleX: Float, scaleY: Float) {
        pose.allPoseLandmarks.forEach { landmark ->
            canvas.drawCircle(
                landmark.position.x * scaleX,
                landmark.position.y * scaleY,
                12f,
                landmarkPaint
            )
        }
    }
}
```

### 3. CameraSource Helper

```kotlin
class CameraSource(
    private val context: Context,
    private val listener: CameraSourceListener
) {
    private var camera: Camera? = null
    private var surfaceHolder: SurfaceHolder? = null
    
    interface CameraSourceListener {
        fun onFrame(frame: Frame)
        fun onError(error: Exception)
    }
    
    fun start(holder: SurfaceHolder) {
        try {
            surfaceHolder = holder
            camera = Camera.open().apply {
                setPreviewDisplay(holder)
                
                val parameters = parameters
                parameters.focusMode = Camera.Parameters.FOCUS_MODE_CONTINUOUS_VIDEO
                setParameters(parameters)
                
                setPreviewCallback { data, camera ->
                    // Frame zu ML Kit schicken
                    // Implementierung vereinfacht
                }
                
                startPreview()
            }
        } catch (e: Exception) {
            listener.onError(e)
        }
    }
    
    fun stop() {
        camera?.apply {
            stopPreview()
            release()
        }
        camera = null
    }
    
    fun release() {
        stop()
    }
}
```

## ZUSÄTZLICHE ANFORDERUNGEN

1. **Error Handling** überall
2. **Memory Leaks** vermeiden
3. **Performance** optimieren (30 FPS)
4. **Battery** schonen
5. **Thread Safety** beachten

## TESTS

Schreibe Unit Tests für:
- Winkel-Berechnungen
- Rep Detection Logic
- State Machine

## BUILD & DEPLOYMENT

- Debug-Build mit Logging
- Release-Build optimiert
- ProGuard-Regeln für ARCore/ML Kit

Bitte implementiere die vollständige ARCoachActivity mit allen Details!
