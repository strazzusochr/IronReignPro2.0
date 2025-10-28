# 🏋️ IronReign Pro - Kompletter Entwicklungs-Prompt für Android Studio

## 📋 Projekt-Übersicht

Erstelle eine vollständige Android-Fitness-App namens "IronReign Pro" mit AR-Coach-Funktionalität, Pose Detection und futuristischem Neon-Design. Die App soll Production-ready sein und alle modernen Android-Best-Practices befolgen.

---

## 🎯 Projekt-Anforderungen

### Allgemeine Spezifikationen:
- **Plattform**: Android (Kotlin)
- **Min SDK**: 26 (Android 8.0 Oreo)
- **Target SDK**: 34 (Android 14)
- **Compile SDK**: 34
- **Architektur**: MVVM + Clean Architecture
- **Design**: Material Design 3 mit futuristischem Neon-Theme
- **Programmiersprache**: Kotlin 100%

### Kernfunktionalitäten:
1. **AR Coach** - Augmented Reality Training mit Pose Detection
2. **Trainingsplan** - Wöchentlicher, anpassbarer Trainingsplan
3. **Fortschritt** - Visualisierung mit Charts und Statistiken
4. **Ernährung** - Tracking und Tipps
5. **Einstellungen** - Personalisierung und Präferenzen

---

## 🏗️ Technische Architektur

### 1. Projekt-Struktur

```
IronReignPro/
├── app/
│   ├── build.gradle (Module-Level)
│   ├── proguard-rules.pro
│   └── src/
│       ├── main/
│       │   ├── AndroidManifest.xml
│       │   ├── java/com/example/ironreign/
│       │   │   ├── IronReignApplication.kt
│       │   │   ├── MainActivity.kt
│       │   │   ├── ARCoachActivity.kt
│       │   │   │
│       │   │   ├── di/ (Dependency Injection)
│       │   │   │   ├── AppModule.kt
│       │   │   │   ├── DatabaseModule.kt
│       │   │   │   ├── NetworkModule.kt
│       │   │   │   └── ViewModelModule.kt
│       │   │   │
│       │   │   ├── data/
│       │   │   │   ├── local/
│       │   │   │   │   ├── dao/
│       │   │   │   │   │   ├── WorkoutDao.kt
│       │   │   │   │   │   ├── NutritionDao.kt
│       │   │   │   │   │   └── ProgressDao.kt
│       │   │   │   │   ├── database/
│       │   │   │   │   │   └── IronReignDatabase.kt
│       │   │   │   │   └── entities/
│       │   │   │   │       ├── WorkoutEntity.kt
│       │   │   │   │       ├── NutritionEntity.kt
│       │   │   │   │       └── ProgressEntity.kt
│       │   │   │   │
│       │   │   │   ├── remote/
│       │   │   │   │   ├── api/
│       │   │   │   │   │   └── FitnessApiService.kt
│       │   │   │   │   └── dto/
│       │   │   │   │       ├── WorkoutDto.kt
│       │   │   │   │       └── NutritionDto.kt
│       │   │   │   │
│       │   │   │   ├── repository/
│       │   │   │   │   ├── WorkoutRepository.kt
│       │   │   │   │   ├── WorkoutRepositoryImpl.kt
│       │   │   │   │   ├── NutritionRepository.kt
│       │   │   │   │   ├── NutritionRepositoryImpl.kt
│       │   │   │   │   ├── ProgressRepository.kt
│       │   │   │   │   └── ProgressRepositoryImpl.kt
│       │   │   │   │
│       │   │   │   └── mapper/
│       │   │   │       ├── WorkoutMapper.kt
│       │   │   │       └── NutritionMapper.kt
│       │   │   │
│       │   │   ├── domain/
│       │   │   │   ├── model/
│       │   │   │   │   ├── TrainingDay.kt
│       │   │   │   │   ├── Exercise.kt
│       │   │   │   │   ├── WorkoutProgress.kt
│       │   │   │   │   ├── NutritionEntry.kt
│       │   │   │   │   ├── UserProfile.kt
│       │   │   │   │   └── PoseData.kt
│       │   │   │   │
│       │   │   │   ├── usecase/
│       │   │   │   │   ├── GetWeeklyTrainingPlanUseCase.kt
│       │   │   │   │   ├── SaveWorkoutProgressUseCase.kt
│       │   │   │   │   ├── GetWorkoutHistoryUseCase.kt
│       │   │   │   │   ├── CalculateCaloriesUseCase.kt
│       │   │   │   │   ├── TrackNutritionUseCase.kt
│       │   │   │   │   └── AnalyzePoseUseCase.kt
│       │   │   │   │
│       │   │   │   └── repository/ (Interfaces)
│       │   │   │       ├── IWorkoutRepository.kt
│       │   │   │       ├── INutritionRepository.kt
│       │   │   │       └── IProgressRepository.kt
│       │   │   │
│       │   │   ├── presentation/
│       │   │   │   ├── ui/
│       │   │   │   │   ├── home/
│       │   │   │   │   │   ├── HomeFragment.kt
│       │   │   │   │   │   ├── HomeViewModel.kt
│       │   │   │   │   │   └── HomeUiState.kt
│       │   │   │   │   │
│       │   │   │   │   ├── menu/
│       │   │   │   │   │   ├── MenuFragment.kt
│       │   │   │   │   │   ├── MenuViewModel.kt
│       │   │   │   │   │   └── MenuUiState.kt
│       │   │   │   │   │
│       │   │   │   │   ├── trainings/
│       │   │   │   │   │   ├── TrainingsFragment.kt
│       │   │   │   │   │   ├── TrainingsViewModel.kt
│       │   │   │   │   │   ├── TrainingsUiState.kt
│       │   │   │   │   │   ├── TrainingDetailFragment.kt
│       │   │   │   │   │   ├── ExerciseAdapter.kt
│       │   │   │   │   │   └── TrainingDayAdapter.kt
│       │   │   │   │   │
│       │   │   │   │   ├── progress/
│       │   │   │   │   │   ├── ProgressFragment.kt
│       │   │   │   │   │   ├── ProgressViewModel.kt
│       │   │   │   │   │   ├── ProgressUiState.kt
│       │   │   │   │   │   └── ChartManager.kt
│       │   │   │   │   │
│       │   │   │   │   ├── nutrition/
│       │   │   │   │   │   ├── NutritionFragment.kt
│       │   │   │   │   │   ├── NutritionViewModel.kt
│       │   │   │   │   │   ├── NutritionUiState.kt
│       │   │   │   │   │   ├── NutritionLogFragment.kt
│       │   │   │   │   │   └── MealAdapter.kt
│       │   │   │   │   │
│       │   │   │   │   ├── settings/
│       │   │   │   │   │   ├── SettingsFragment.kt
│       │   │   │   │   │   ├── SettingsViewModel.kt
│       │   │   │   │   │   └── SettingsUiState.kt
│       │   │   │   │   │
│       │   │   │   │   └── arcoach/
│       │   │   │   │       ├── ARCoachFragment.kt
│       │   │   │   │       ├── ARCoachViewModel.kt
│       │   │   │   │       ├── ARCoachUiState.kt
│       │   │   │   │       ├── PoseDetectionManager.kt
│       │   │   │   │       ├── ARCoreManager.kt
│       │   │   │   │       ├── RepCounterManager.kt
│       │   │   │   │       └── FeedbackManager.kt
│       │   │   │   │
│       │   │   │   ├── components/ (Reusable Components)
│       │   │   │   │   ├── NeonButton.kt
│       │   │   │   │   ├── StatCard.kt
│       │   │   │   │   ├── ProgressCircle.kt
│       │   │   │   │   └── WorkoutCard.kt
│       │   │   │   │
│       │   │   │   └── theme/
│       │   │   │       ├── Color.kt
│       │   │   │       ├── Theme.kt
│       │   │   │       ├── Type.kt
│       │   │   │       └── Shape.kt
│       │   │   │
│       │   │   └── util/
│       │   │       ├── Constants.kt
│       │   │       ├── Extensions.kt
│       │   │       ├── DateUtils.kt
│       │   │       ├── PermissionManager.kt
│       │   │       ├── NotificationManager.kt
│       │   │       └── PreferencesManager.kt
│       │   │
│       │   └── res/
│       │       ├── layout/
│       │       ├── drawable/
│       │       ├── values/
│       │       ├── navigation/
│       │       ├── font/
│       │       ├── raw/
│       │       ├── anim/
│       │       └── xml/
│       │
│       ├── test/ (Unit Tests)
│       │   └── java/com/example/ironreign/
│       │       ├── viewmodel/
│       │       ├── repository/
│       │       ├── usecase/
│       │       └── util/
│       │
│       └── androidTest/ (Instrumented Tests)
│           └── java/com/example/ironreign/
│               ├── ui/
│               ├── database/
│               └── integration/
│
├── build.gradle (Project-Level)
├── settings.gradle
├── gradle.properties
├── gradle/wrapper/
└── .github/workflows/
```

