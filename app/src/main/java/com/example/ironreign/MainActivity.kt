package com.example.ironreign

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity

/**
 * The entry activity for IronReign. This activity hosts a NavHostFragment
 * and delegates navigation to the Navigation Component. It uses a simple
 * layout with a single FragmentContainerView defined in activity_main.xml.
 */
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }
}
