package com.example.ironreign.ui.viewmodels

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.ironreign.data.WorkoutRepository
import com.example.ironreign.data.model.TrainingDay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch

/**
 * ViewModel for managing the training plan state.
 * Follows MVVM architecture with unidirectional data flow using StateFlow.
 */
class TrainingsViewModel(
    private val repository: WorkoutRepository = WorkoutRepository()
) : ViewModel() {

    private val _trainingPlan = MutableStateFlow<Map<String, List<String>>>(emptyMap())
    val trainingPlan: StateFlow<Map<String, List<String>>> = _trainingPlan.asStateFlow()

    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()

    private val _errorMessage = MutableStateFlow<String?>(null)
    val errorMessage: StateFlow<String?> = _errorMessage.asStateFlow()

    init {
        loadTrainingPlan()
    }

    /**
     * Loads the weekly training plan from the repository.
     * Uses coroutines for asynchronous loading.
     */
    private fun loadTrainingPlan() {
        viewModelScope.launch {
            _isLoading.value = true
            _errorMessage.value = null
            
            try {
                val plan = repository.getWeeklyTrainingPlan()
                _trainingPlan.value = plan
            } catch (e: Exception) {
                _errorMessage.value = "Fehler beim Laden des Trainingsplans: ${e.message}"
            } finally {
                _isLoading.value = false
            }
        }
    }

    /**
     * Refreshes the training plan.
     */
    fun refresh() {
        loadTrainingPlan()
    }

    /**
     * Clears any error messages.
     */
    fun clearError() {
        _errorMessage.value = null
    }
}