---

## 📦 Dependencies & Build Configuration

### build.gradle (Project-Level)
```gradle
plugins {
    id 'com.android.application' version '8.3.0' apply false
    id 'org.jetbrains.kotlin.android' version '1.9.20' apply false
    id 'com.google.dagger.hilt.android' version '2.48' apply false
    id 'com.google.devtools.ksp' version '1.9.20-1.0.14' apply false
}
```

### build.gradle (App-Level)
```gradle
plugins {
    id 'com.android.application'
    id 'org.jetbrains.kotlin.android'
    id 'kotlin-kapt'
    id 'com.google.dagger.hilt.android'
    id 'com.google.devtools.ksp'
    id 'androidx.navigation.safeargs.kotlin'
}

android {
    namespace 'com.example.ironreign'
    compileSdk 34

    defaultConfig {
        applicationId "com.example.ironreign"
        minSdk 26
        targetSdk 34
        versionCode 1
        versionName "1.0.0"
        
        testInstrumentationRunner "androidx.test.runner.AndroidJUnitRunner"
        
        vectorDrawables {
            useSupportLibrary true
        }
    }

    buildTypes {
        release {
            minifyEnabled true
            shrinkResources true
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
        debug {
            debuggable true
            minifyEnabled false
        }
    }

    buildFeatures {
        viewBinding true
        dataBinding true
        compose true
    }

    composeOptions {
        kotlinCompilerExtensionVersion '1.5.4'
    }

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_17
        targetCompatibility JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = '17'
        freeCompilerArgs += [
            '-opt-in=kotlin.RequiresOptIn',
            '-opt-in=kotlinx.coroutines.ExperimentalCoroutinesApi',
            '-opt-in=kotlinx.coroutines.FlowPreview'
        ]
    }

    packaging {
        resources {
            excludes += '/META-INF/{AL2.0,LGPL2.1}'
        }
    }
}

dependencies {
    // Core Android
    implementation 'androidx.core:core-ktx:1.13.1'
    implementation 'androidx.appcompat:appcompat:1.7.0'
    implementation 'androidx.activity:activity-ktx:1.9.0'
    implementation 'androidx.fragment:fragment-ktx:1.7.1'
    implementation 'androidx.constraintlayout:constraintlayout:2.2.0'
    
    // Material Design 3
    implementation 'com.google.android.material:material:1.12.0'
    
    // Compose (Optional - für moderne UI)
    implementation platform('androidx.compose:compose-bom:2024.04.00')
    implementation 'androidx.compose.ui:ui'
    implementation 'androidx.compose.material3:material3'
    implementation 'androidx.compose.ui:ui-tooling-preview'
    implementation 'androidx.activity:activity-compose:1.9.0'
    debugImplementation 'androidx.compose.ui:ui-tooling'
    
    // Lifecycle & ViewModel
    implementation 'androidx.lifecycle:lifecycle-viewmodel-ktx:2.8.0'
    implementation 'androidx.lifecycle:lifecycle-livedata-ktx:2.8.0'
    implementation 'androidx.lifecycle:lifecycle-runtime-ktx:2.8.0'
    implementation 'androidx.lifecycle:lifecycle-runtime-compose:2.8.0'
    
    // Navigation
    implementation 'androidx.navigation:navigation-fragment-ktx:2.7.7'
    implementation 'androidx.navigation:navigation-ui-ktx:2.7.7'
    implementation 'androidx.navigation:navigation-compose:2.7.7'
    
    // Coroutines
    implementation 'org.jetbrains.kotlinx:kotlinx-coroutines-core:1.8.0'
    implementation 'org.jetbrains.kotlinx:kotlinx-coroutines-android:1.8.0'
    
    // Room Database
    implementation 'androidx.room:room-runtime:2.6.1'
    implementation 'androidx.room:room-ktx:2.6.1'
    ksp 'androidx.room:room-compiler:2.6.1'
    
    // Retrofit & Networking
    implementation 'com.squareup.retrofit2:retrofit:2.9.0'
    implementation 'com.squareup.retrofit2:converter-gson:2.9.0'
    implementation 'com.squareup.okhttp3:okhttp:4.12.0'
    implementation 'com.squareup.okhttp3:logging-interceptor:4.12.0'
    
    // Hilt Dependency Injection
    implementation 'com.google.dagger:hilt-android:2.48'
    kapt 'com.google.dagger:hilt-compiler:2.48'
    implementation 'androidx.hilt:hilt-navigation-compose:1.2.0'
    
    // ARCore
    implementation 'com.google.ar:core:1.44.0'
    implementation 'com.google.ar.sceneform:filament-android:1.17.1'
    
    // ML Kit Pose Detection
    implementation 'com.google.mlkit:pose-detection:18.0.0-beta4'
    implementation 'com.google.mlkit:pose-detection-accurate:18.0.0-beta4'
    
    // CameraX
    implementation 'androidx.camera:camera-camera2:1.3.3'
    implementation 'androidx.camera:camera-lifecycle:1.3.3'
    implementation 'androidx.camera:camera-view:1.3.3'
    
    // Charts & Visualization
    implementation 'com.github.PhilJay:MPAndroidChart:v3.1.0'
    implementation 'com.github.AnyChart:AnyChart-Android:1.1.5'
    
    // Image Loading
    implementation 'io.coil-kt:coil:2.6.0'
    implementation 'io.coil-kt:coil-compose:2.6.0'
    
    // DataStore (Preferences)
    implementation 'androidx.datastore:datastore-preferences:1.1.1'
    
    // WorkManager (Background Tasks)
    implementation 'androidx.work:work-runtime-ktx:2.9.0'
    
    // Splash Screen
    implementation 'androidx.core:core-splashscreen:1.0.1'
    
    // Lottie Animations
    implementation 'com.airbnb.android:lottie:6.4.0'
    implementation 'com.airbnb.android:lottie-compose:6.4.0'
    
    // Testing
    testImplementation 'junit:junit:4.13.2'
    testImplementation 'org.jetbrains.kotlinx:kotlinx-coroutines-test:1.8.0'
    testImplementation 'androidx.arch.core:core-testing:2.2.0'
    testImplementation 'io.mockk:mockk:1.13.10'
    testImplementation 'com.google.truth:truth:1.4.2'
    
    androidTestImplementation 'androidx.test.ext:junit:1.1.5'
    androidTestImplementation 'androidx.test.espresso:espresso-core:3.5.1'
    androidTestImplementation 'androidx.test.espresso:espresso-contrib:3.5.1'
    androidTestImplementation 'androidx.compose.ui:ui-test-junit4'
    androidTestImplementation 'com.google.dagger:hilt-android-testing:2.48'
    kaptAndroidTest 'com.google.dagger:hilt-compiler:2.48'
}
```

