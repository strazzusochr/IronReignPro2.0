package com.example.ironreign.ui

import android.os.Bundle
import android.view.View
import androidx.fragment.app.Fragment
import com.example.ironreign.R
import com.example.ironreign.databinding.FragmentNutritionBinding

/**
 * Fragment providing nutritional guidance. Currently displays a placeholder
 * message. This is where future diet recommendations could be implemented.
 */
class NutritionFragment : Fragment(R.layout.fragment_nutrition) {
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        val binding = FragmentNutritionBinding.bind(view)
        // Display the placeholder in the details TextView, leaving the heading unchanged
        binding.textNutrition.text = getString(R.string.nutrition_placeholder)
    }
}
