package com.example.ironreign

import com.google.mlkit.vision.pose.Pose

/**
 * A simple service to encapsulate pose processing logic. At present this class
 * implements a placeholder repetition counter that can be extended to support
 * real‑time exercise tracking. It demonstrates how state can be maintained
 * independently of the Activity or Fragment lifecycle.
 */
object PoseDetectionService {
    private var repCount = 0
    private var isInPosition = false

    /**
     * Processes the supplied pose and updates the internal repetition count. A
     * future implementation could inspect joint angles or distances to detect
     * when the user completes a full movement. For now the counter simply
     * returns its current value.
     */
    fun processPose(pose: Pose): Int {
        // TODO: implement real repetition detection using pose landmarks
        return repCount
    }

    /**
     * Resets the repetition counter. This can be called when the user starts a
     * new exercise or workout session.
     */
    fun reset() {
        repCount = 0
        isInPosition = false
    }
}