---

## 🎨 Design System

### Color Scheme (colors.xml)
```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <!-- Primary Neon Colors -->
    <color name="neon_cyan">#00FFFF</color>
    <color name="neon_purple">#B400FF</color>
    <color name="neon_pink">#FF10F0</color>
    <color name="neon_green">#00FF00</color>
    <color name="neon_yellow">#FFFF00</color>
    <color name="neon_blue">#0080FF</color>
    
    <!-- Dark Theme Colors -->
    <color name="dark_bg">#000000</color>
    <color name="dark_surface">#0A0A0A</color>
    <color name="dark_surface_variant">#1A1A1A</color>
    <color name="dark_outline">#333333</color>
    
    <!-- Material Design 3 Tokens -->
    <color name="md_theme_primary">#00FFFF</color>
    <color name="md_theme_onPrimary">#000000</color>
    <color name="md_theme_primaryContainer">#004D4D</color>
    <color name="md_theme_onPrimaryContainer">#00FFFF</color>
    
    <color name="md_theme_secondary">#B400FF</color>
    <color name="md_theme_onSecondary">#000000</color>
    <color name="md_theme_secondaryContainer">#5A007F</color>
    <color name="md_theme_onSecondaryContainer">#E6CCFF</color>
    
    <color name="md_theme_tertiary">#FF10F0</color>
    <color name="md_theme_onTertiary">#000000</color>
    
    <color name="md_theme_error">#FF5252</color>
    <color name="md_theme_onError">#000000</color>
    
    <color name="md_theme_background">#000000</color>
    <color name="md_theme_onBackground">#00FFFF</color>
    
    <color name="md_theme_surface">#0A0A0A</color>
    <color name="md_theme_onSurface">#00FFFF</color>
    <color name="md_theme_surfaceVariant">#1A1A1A</color>
    <color name="md_theme_onSurfaceVariant">#B3B3B3</color>
    
    <!-- Gradient Colors -->
    <color name="gradient_start">#000000</color>
    <color name="gradient_mid">#1A0033</color>
    <color name="gradient_end">#000033</color>
    
    <!-- Semantic Colors -->
    <color name="success">#00FF00</color>
    <color name="warning">#FFAA00</color>
    <color name="info">#00AAFF</color>
</resources>
```

### Typography (themes.xml)
```xml
<resources>
    <style name="Base.Theme.IronReign" parent="Theme.Material3.DayNight.NoActionBar">
        <!-- Typography -->
        <item name="android:fontFamily">@font/orbitron_regular</item>
        <item name="textAppearanceHeadlineLarge">@style/TextAppearance.IronReign.HeadlineLarge</item>
        <item name="textAppearanceHeadlineMedium">@style/TextAppearance.IronReign.HeadlineMedium</item>
        <item name="textAppearanceBodyLarge">@style/TextAppearance.IronReign.BodyLarge</item>
        <item name="textAppearanceBodyMedium">@style/TextAppearance.IronReign.BodyMedium</item>
        
        <!-- Colors -->
        <item name="colorPrimary">@color/md_theme_primary</item>
        <item name="colorOnPrimary">@color/md_theme_onPrimary</item>
        <item name="colorSecondary">@color/md_theme_secondary</item>
        <item name="android:colorBackground">@color/md_theme_background</item>
        
        <!-- Status & Navigation Bars -->
        <item name="android:statusBarColor">@color/dark_bg</item>
        <item name="android:navigationBarColor">@color/dark_bg</item>
        <item name="android:windowLightStatusBar">false</item>
        
        <!-- Material Components -->
        <item name="materialButtonStyle">@style/Widget.IronReign.Button</item>
        <item name="materialCardViewStyle">@style/Widget.IronReign.Card</item>
    </style>
    
    <style name="TextAppearance.IronReign.HeadlineLarge" parent="TextAppearance.Material3.HeadlineLarge">
        <item name="android:fontFamily">@font/orbitron_bold</item>
        <item name="android:textSize">32sp</item>
        <item name="android:textColor">@color/neon_cyan</item>
    </style>
    
    <!-- ... mehr Typography Styles -->
</resources>
```

---

## 💻 Feature Implementation

### 1. AR Coach mit Pose Detection

