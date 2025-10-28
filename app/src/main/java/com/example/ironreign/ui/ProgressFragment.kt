package com.example.ironreign.ui

import android.os.Bundle
import android.view.View
import androidx.fragment.app.Fragment
import com.example.ironreign.R
import com.example.ironreign.databinding.FragmentProgressBinding

/**
 * Fragment showing the user's progress over time. In a full implementation
 * MPAndroidChart would be used to render charts. For now a placeholder
 * message is displayed.
 */
class ProgressFragment : Fragment(R.layout.fragment_progress) {
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        val binding = FragmentProgressBinding.bind(view)
        // Display the placeholder in the details TextView, leaving the heading unchanged
        binding.textProgress2.text = getString(R.string.progress_placeholder)
    }
}
