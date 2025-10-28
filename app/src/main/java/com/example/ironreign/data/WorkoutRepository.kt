package com.example.ironreign.data

import com.example.ironreign.data.model.TrainingDay
import com.example.ironreign.data.model.WorkoutProgress
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow

/**
 * Repository providing workout data following the Repository pattern.
 * Acts as single source of truth for workout and training plan data.
 * In a production app, this would interact with Room database or Retrofit API.
 * 
 * Follows Clean Architecture principles by separating data access from business logic.
 */
class WorkoutRepository {
    
    /**
     * Predefined weekly training plan.
     * Monday through Thursday: Focused muscle group workouts
     * Friday: Rest/Recovery day
     * Weekend: Flexible
     */
    private val trainingsPlan: Map<String, List<String>> = mapOf(
        "Montag" to listOf("Brust", "Schultern", "Trizeps"),
        "Dienstag" to listOf("Beinstrecker", "Waden", "Bauch"),
        "Mittwoch" to listOf("Rücken", "Bizeps"),
        "Donnerstag" to listOf("Beinbeuger", "Po", "Bauch"),
        "Freitag" to listOf("Pause"),
        "Samstag" to listOf(),
        "Sonntag" to listOf()
    )

    /**
     * Returns the complete weekly training plan.
     * Simulates async data loading with delay.
     */
    suspend fun getWeeklyTrainingPlan(): Map<String, List<String>> {
        // Simulate network/database delay
        delay(300)
        return trainingsPlan
    }

    /**
     * Returns training plan as Flow for reactive updates.
     * In production, this would observe Room database changes.
     */
    fun getTrainingPlanFlow(): Flow<Map<String, List<String>>> = flow {
        delay(300) // Simulate loading
        emit(trainingsPlan)
    }

    /**
     * Gets training plan for a specific day.
     */
    suspend fun getTrainingForDay(dayOfWeek: String): List<String> {
        delay(100)
        return trainingsPlan[dayOfWeek] ?: emptyList()
    }

    /**
     * Mock workout progress data for demonstration.
     * In production, this would query Room database.
     */
    suspend fun getWorkoutHistory(limit: Int = 30): List<WorkoutProgress> {
        delay(300)
        // Return mock data - in real app, query from database
        return listOf(
            WorkoutProgress(
                date = System.currentTimeMillis() - (86400000L * 1), // Yesterday
                exerciseName = "Bankdrücken",
                sets = 3,
                reps = 10,
                weight = 80.0
            ),
            WorkoutProgress(
                date = System.currentTimeMillis() - (86400000L * 2),
                exerciseName = "Kniebeugen",
                sets = 4,
                reps = 8,
                weight = 100.0
            )
        )
    }

    /**
     * Saves workout progress.
     * In production, this would insert into Room database.
     */
    suspend fun saveWorkoutProgress(progress: WorkoutProgress): Boolean {
        delay(200)
        // Simulate database insert
        return true
    }
}