#### ARCoachActivity.kt
```kotlin
@AndroidEntryPoint
class ARCoachActivity : AppCompatActivity() {
    
    private lateinit var binding: ActivityArcoachBinding
    private val viewModel: ARCoachViewModel by viewModels()
    
    private lateinit var poseDetectionManager: PoseDetectionManager
    private lateinit var arCoreManager: ARCoreManager
    private lateinit var repCounterManager: RepCounterManager
    
    private var cameraProvider: ProcessCameraProvider? = null
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityArcoachBinding.inflate(layoutInflater)
        setContentView(binding.root)
        
        setupUI()
        requestPermissions()
        setupObservers()
    }
    
    private fun setupUI() {
        binding.apply {
            btnStopAr.setOnClickListener { finish() }
            btnPauseAr.setOnClickListener { viewModel.togglePause() }
            btnSwitchCamera.setOnClickListener { viewModel.switchCamera() }
        }
    }
    
    private fun requestPermissions() {
        if (checkPermissions()) {
            initializeARComponents()
        } else {
            ActivityCompat.requestPermissions(
                this,
                REQUIRED_PERMISSIONS,
                PERMISSION_REQUEST_CODE
            )
        }
    }
    
    private fun initializeARComponents() {
        // Initialize ML Kit Pose Detection
        poseDetectionManager = PoseDetectionManager(
            context = this,
            onPoseDetected = { pose ->
                viewModel.updatePose(pose)
            }
        )
        
        // Initialize ARCore
        arCoreManager = ARCoreManager(
            activity = this,
            onSessionReady = { session ->
                viewModel.setArSession(session)
            }
        )
        
        // Initialize Rep Counter
        repCounterManager = RepCounterManager(
            onRepCompleted = { count ->
                viewModel.incrementRepCount()
                playFeedbackSound()
            }
        )
        
        // Start Camera
        startCamera()
    }
    
    private fun startCamera() {
        val cameraProviderFuture = ProcessCameraProvider.getInstance(this)
        
        cameraProviderFuture.addListener({
            cameraProvider = cameraProviderFuture.get()
            
            val preview = Preview.Builder().build().also {
                it.setSurfaceProvider(binding.previewView.surfurfaceProvider)
            }
            
            val imageAnalysis = ImageAnalysis.Builder()
                .setTargetResolution(Size(1280, 720))
                .setBackpressureStrategy(ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST)
                .build()
                .also {
                    it.setAnalyzer(
                        ContextCompat.getMainExecutor(this),
                        poseDetectionManager
                    )
                }
            
            val cameraSelector = CameraSelector.DEFAULT_BACK_CAMERA
            
            try {
                cameraProvider?.unbindAll()
                cameraProvider?.bindToLifecycle(
                    this,
                    cameraSelector,
                    preview,
                    imageAnalysis
                )
            } catch (e: Exception) {
                Log.e(TAG, "Camera binding failed", e)
            }
            
        }, ContextCompat.getMainExecutor(this))
    }
    
    private fun setupObservers() {
        lifecycleScope.launch {
            repeatOnLifecycle(Lifecycle.State.STARTED) {
                launch {
                    viewModel.uiState.collect { state ->
                        updateUI(state)
                    }
                }
                
                launch {
                    viewModel.repCount.collect { count ->
                        binding.textRepCount.text = count.toString()
                    }
                }
                
                launch {
                    viewModel.feedback.collect { feedback ->
                        showFeedback(feedback)
                    }
                }
            }
        }
    }
    
    private fun updateUI(state: ARCoachUiState) {
        binding.apply {
            textStatus.text = state.statusMessage
            textPoseInfo.text = state.poseInfo
            progressBar.isVisible = state.isLoading
            
            when (state) {
                is ARCoachUiState.Detecting -> {
                    overlayView.drawPose(state.pose)
                }
                is ARCoachUiState.Error -> {
                    showError(state.message)
                }
            }
        }
    }
    
    private fun playFeedbackSound() {
        MediaPlayer.create(this, R.raw.beep).apply {
            start()
            setOnCompletionListener { release() }
        }
    }
    
    companion object {
        private const val TAG = "ARCoachActivity"
        private const val PERMISSION_REQUEST_CODE = 100
        private val REQUIRED_PERMISSIONS = arrayOf(
            Manifest.permission.CAMERA
        )
    }
}
```

#### ARCoachViewModel.kt
```kotlin
@HiltViewModel
class ARCoachViewModel @Inject constructor(
    private val analyzePoseUseCase: AnalyzePoseUseCase,
    private val saveWorkoutProgressUseCase: SaveWorkoutProgressUseCase
) : ViewModel() {
    
    private val _uiState = MutableStateFlow<ARCoachUiState>(ARCoachUiState.Idle)
    val uiState: StateFlow<ARCoachUiState> = _uiState.asStateFlow()
    
    private val _repCount = MutableStateFlow(0)
    val repCount: StateFlow<Int> = _repCount.asStateFlow()
    
    private val _feedback = MutableSharedFlow<String>()
    val feedback: SharedFlow<String> = _feedback.asSharedFlow()
    
    private var isPaused = false
    private var currentExercise: Exercise? = null
    
    fun updatePose(pose: Pose) {
        viewModelScope.launch {
            if (!isPaused) {
                val analysis = analyzePoseUseCase(pose, currentExercise)
                
                _uiState.value = ARCoachUiState.Detecting(
                    pose = pose,
                    poseInfo = analysis.feedback,
                    formCorrect = analysis.isCorrect
                )
                
                if (analysis.repCompleted) {
                    incrementRepCount()
                }
                
                if (!analysis.isCorrect) {
                    _feedback.emit(analysis.correctionTips)
                }
            }
        }
    }
    
    fun incrementRepCount() {
        _repCount.value += 1
    }
    
    fun togglePause() {
        isPaused = !isPaused
        _uiState.value = if (isPaused) {
            ARCoachUiState.Paused
        } else {
            ARCoachUiState.Idle
        }
    }
    
    fun saveSession() {
        viewModelScope.launch {
            val progress = WorkoutProgress(
                date = System.currentTimeMillis(),
                exerciseName = currentExercise?.name ?: "Unknown",
                reps = _repCount.value,
                sets = 1,
                weight = 0.0
            )
            
            saveWorkoutProgressUseCase(progress)
        }
    }
}

sealed class ARCoachUiState {
    object Idle : ARCoachUiState()
    object Paused : ARCoachUiState()
    data class Detecting(
        val pose: Pose,
        val poseInfo: String,
        val formCorrect: Boolean
    ) : ARCoachUiState()
    data class Error(val message: String) : ARCoachUiState()
    val isLoading: Boolean get() = false
    val statusMessage: String get() = when (this) {
        is Idle -> "Bereit"
        is Paused -> "Pausiert"
        is Detecting -> if (formCorrect) "✓ Korrekt" else "⚠ Korrektur"
        is Error -> "Fehler"
    }
}
```

### 2. Room Database Implementation

#### IronReignDatabase.kt
```kotlin
@Database(
    entities = [
        WorkoutEntity::class,
        NutritionEntity::class,
        ProgressEntity::class,
        ExerciseEntity::class
    ],
    version = 1,
    exportSchema = true
)
@TypeConverters(Converters::class)
abstract class IronReignDatabase : RoomDatabase() {
    abstract fun workoutDao(): WorkoutDao
    abstract fun nutritionDao(): NutritionDao
    abstract fun progressDao(): ProgressDao
    abstract fun exerciseDao(): ExerciseDao
    
    companion object {
        const val DATABASE_NAME = "ironreign_db"
    }
}
```

#### WorkoutDao.kt
```kotlin
@Dao
interface WorkoutDao {
    
    @Query("SELECT * FROM workouts ORDER BY date DESC")
    fun getAllWorkouts(): Flow<List<WorkoutEntity>>
    
    @Query("SELECT * FROM workouts WHERE date BETWEEN :startDate AND :endDate")
    fun getWorkoutsByDateRange(startDate: Long, endDate: Long): Flow<List<WorkoutEntity>>
    
    @Query("SELECT * FROM workouts WHERE id = :id")
    suspend fun getWorkoutById(id: Long): WorkoutEntity?
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertWorkout(workout: WorkoutEntity): Long
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertWorkouts(workouts: List<WorkoutEntity>)
    
    @Update
    suspend fun updateWorkout(workout: WorkoutEntity)
    
    @Delete
    suspend fun deleteWorkout(workout: WorkoutEntity)
    
    @Query("DELETE FROM workouts")
    suspend fun deleteAllWorkouts()
    
    @Query("SELECT COUNT(*) FROM workouts WHERE date >= :startDate")
    fun getWorkoutCountSince(startDate: Long): Flow<Int>
    
    @Query("SELECT SUM(duration) FROM workouts WHERE date >= :startDate")
    fun getTotalDurationSince(startDate: Long): Flow<Int?>
}
```

