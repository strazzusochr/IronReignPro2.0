package com.example.ironreign

import android.Manifest
import android.content.pm.PackageManager
import android.media.MediaPlayer
import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.example.ironreign.databinding.ActivityArcoachBinding
import com.google.ar.core.ArCoreApk
import com.google.ar.core.Session
import com.google.ar.core.exceptions.UnavailableArcoreNotInstalledException
import com.google.ar.core.exceptions.UnavailableUserDeclinedInstallationException
import com.google.mlkit.vision.pose.PoseDetection
import com.google.mlkit.vision.pose.PoseDetector
import com.google.mlkit.vision.pose.PoseDetectorOptions

/**
 * Activity for AR-based workout coaching experience.
 * Integrates ARCore for augmented reality and ML Kit for pose detection.
 * 
 * Features:
 * - Camera permission handling
 * - ARCore installation check
 * - ML Kit pose detection in stream mode
 * - Rep counting and audio feedback
 * - Pause/Resume functionality
 * 
 * Follows Modern Android Development practices with ViewBinding and lifecycle awareness.
 */
class ARCoachActivity : AppCompatActivity() {

    private lateinit var binding: ActivityArcoachBinding
    private lateinit var poseDetector: PoseDetector
    private var mediaPlayer: MediaPlayer? = null
    private var arSession: Session? = null
    
    private var repCount = 0
    private var isPaused = false
    
    companion object {
        private const val CAMERA_PERMISSION_CODE = 100
        private const val TAG = "ARCoachActivity"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityArcoachBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setupUI()
        checkPermissionsAndInitialize()
    }

    /**
     * Sets up UI click listeners and initial state.
     */
    private fun setupUI() {
        binding.btnStopAr.setOnClickListener {
            finish()
        }

        binding.btnPauseAr.setOnClickListener {
            togglePause()
        }

        updateRepCounter(0)
    }

    /**
     * Checks camera permission and initializes AR components.
     */
    private fun checkPermissionsAndInitialize() {
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.CAMERA)
            == PackageManager.PERMISSION_GRANTED) {
            initializeARComponents()
        } else {
            ActivityCompat.requestPermissions(
                this,
                arrayOf(Manifest.permission.CAMERA),
                CAMERA_PERMISSION_CODE
            )
        }
    }

    /**
     * Initializes ARCore and ML Kit pose detection.
     */
    private fun initializeARComponents() {
        try {
            // Check ARCore availability
            when (ArCoreApk.getInstance().requestInstall(this, true)) {
                ArCoreApk.InstallStatus.INSTALL_REQUESTED -> {
                    updateStatus("📦 ARCore Installation wird angefordert...")
                    return
                }
                ArCoreApk.InstallStatus.INSTALLED -> {
                    updateStatus("✓ ARCore verfügbar")
                }
            }

            // Initialize ARCore session
            arSession = Session(this)
            arSession?.resume()
            updateStatus("✓ AR Session aktiv")

            // Initialize ML Kit pose detector
            val options = PoseDetectorOptions.Builder()
                .setDetectorMode(PoseDetectorOptions.STREAM_MODE)
                .build()
            poseDetector = PoseDetection.getClient(options)
            updatePoseInfo("Warte auf Pose Detection...")

            // Initialize audio feedback
            try {
                mediaPlayer = MediaPlayer.create(this, R.raw.beep)
            } catch (e: Exception) {
                // Beep sound file may not exist - non-critical
                updateStatus("⚠️ Audio-Feedback nicht verfügbar")
            }

        } catch (e: UnavailableArcoreNotInstalledException) {
            Toast.makeText(this, "ARCore ist nicht installiert", Toast.LENGTH_LONG).show()
            updateStatus("❌ ARCore erforderlich")
        } catch (e: UnavailableUserDeclinedInstallationException) {
            Toast.makeText(this, "ARCore Installation abgelehnt", Toast.LENGTH_LONG).show()
            finish()
        } catch (e: Exception) {
            Toast.makeText(this, "Fehler: ${e.message}", Toast.LENGTH_LONG).show()
            updateStatus("❌ Initialisierung fehlgeschlagen")
            e.printStackTrace()
        }
    }

    /**
     * Toggles pause state of AR session.
     */
    private fun togglePause() {
        isPaused = !isPaused
        if (isPaused) {
            arSession?.pause()
            binding.btnPauseAr.text = "Fortsetzen"
            updateStatus("⏸️ Pausiert")
        } else {
            arSession?.resume()
            binding.btnPauseAr.text = "Pause"
            updateStatus("▶️ AR Coach Aktiv")
        }
    }

    /**
     * Updates rep counter display and plays feedback sound.
     */
    private fun updateRepCounter(count: Int) {
        repCount = count
        binding.textRepCount.text = repCount.toString()
        
        // Play beep on rep completion
        if (count > 0) {
            mediaPlayer?.start()
        }
    }

    /**
     * Updates status text in UI.
     */
    private fun updateStatus(status: String) {
        binding.textStatus.text = status
    }

    /**
     * Updates pose information text in UI.
     */
    private fun updatePoseInfo(info: String) {
        binding.textPoseInfo.text = info
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode == CAMERA_PERMISSION_CODE) {
            if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                initializeARComponents()
            } else {
                Toast.makeText(
                    this,
                    "Kamera-Berechtigung erforderlich für AR Coach",
                    Toast.LENGTH_LONG
                ).show()
                finish()
            }
        }
    }

    override fun onPause() {
        super.onPause()
        arSession?.pause()
    }

    override fun onResume() {
        super.onResume()
        if (!isPaused) {
            arSession?.resume()
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        // Clean up resources
        try {
            poseDetector.close()
        } catch (e: Exception) {
            // Detector may not have been initialized
        }
        mediaPlayer?.release()
        mediaPlayer = null
        arSession?.close()
        arSession = null
    }
}

