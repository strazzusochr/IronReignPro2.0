package com.example.ironreign.ui

import android.content.Intent
import android.os.Bundle
import android.view.View
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import com.example.ironreign.ARCoachActivity
import com.example.ironreign.R
import com.example.ironreign.databinding.FragmentMenuBinding

/**
 * The main menu fragment presents the user with navigation options. Each button
 * either launches a new Activity (for the AR coach) or navigates to another
 * fragment defined in the navigation graph. View binding is used to
 * reference views without the need for findViewById calls.
 */
class MenuFragment : Fragment(R.layout.fragment_menu) {

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        val binding = FragmentMenuBinding.bind(view)

        // Launch the AR coach Activity
        binding.btnArCoach.setOnClickListener {
            val context = requireContext()
            val intent = Intent(context, ARCoachActivity::class.java)
            startActivity(intent)
        }

        // Navigate to the trainings plan fragment
        binding.btnTrainingsplan.setOnClickListener {
            findNavController().navigate(R.id.action_menuFragment_to_trainingsFragment)
        }

        // Navigate to the progress fragment
        binding.btnProgress.setOnClickListener {
            findNavController().navigate(R.id.action_menuFragment_to_progressFragment)
        }

        // Navigate to the nutrition fragment
        binding.btnNutrition.setOnClickListener {
            findNavController().navigate(R.id.action_menuFragment_to_nutritionFragment)
        }

        // Navigate to the settings fragment
        binding.btnSettings.setOnClickListener {
            findNavController().navigate(R.id.action_menuFragment_to_settingsFragment)
        }
    }
}