### 3. Repository Implementation mit Clean Architecture

#### WorkoutRepositoryImpl.kt
```kotlin
@Singleton
class WorkoutRepositoryImpl @Inject constructor(
    private val workoutDao: WorkoutDao,
    private val apiService: FitnessApiService,
    private val mapper: WorkoutMapper,
    @IoDispatcher private val ioDispatcher: CoroutineDispatcher
) : IWorkoutRepository {
    
    override fun getWeeklyTrainingPlan(): Flow<Result<Map<String, List<Exercise>>>> = flow {
        try {
            // Try to fetch from API
            val response = apiService.getWeeklyPlan()
            if (response.isSuccessful && response.body() != null) {
                val plan = mapper.mapDtoToDomain(response.body()!!)
                emit(Result.success(plan))
            } else {
                // Fallback to local data
                emit(Result.success(getDefaultPlan()))
            }
        } catch (e: Exception) {
            // Fallback to local data
            emit(Result.success(getDefaultPlan()))
        }
    }.flowOn(ioDispatcher)
    
    override fun getWorkoutHistory(limit: Int): Flow<Result<List<WorkoutProgress>>> = flow {
        workoutDao.getAllWorkouts()
            .map { entities ->
                Result.success(entities.map { mapper.mapEntityToDomain(it) })
            }
            .collect { emit(it) }
    }.flowOn(ioDispatcher)
    
    override suspend fun saveWorkout(workout: WorkoutProgress): Result<Unit> {
        return withContext(ioDispatcher) {
            try {
                val entity = mapper.mapDomainToEntity(workout)
                workoutDao.insertWorkout(entity)
                Result.success(Unit)
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    }
    
    private fun getDefaultPlan(): Map<String, List<Exercise>> = mapOf(
        "Montag" to listOf(
            Exercise("Bankdrücken", 4, 10, 80.0),
            Exercise("Schrägbankdrücken", 3, 12, 60.0),
            Exercise("Butterfly", 3, 15, 40.0)
        ),
        "Dienstag" to listOf(
            Exercise("Kniebeugen", 4, 8, 100.0),
            Exercise("Beinpresse", 3, 12, 150.0),
            Exercise("Beinstrecker", 3, 15, 50.0)
        ),
        // ... mehr Tage
    )
}
```

### 4. Use Cases

#### GetWeeklyTrainingPlanUseCase.kt
```kotlin
@Singleton
class GetWeeklyTrainingPlanUseCase @Inject constructor(
    private val repository: IWorkoutRepository,
    @DefaultDispatcher private val dispatcher: CoroutineDispatcher
) {
    operator fun invoke(): Flow<Result<Map<String, List<Exercise>>>> {
        return repository.getWeeklyTrainingPlan()
            .flowOn(dispatcher)
    }
}
```

#### AnalyzePoseUseCase.kt
```kotlin
@Singleton
class AnalyzePoseUseCase @Inject constructor(
    @DefaultDispatcher private val dispatcher: CoroutineDispatcher
) {
    suspend operator fun invoke(pose: Pose, exercise: Exercise?): PoseAnalysis {
        return withContext(dispatcher) {
            val landmarks = pose.allPoseLandmarks
            
            when (exercise?.name) {
                "Kniebeugen" -> analyzeSquat(landmarks)
                "Bankdrücken" -> analyzeBenchPress(landmarks)
                "Bizeps-Curl" -> analyzeBicepCurl(landmarks)
                else -> PoseAnalysis(
                    isCorrect = true,
                    feedback = "Position erkannt",
                    correctionTips = "",
                    repCompleted = false
                )
            }
        }
    }
    
    private fun analyzeSquat(landmarks: List<PoseLandmark>): PoseAnalysis {
        val leftHip = landmarks[PoseLandmark.LEFT_HIP]
        val rightHip = landmarks[PoseLandmark.RIGHT_HIP]
        val leftKnee = landmarks[PoseLandmark.LEFT_KNEE]
        val rightKnee = landmarks[PoseLandmark.RIGHT_KNEE]
        val leftAnkle = landmarks[PoseLandmark.LEFT_ANKLE]
        val rightAnkle = landmarks[PoseLandmark.RIGHT_ANKLE]
        
        // Calculate angles
        val leftKneeAngle = calculateAngle(leftHip, leftKnee, leftAnkle)
        val rightKneeAngle = calculateAngle(rightHip, rightKnee, rightAnkle)
        
        val isCorrectForm = leftKneeAngle > 90 && rightKneeAngle > 90
        val repCompleted = leftKneeAngle < 100 && previousAngle > 150
        
        return PoseAnalysis(
            isCorrect = isCorrectForm,
            feedback = if (isCorrectForm) "✓ Korrekte Form" else "⚠ Knie zu weit vorne",
            correctionTips = if (!isCorrectForm) "Knie hinter den Zehenspitzen halten" else "",
            repCompleted = repCompleted
        )
    }
    
    private fun calculateAngle(
        firstPoint: PoseLandmark,
        midPoint: PoseLandmark,
        lastPoint: PoseLandmark
    ): Double {
        val radians = atan2(lastPoint.position.y - midPoint.position.y,
                           lastPoint.position.x - midPoint.position.x) -
                     atan2(firstPoint.position.y - midPoint.position.y,
                           firstPoint.position.x - midPoint.position.x)
        var angle = abs(radians * 180.0 / Math.PI)
        if (angle > 180.0) {
            angle = 360.0 - angle
        }
        return angle
    }
}

data class PoseAnalysis(
    val isCorrect: Boolean,
    val feedback: String,
    val correctionTips: String,
    val repCompleted: Boolean
)
```

### 5. Progress Tracking mit Charts

#### ProgressFragment.kt
```kotlin
@AndroidEntryPoint
class ProgressFragment : Fragment(R.layout.fragment_progress) {
    
    private var _binding: FragmentProgressBinding? = null
    private val binding get() = _binding!!
    
    private val viewModel: ProgressViewModel by viewModels()
    private lateinit var chartManager: ChartManager
    
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        _binding = FragmentProgressBinding.bind(view)
        
        chartManager = ChartManager(requireContext())
        
        setupCharts()
        setupObservers()
    }
    
    private fun setupCharts() {
        // Weight Progress Chart
        chartManager.setupLineChart(
            chart = binding.chartWeight,
            title = "Gewicht Progression",
            xAxisLabel = "Woche",
            yAxisLabel = "kg"
        )
        
        // Volume Chart
        chartManager.setupBarChart(
            chart = binding.chartVolume,
            title = "Trainingsvolumen",
            xAxisLabel = "Woche",
            yAxisLabel = "Sets × Reps"
        )
        
        // Body Composition
        chartManager.setupPieChart(
            chart = binding.chartBody,
            title = "Körperzusammensetzung"
        )
    }
    
    private fun setupObservers() {
        viewLifecycleOwner.lifecycleScope.launch {
            viewLifecycleOwner.repeatOnLifecycle(Lifecycle.State.STARTED) {
                launch {
                    viewModel.progressData.collect { data ->
                        updateCharts(data)
                    }
                }
                
                launch {
                    viewModel.statistics.collect { stats ->
                        updateStatistics(stats)
                    }
                }
            }
        }
    }
    
    private fun updateCharts(data: ProgressData) {
        chartManager.updateLineChart(
            binding.chartWeight,
            data.weightHistory
        )
        
        chartManager.updateBarChart(
            binding.chartVolume,
            data.volumeHistory
        )
        
        chartManager.updatePieChart(
            binding.chartBody,
            data.bodyComposition
        )
    }
    
    private fun updateStatistics(stats: Statistics) {
        binding.apply {
            textTotalWorkouts.text = stats.totalWorkouts.toString()
            textTotalVolume.text = "${stats.totalVolume} kg"
            textAverageWorkouts.text = "${stats.averageWorkoutsPerWeek}/Woche"
            textPersonalBests.text = stats.personalBests.toString()
        }
    }
}
```

