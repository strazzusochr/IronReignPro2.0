package com.example.ironreign.data.model

/**
 * Data model representing a training day with exercises.
 * Uses Kotlin data class for automatic equals, hashCode, toString, and copy.
 */
data class TrainingDay(
    val dayOfWeek: String,
    val exercises: List<String>,
    val isRestDay: Boolean = false
) {
    companion object {
        /**
         * Creates a rest day instance.
         */
        fun restDay(dayOfWeek: String) = TrainingDay(
            dayOfWeek = dayOfWeek,
            exercises = emptyList(),
            isRestDay = true
        )
    }
}

/**
 * Data model for workout progress tracking.
 */
data class WorkoutProgress(
    val date: Long, // Unix timestamp
    val exerciseName: String,
    val sets: Int,
    val reps: Int,
    val weight: Double, // in kg
    val notes: String = ""
)

/**
 * Data model for nutrition tracking.
 */
data class NutritionEntry(
    val date: Long,
    val mealType: MealType,
    val calories: Int,
    val protein: Double,
    val carbs: Double,
    val fats: Double,
    val description: String = ""
)

enum class MealType {
    BREAKFAST,
    LUNCH,
    DINNER,
    SNACK
}
