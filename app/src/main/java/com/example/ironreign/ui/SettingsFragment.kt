package com.example.ironreign.ui

import android.os.Bundle
import android.view.View
import androidx.fragment.app.Fragment
import com.example.ironreign.R
import com.example.ironreign.databinding.FragmentSettingsBinding

/**
 * Fragment where application preferences will be configured. Shows a
 * placeholder at the moment.
 */
class SettingsFragment : Fragment(R.layout.fragment_settings) {
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        val binding = FragmentSettingsBinding.bind(view)
        // Display the placeholder in the details TextView, leaving the heading unchanged
        binding.textSettings.text = getString(R.string.settings_placeholder)
    }
}