#### ChartManager.kt
```kotlin
class ChartManager(private val context: Context) {
    
    fun setupLineChart(
        chart: LineChart,
        title: String,
        xAxisLabel: String,
        yAxisLabel: String
    ) {
        chart.apply {
            description.isEnabled = true
            description.text = title
            description.textColor = context.getColor(R.color.neon_cyan)
            description.textSize = 14f
            
            setDrawGridBackground(false)
            setBackgroundColor(Color.TRANSPARENT)
            
            legend.apply {
                textColor = context.getColor(R.color.neon_cyan)
                textSize = 12f
            }
            
            xAxis.apply {
                position = XAxis.XAxisPosition.BOTTOM
                textColor = context.getColor(R.color.neon_cyan)
                setDrawGridLines(false)
                granularity = 1f
            }
            
            axisLeft.apply {
                textColor = context.getColor(R.color.neon_cyan)
                setDrawGridLines(true)
                gridColor = context.getColor(R.color.dark_outline)
            }
            
            axisRight.isEnabled = false
            
            setTouchEnabled(true)
            setPinchZoom(true)
            
            animateX(1000, Easing.EaseInOutQuad)
        }
    }
    
    fun updateLineChart(chart: LineChart, data: List<Pair<Float, Float>>) {
        val entries = data.map { Entry(it.first, it.second) }
        
        val dataSet = LineDataSet(entries, "Progress").apply {
            color = context.getColor(R.color.neon_cyan)
            setCircleColor(context.getColor(R.color.neon_cyan))
            lineWidth = 2f
            circleRadius = 4f
            setDrawValues(true)
            valueTextColor = context.getColor(R.color.neon_cyan)
            valueTextSize = 10f
            mode = LineDataSet.Mode.CUBIC_BEZIER
            setDrawFilled(true)
            fillColor = context.getColor(R.color.neon_cyan)
            fillAlpha = 50
        }
        
        chart.data = LineData(dataSet)
        chart.invalidate()
    }
    
    fun setupBarChart(
        chart: BarChart,
        title: String,
        xAxisLabel: String,
        yAxisLabel: String
    ) {
        chart.apply {
            description.text = title
            description.textColor = context.getColor(R.color.neon_purple)
            
            setDrawGridBackground(false)
            setBackgroundColor(Color.TRANSPARENT)
            
            xAxis.apply {
                position = XAxis.XAxisPosition.BOTTOM
                textColor = context.getColor(R.color.neon_purple)
                setDrawGridLines(false)
            }
            
            axisLeft.apply {
                textColor = context.getColor(R.color.neon_purple)
                gridColor = context.getColor(R.color.dark_outline)
            }
            
            axisRight.isEnabled = false
            
            animateY(1000, Easing.EaseInOutQuad)
        }
    }
    
    fun setupPieChart(chart: PieChart, title: String) {
        chart.apply {
            description.text = title
            description.textColor = context.getColor(R.color.neon_green)
            
            setUsePercentValues(true)
            setDrawCenterText(true)
            centerText = "Body\nComposition"
            setCenterTextColor(context.getColor(R.color.neon_green))
            
            legend.apply {
                textColor = context.getColor(R.color.neon_green)
                textSize = 12f
            }
            
            setHoleColor(Color.TRANSPARENT)
            setTransparentCircleColor(Color.WHITE)
            setTransparentCircleAlpha(50)
            holeRadius = 50f
            transparentCircleRadius = 55f
            
            animateY(1000, Easing.EaseInOutQuad)
        }
    }
}
```

---

## 🧪 Testing Strategy

### Unit Tests

#### WorkoutRepositoryTest.kt
```kotlin
@ExperimentalCoroutinesTest
class WorkoutRepositoryTest {
    
    @get:Rule
    val instantExecutorRule = InstantTaskExecutorRule()
    
    private lateinit var repository: WorkoutRepositoryImpl
    private lateinit var workoutDao: WorkoutDao
    private lateinit var apiService: FitnessApiService
    private val testDispatcher = StandardTestDispatcher()
    
    @Before
    fun setup() {
        workoutDao = mockk()
        apiService = mockk()
        repository = WorkoutRepositoryImpl(
            workoutDao,
            apiService,
            WorkoutMapper(),
            testDispatcher
        )
    }
    
    @Test
    fun `getWeeklyTrainingPlan returns success`() = runTest {
        // Given
        val expectedPlan = mapOf("Montag" to listOf(Exercise("Test", 3, 10, 50.0)))
        coEvery { apiService.getWeeklyPlan() } returns Response.success(
            WeeklyPlanDto(expectedPlan)
        )
        
        // When
        val result = repository.getWeeklyTrainingPlan().first()
        
        // Then
        assertTrue(result.isSuccess)
        assertEquals(expectedPlan, result.getOrNull())
    }
    
    @Test
    fun `saveWorkout persists to database`() = runTest {
        // Given
        val workout = WorkoutProgress(
            date = System.currentTimeMillis(),
            exerciseName = "Squats",
            reps = 10,
            sets = 3,
            weight = 100.0
        )
        coEvery { workoutDao.insertWorkout(any()) } returns 1L
        
        // When
        val result = repository.saveWorkout(workout)
        
        // Then
        assertTrue(result.isSuccess)
        coVerify { workoutDao.insertWorkout(any()) }
    }
}
```

### UI Tests

#### ARCoachActivityTest.kt
```kotlin
@HiltAndroidTest
class ARCoachActivityTest {
    
    @get:Rule(order = 0)
    val hiltRule = HiltAndroidRule(this)
    
    @get:Rule(order = 1)
    val activityRule = ActivityScenarioRule(ARCoachActivity::class.java)
    
    @Before
    fun setup() {
        hiltRule.inject()
    }
    
    @Test
    fun whenActivityStarts_cameraPermissionRequested() {
        onView(withId(R.id.previewView))
            .check(matches(isDisplayed()))
    }
    
    @Test
    fun whenPauseButtonClicked_sessionPauses() {
        onView(withId(R.id.btnPauseAr))
            .perform(click())
        
        onView(withId(R.id.textStatus))
            .check(matches(withText(containsString("Pausiert"))))
    }
    
    @Test
    fun whenRepCompleted_counterIncreases() {
        // Simulate pose detection
        onView(withId(R.id.textRepCount))
            .check(matches(withText("0")))
        
        // Trigger rep completion
        // ... test logic
        
        onView(withId(R.id.textRepCount))
            .check(matches(withText("1")))
    }
}
```

