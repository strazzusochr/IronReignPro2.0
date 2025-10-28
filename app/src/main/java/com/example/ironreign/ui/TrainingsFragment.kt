package com.example.ironreign.ui

import android.os.Bundle
import android.view.View
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.lifecycleScope
import androidx.lifecycle.repeatOnLifecycle
import com.example.ironreign.R
import com.example.ironreign.databinding.FragmentTrainingsBinding
import com.example.ironreign.ui.viewmodels.TrainingsViewModel
import com.google.android.material.snackbar.Snackbar
import kotlinx.coroutines.launch

/**
 * Fragment displaying the weekly training plan using MVVM architecture.
 * Observes ViewModel state using StateFlow and Lifecycle-aware coroutines.
 * Follows Modern Android Development best practices.
 */
class TrainingsFragment : Fragment(R.layout.fragment_trainings) {

    // Lazy initialization of ViewModel using by viewModels() delegate
    private val viewModel: TrainingsViewModel by viewModels()
    
    private var _binding: FragmentTrainingsBinding? = null
    private val binding get() = _binding!!

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        _binding = FragmentTrainingsBinding.bind(view)

        setupObservers()
        setupUI()
    }

    /**
     * Sets up StateFlow observers using lifecycle-aware coroutines.
     * Automatically cancels when Fragment is not in STARTED state.
     */
    private fun setupObservers() {
        viewLifecycleOwner.lifecycleScope.launch {
            viewLifecycleOwner.repeatOnLifecycle(Lifecycle.State.STARTED) {
                // Observe training plan
                launch {
                    viewModel.trainingPlan.collect { plan ->
                        updateTrainingPlanUI(plan)
                    }
                }

                // Observe loading state
                launch {
                    viewModel.isLoading.collect { isLoading ->
                        // Show/hide loading indicator
                        // binding.progressBar.visibility = if (isLoading) View.VISIBLE else View.GONE
                    }
                }

                // Observe errors
                launch {
                    viewModel.errorMessage.collect { error ->
                        error?.let {
                            Snackbar.make(binding.root, it, Snackbar.LENGTH_LONG)
                                .setAction("Erneut versuchen") {
                                    viewModel.refresh()
                                }
                                .show()
                            viewModel.clearError()
                        }
                    }
                }
            }
        }
    }

    /**
     * Sets up UI components and click listeners.
     */
    private fun setupUI() {
        // Future: Add swipe-to-refresh functionality
        // binding.swipeRefresh.setOnRefreshListener {
        //     viewModel.refresh()
        // }
    }

    /**
     * Updates the training plan display with formatted text.
     */
    private fun updateTrainingPlanUI(plan: Map<String, List<String>>) {
        val planString = buildString {
            plan.forEach { (day, exercises) ->
                append("📅 ")
                append(day)
                append("\n")
                if (exercises.isEmpty() || exercises.contains("Pause")) {
                    append("   💤 Ruhetag\n")
                } else {
                    exercises.forEach { exercise ->
                        append("   • ")
                        append(exercise)
                        append("\n")
                    }
                }
                append("\n")
            }
        }
        binding.textPlanDetails.text = planString.trimEnd()
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null // Prevent memory leaks
    }
}