---

## 📱 UI Components

### Custom Views

#### NeonButton.kt
```kotlin
class NeonButton @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = 0
) : MaterialButton(context, attrs, defStyleAttr) {
    
    private val paint = Paint().apply {
        style = Paint.Style.STROKE
        strokeWidth = 4f
        isAntiAlias = true
    }
    
    private val glowPaint = Paint().apply {
        style = Paint.Style.STROKE
        strokeWidth = 8f
        isAntiAlias = true
        maskFilter = BlurMaskFilter(10f, BlurMaskFilter.Blur.OUTER)
    }
    
    init {
        setBackgroundColor(Color.TRANSPARENT)
        val neonColor = ContextCompat.getColor(context, R.color.neon_cyan)
        paint.color = neonColor
        glowPaint.color = neonColor
    }
    
    override fun onDraw(canvas: Canvas) {
        val rect = RectF(0f, 0f, width.toFloat(), height.toFloat())
        val cornerRadius = 12f
        
        // Draw glow
        canvas.drawRoundRect(rect, cornerRadius, cornerRadius, glowPaint)
        
        // Draw border
        canvas.drawRoundRect(rect, cornerRadius, cornerRadius, paint)
        
        super.onDraw(canvas)
    }
}
```

#### PoseOverlayView.kt
```kotlin
class PoseOverlayView @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = 0
) : View(context, attrs, defStyleAttr) {
    
    private var pose: Pose? = null
    
    private val paint = Paint().apply {
        color = ContextCompat.getColor(context, R.color.neon_cyan)
        strokeWidth = 8f
        style = Paint.Style.STROKE
        isAntiAlias = true
    }
    
    private val pointPaint = Paint().apply {
        color = ContextCompat.getColor(context, R.color.neon_green)
        style = Paint.Style.FILL
        isAntiAlias = true
    }
    
    fun drawPose(pose: Pose) {
        this.pose = pose
        invalidate()
    }
    
    override fun onDraw(canvas: Canvas) {
        super.onDraw(canvas)
        
        pose?.let { currentPose ->
            // Draw skeleton
            drawLine(canvas, currentPose, PoseLandmark.LEFT_SHOULDER, PoseLandmark.RIGHT_SHOULDER)
            drawLine(canvas, currentPose, PoseLandmark.LEFT_SHOULDER, PoseLandmark.LEFT_ELBOW)
            drawLine(canvas, currentPose, PoseLandmark.LEFT_ELBOW, PoseLandmark.LEFT_WRIST)
            drawLine(canvas, currentPose, PoseLandmark.RIGHT_SHOULDER, PoseLandmark.RIGHT_ELBOW)
            drawLine(canvas, currentPose, PoseLandmark.RIGHT_ELBOW, PoseLandmark.RIGHT_WRIST)
            
            drawLine(canvas, currentPose, PoseLandmark.LEFT_SHOULDER, PoseLandmark.LEFT_HIP)
            drawLine(canvas, currentPose, PoseLandmark.RIGHT_SHOULDER, PoseLandmark.RIGHT_HIP)
            drawLine(canvas, currentPose, PoseLandmark.LEFT_HIP, PoseLandmark.RIGHT_HIP)
            
            drawLine(canvas, currentPose, PoseLandmark.LEFT_HIP, PoseLandmark.LEFT_KNEE)
            drawLine(canvas, currentPose, PoseLandmark.LEFT_KNEE, PoseLandmark.LEFT_ANKLE)
            drawLine(canvas, currentPose, PoseLandmark.RIGHT_HIP, PoseLandmark.RIGHT_KNEE)
            drawLine(canvas, currentPose, PoseLandmark.RIGHT_KNEE, PoseLandmark.RIGHT_ANKLE)
            
            // Draw joints
            currentPose.allPoseLandmarks.forEach { landmark ->
                canvas.drawCircle(
                    landmark.position.x,
                    landmark.position.y,
                    12f,
                    pointPaint
                )
            }
        }
    }
    
    private fun drawLine(canvas: Canvas, pose: Pose, startLandmark: Int, endLandmark: Int) {
        val start = pose.getPoseLandmark(startLandmark) ?: return
        val end = pose.getPoseLandmark(endLandmark) ?: return
        
        canvas.drawLine(
            start.position.x,
            start.position.y,
            end.position.x,
            end.position.y,
            paint
        )
    }
}
```

---

## 🔐 Security & Best Practices

### ProGuard Rules
```proguard
# IronReign Pro ProGuard Rules

# Keep Models
-keep class com.example.ironreign.domain.model.** { *; }
-keep class com.example.ironreign.data.remote.dto.** { *; }

# Retrofit
-keepattributes Signature
-keepattributes Exceptions
-keep class retrofit2.** { *; }

# Room
-keep class * extends androidx.room.RoomDatabase
-keep @androidx.room.Entity class *
-dontwarn androidx.room.paging.**

# ML Kit
-keep class com.google.mlkit.** { *; }
-dontwarn com.google.mlkit.**

# ARCore
-keep class com.google.ar.** { *; }
-dontwarn com.google.ar.**

# Kotlin Coroutines
-keepnames class kotlinx.coroutines.internal.MainDispatcherFactory {}
-keepnames class kotlinx.coroutines.CoroutineExceptionHandler {}

# Remove Logging in Release
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** v(...);
    public static *** i(...);
}
```

### Security Checklist
```kotlin
// Constants.kt
object SecurityConstants {
    // Use BuildConfig for sensitive data
    const val API_BASE_URL = BuildConfig.API_URL
    
    // Encrypt preferences
    val encryptedPrefs: SharedPreferences by lazy {
        EncryptedSharedPreferences.create(
            context,
            "secret_shared_prefs",
            MasterKeys.getOrCreate(MasterKeys.AES256_GCM_SPEC),
            EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
            EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM
        )
    }
    
    // Certificate Pinning
    val certificatePinner = CertificatePinner.Builder()
        .add("api.ironreign.com", "sha256/XXXXXXXXXXXX")
        .build()
}
```

---

## 📊 Performance Optimization

### Memory Management
```kotlin
class ImageOptimizer {
    fun optimizeForDisplay(bitmap: Bitmap, targetWidth: Int, targetHeight: Int): Bitmap {
        val aspectRatio = bitmap.width.toFloat() / bitmap.height.toFloat()
        val scaledWidth: Int
        val scaledHeight: Int
        
        if (aspectRatio > 1) {
            scaledWidth = targetWidth
            scaledHeight = (targetWidth / aspectRatio).toInt()
        } else {
            scaledHeight = targetHeight
            scaledWidth = (targetHeight * aspectRatio).toInt()
        }
        
        return Bitmap.createScaledBitmap(bitmap, scaledWidth, scaledHeight, true)
    }
    
    fun releaseResources(bitmap: Bitmap?) {
        bitmap?.recycle()
    }
}
```

### Background Processing
```kotlin
@HiltWorker
class WorkoutSyncWorker @AssistedInject constructor(
    @Assisted context: Context,
    @Assisted params: WorkerParameters,
    private val repository: IWorkoutRepository
) : CoroutineWorker(context, params) {
    
    override suspend fun doWork(): Result {
        return try {
            // Sync workout data to server
            repository.syncWorkouts()
            Result.success()
        } catch (e: Exception) {
            if (runAttemptCount < 3) {
                Result.retry()
            } else {
                Result.failure()
            }
        }
    }
    
    companion object {
        const val WORK_NAME = "workout_sync"
        
        fun schedule(context: Context) {
            val constraints = Constraints.Builder()
                .setRequiredNetworkType(NetworkType.CONNECTED)
                .setRequiresBatteryNotLow(true)
                .build()
            
            val request = PeriodicWorkRequestBuilder<WorkoutSyncWorker>(
                repeatInterval = 1,
                repeatIntervalTimeUnit = TimeUnit.DAYS
            )
                .setConstraints(constraints)
                .build()
            
            WorkManager.getInstance(context)
                .enqueueUniquePeriodicWork(
                    WORK_NAME,
                    ExistingPeriodicWorkPolicy.KEEP,
                    request
                )
        }
    }
}
```

---

## 🎨 UI/UX Guidelines

### Animation Standards
```kotlin
object AnimationConstants {
    const val DURATION_SHORT = 150L
    const val DURATION_MEDIUM = 300L
    const val DURATION_LONG = 500L
    
    val INTERPOLATOR_STANDARD = FastOutSlowInInterpolator()
    val INTERPOLATOR_EMPHASIZED = PathInterpolator(0.05f, 0.7f, 0.1f, 1.0f)
}

// Usage
view.animate()
    .alpha(1f)
    .translationY(0f)
    .setDuration(AnimationConstants.DURATION_MEDIUM)
    .setInterpolator(AnimationConstants.INTERPOLATOR_EMPHASIZED)
    .start()
```

### Accessibility
```kotlin
// String resources with content descriptions
<string name="ar_coach_start">AR Coach starten</string>
<string name="ar_coach_start_description">Startet die Augmented Reality Trainingsansicht mit Pose-Erkennung</string>

// In code
button.contentDescription = getString(R.string.ar_coach_start_description)

// Support TalkBack
view.importantForAccessibility = View.IMPORTANT_FOR_ACCESSIBILITY_YES
```

---

## 📱 Additional Features

### Push Notifications
```kotlin
class NotificationManager @Inject constructor(
    private val context: Context
) {
    private val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
    
    init {
        createNotificationChannels()
    }
    
    private fun createNotificationChannels() {
        val workoutChannel = NotificationChannel(
            CHANNEL_WORKOUT,
            "Workout Reminders",
            NotificationManager.IMPORTANCE_HIGH
        ).apply {
            description = "Reminders for scheduled workouts"
            enableLights(true)
            lightColor = Color.CYAN
            enableVibration(true)
        }
        
        notificationManager.createNotificationChannel(workoutChannel)
    }
    
    fun sendWorkoutReminder(workoutName: String, time: String) {
        val notification = NotificationCompat.Builder(context, CHANNEL_WORKOUT)
            .setSmallIcon(R.drawable.ic_notification)
            .setContentTitle("Zeit für Training!")
            .setContentText("$workoutName um $time")
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setAutoCancel(true)
            .build()
        
        notificationManager.notify(NOTIFICATION_ID_WORKOUT, notification)
    }
    
    companion object {
        const val CHANNEL_WORKOUT = "workout_channel"
        const val NOTIFICATION_ID_WORKOUT = 1001
    }
}
```

### Widget Support
```xml
<!-- widget_workout_progress.xml -->
<LinearLayout
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    android:padding="16dp"
    android:background="@drawable/widget_background">
    
    <TextView
        android:id="@+id/widget_title"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="@string/todays_progress"
        android:textColor="@color/neon_cyan"
        android:textSize="14sp"/>
    
    <ProgressBar
        android:id="@+id/widget_progress"
        style="@style/Widget.AppCompat.ProgressBar.Horizontal"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:progress="75"/>
</LinearLayout>
```

---

## 🚀 Deployment Checklist

### Pre-Release
- [ ] All unit tests passing
- [ ] All UI tests passing
- [ ] Lint warnings resolved
- [ ] ProGuard rules verified
- [ ] App size optimized (< 20 MB)
- [ ] Permissions properly requested
- [ ] Crash reporting configured
- [ ] Analytics configured
- [ ] Version numbers updated

### Play Store
- [ ] App signing configured
- [ ] Feature graphic created (1024x500)
- [ ] Screenshots prepared (all devices)
- [ ] App description written
- [ ] Privacy policy URL added
- [ ] Content rating completed

---

## 📚 Documentation

### Code Documentation
```kotlin
/**
 * Analyzes a detected pose and provides real-time feedback.
 *
 * This use case processes ML Kit pose data and compares it against
 * the expected form for a specific exercise. It calculates joint
 * angles and detects movement patterns to count repetitions and
 * provide form correction tips.
 *
 * @param pose The detected pose from ML Kit
 * @param exercise The current exercise being performed
 * @return PoseAnalysis containing feedback and rep count
 *
 * @see PoseAnalysis
 * @see Exercise
 *
 * Example:
 * ```kotlin
 * val analysis = analyzePoseUseCase(detectedPose, squatExercise)
 * if (!analysis.isCorrect) {
 *     showFeedback(analysis.correctionTips)
 * }
 * ```
 */
suspend operator fun invoke(pose: Pose, exercise: Exercise?): PoseAnalysis
```

---

## ✅ Implementation Checklist

### Phase 1: Setup (Week 1)
- [ ] Create project structure
- [ ] Setup Hilt dependency injection
- [ ] Configure Room database
- [ ] Setup Retrofit API
- [ ] Create base fragments & activities

### Phase 2: Core Features (Week 2-3)
- [ ] Implement training plan UI
- [ ] Implement workout tracking
- [ ] Implement progress charts
- [ ] Implement nutrition tracking
- [ ] Implement settings

### Phase 3: AR & ML (Week 4-5)
- [ ] Setup ARCore
- [ ] Integrate ML Kit pose detection
- [ ] Implement rep counting logic
- [ ] Implement form analysis
- [ ] Add visual feedback overlay

### Phase 4: Polish (Week 6)
- [ ] Add animations
- [ ] Implement themes
- [ ] Add sound effects
- [ ] Optimize performance
- [ ] Write tests

### Phase 5: Release (Week 7)
- [ ] Bug fixes
- [ ] Final testing
- [ ] Prepare Play Store assets
- [ ] Submit to Play Store

---

## 🎯 Success Metrics

- Code Coverage: > 80%
- Crash-free rate: > 99%
- App size: < 20 MB
- Cold start time: < 3s
- Frame rate: 60 FPS (UI), 30 FPS (AR)
- Memory usage: < 200 MB

---

## 📞 Support Resources

- Android Documentation: https://developer.android.com
- ML Kit Docs: https://developers.google.com/ml-kit
- ARCore Docs: https://developers.google.com/ar
- Material Design: https://m3.material.io/
- Kotlin Docs: https://kotlinlang.org/docs/

---

**Ende des Prompts**

Dieser komplette Prompt kann als Basis für die Entwicklung der vollständigen IronReign Pro App in Android Studio verwendet werden. Alle wichtigen Komponenten, Best Practices und Code-Beispiele sind enthalten.
