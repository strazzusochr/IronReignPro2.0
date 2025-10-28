# 🏋️ IronReign Pro - Komplette Android Studio Development Prompt

**Vollständige Spezifikation für AI-Assisted Development**

---

## 📋 Projekt-Übersicht

Erstelle eine **moderne Android Fitness-App** namens **IronReign Pro** mit folgenden Kernfeatures:
- AR-basierter Personal Trainer mit ML Kit Pose Detection
- Wöchentlicher Trainingsplan mit verschiedenen Muskelgruppen
- Fortschritts-Tracking mit Diagrammen
- Ernährungs-Tracker
- Futuristisches Neon-Design im Cyber-Stil

---

## 🎯 Technische Spezifikation

### Build-Konfiguration

**Gradle-Versionen:**
- Android Gradle Plugin (AGP): `8.3.0`
- Gradle: `8.4`
- Kotlin: `1.9.0`

**Android SDK:**
- compileSdk: `34`
- targetSdk: `34`
- minSdk: `26` (Android 8.0 Oreo)
- Java: `17`

**Build Features:**
- ViewBinding: `true`
- DataBinding: `true`

**Package Name:** `com.example.ironreign`

---

## 📦 Dependencies

### Core Android Libraries

```gradle
// AndroidX Core
implementation 'androidx.core:core-ktx:1.13.1'
implementation 'androidx.appcompat:appcompat:1.7.0'
implementation 'androidx.constraintlayout:constraintlayout:2.2.0'

// Material Design 3
implementation 'com.google.android.material:material:1.12.0'

// Navigation Component
implementation 'androidx.navigation:navigation-fragment-ktx:2.7.7'
implementation 'androidx.navigation:navigation-ui-ktx:2.7.7'
```

### Lifecycle & ViewModel

```gradle
implementation 'androidx.lifecycle:lifecycle-viewmodel-ktx:2.7.0'
implementation 'androidx.lifecycle:lifecycle-livedata-ktx:2.7.0'
implementation 'androidx.lifecycle:lifecycle-runtime-ktx:2.7.0'
```

### Coroutines & Flow

```gradle
implementation 'org.jetbrains.kotlinx:kotlinx-coroutines-android:1.7.3'
implementation 'org.jetbrains.kotlinx:kotlinx-coroutines-core:1.7.3'
```

### AR & ML Features

```gradle
// ARCore für Augmented Reality
implementation 'com.google.ar:core:1.44.0'

// ML Kit Pose Detection
implementation 'com.google.mlkit:pose-detection:18.0.0-beta4'
implementation 'com.google.mlkit:pose-detection-accurate:17.0.0'
```

### Charts & Visualisierung

```gradle
// MPAndroidChart für Fortschritts-Diagramme
implementation 'com.github.PhilJay:MPAndroidChart:v3.1.0'
```

### Optional (für Production)

```gradle
// Room Database
implementation 'androidx.room:room-runtime:2.6.1'
implementation 'androidx.room:room-ktx:2.6.1'
kapt 'androidx.room:room-compiler:2.6.1'

// Retrofit für API-Calls
implementation 'com.squareup.retrofit2:retrofit:2.9.0'
implementation 'com.squareup.retrofit2:converter-gson:2.9.0'

// Coil für Bildladen
implementation 'io.coil-kt:coil:2.5.0'
```

### Testing

```gradle
testImplementation 'junit:junit:4.13.2'
testImplementation 'org.jetbrains.kotlinx:kotlinx-coroutines-test:1.7.3'
testImplementation 'androidx.arch.core:core-testing:2.2.0'

androidTestImplementation 'androidx.test.ext:junit:1.1.5'
androidTestImplementation 'androidx.test.espresso:espresso-core:3.5.1'
```

---

## 🏗️ Architektur

### MVVM + Clean Architecture

```
Presentation Layer (UI)
├── Activities
│   ├── MainActivity (Single Activity)
│   └── ARCoachActivity (AR Features)
├── Fragments
│   ├── MenuFragment
│   ├── TrainingsFragment
│   ├── ProgressFragment
│   ├── NutritionFragment
│   └── SettingsFragment
└── ViewModels
    ├── TrainingsViewModel
    ├── ProgressViewModel
    └── NutritionViewModel

Domain Layer
├── Models
│   ├── TrainingDay
│   ├── WorkoutProgress
│   ├── NutritionEntry
│   └── Exercise

Data Layer
├── Repository
│   ├── WorkoutRepository
│   ├── ProgressRepository
│   └── NutritionRepository
└── [Future] DataSource
    ├── Local (Room Database)
    └── Remote (Retrofit API)
```

---

## 🎨 Design-System

### Farbschema (Material Design 3)

**Primary Colors:**
```xml
<color name="md_theme_primary">#00FFFF</color>           <!-- Neon Cyan -->
<color name="md_theme_onPrimary">#000000</color>
<color name="md_theme_primaryContainer">#004D4D</color>
<color name="md_theme_onPrimaryContainer">#00FFFF</color>
```

**Secondary Colors:**
```xml
<color name="md_theme_secondary">#B400FF</color>         <!-- Neon Purple -->
<color name="md_theme_onSecondary">#000000</color>
<color name="md_theme_secondaryContainer">#5A007F</color>
<color name="md_theme_onSecondaryContainer">#E6CCFF</color>
```

**Background & Surface:**
```xml
<color name="md_theme_background">#000000</color>        <!-- Deep Black -->
<color name="md_theme_onBackground">#00FFFF</color>
<color name="md_theme_surface">#0A0A0A</color>          <!-- Dark Gray -->
<color name="md_theme_onSurface">#00FFFF</color>
```

**Accent Colors:**
```xml
<color name="neon_blue">#00FFFF</color>
<color name="neon_purple">#B400FF</color>
<color name="neon_green">#00FF00</color>
<color name="neon_pink">#FF10F0</color>
<color name="neon_yellow">#FFFF00</color>
```

### Typografie

**Font Family:** Orbitron (futuristisch, Sci-Fi)
- Download: https://fonts.google.com/specimen/Orbitron
- Platzierung: `res/font/orbitron_regular.ttf`

**Text Sizes:**
- Headline Large: `32sp`, Bold
- Headline Medium: `24sp`, Bold
- Headline Small: `20sp`, Bold
- Body Large: `16sp`, Regular
- Body Medium: `14sp`, Regular
- Body Small: `12sp`, Regular
- Label: `11sp`, Medium

### Material Components

**Buttons:**
- Primary: `MaterialButton` mit `backgroundTint=neon_blue`
- Secondary: `MaterialButton.OutlinedButton` mit `strokeColor=neon_blue`
- Text: `MaterialButton.TextButton` mit `textColor=neon_blue`

**Cards:**
- `MaterialCardView` mit `cardBackgroundColor=#AA000000` (halbtransparent)
- `cardCornerRadius=12dp`
- `cardElevation=8dp`

**Shapes:**
- Small: `8dp` Corner Radius
- Medium: `12dp` Corner Radius
- Large: `16dp` Corner Radius

---

## 📱 Bildschirme & Features

### 1. MainActivity (Single Activity Container)

**Layout:** `activity_main.xml`

**Komponenten:**
- `FragmentContainerView` (NavHostFragment)
- Keine BottomNavigationView (Navigation über Fragment-Buttons)

**Kotlin Code:**
```kotlin
class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // Navigation Component Setup
        val navController = findNavController(R.id.nav_host_fragment)
        
        // Optional: BottomNavigationView
        // binding.bottomNav.setupWithNavController(navController)
    }
}
```

**XML Layout:**
```xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout 
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@color/md_theme_background">

    <androidx.fragment.app.FragmentContainerView
        android:id="@+id/nav_host_fragment"
        android:name="androidx.navigation.fragment.NavHostFragment"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        app:defaultNavHost="true"
        app:navGraph="@navigation/nav_graph" />

</androidx.constraintlayout.widget.ConstraintLayout>
```

---

### 2. MenuFragment (Hauptmenü)

**Layout:** `fragment_menu.xml`

**Features:**
- 5 Hauptbuttons mit Neon-Glow-Effekt
- Futuristisches Grid-Pattern im Hintergrund
- IronReign Logo oben
- Smooth Animations beim Klick

**UI-Komponenten:**
1. **AI AR Coach Button** → öffnet ARCoachActivity
2. **Trainingsplan Button** → navigiert zu TrainingsFragment
3. **Fortschritt Button** → navigiert zu ProgressFragment
4. **Ernährung Button** → navigiert zu NutritionFragment
5. **Einstellungen Button** → navigiert zu SettingsFragment

**Kotlin Code:**
```kotlin
class MenuFragment : Fragment(R.layout.fragment_menu) {
    
    private var _binding: FragmentMenuBinding? = null
    private val binding get() = _binding!!

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        _binding = FragmentMenuBinding.bind(view)
        
        setupClickListeners()
    }

    private fun setupClickListeners() {
        // AR Coach starten
        binding.btnArCoach.setOnClickListener {
            val intent = Intent(requireContext(), ARCoachActivity::class.java)
            startActivity(intent)
        }

        // Navigation zu anderen Fragments
        binding.btnTrainingsplan.setOnClickListener {
            findNavController().navigate(R.id.action_menuFragment_to_trainingsFragment)
        }

        binding.btnProgress.setOnClickListener {
            findNavController().navigate(R.id.action_menuFragment_to_progressFragment)
        }

        binding.btnNutrition.setOnClickListener {
            findNavController().navigate(R.id.action_menuFragment_to_nutritionFragment)
        }

        binding.btnSettings.setOnClickListener {
            findNavController().navigate(R.id.action_menuFragment_to_settingsFragment)
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}
```

**XML Layout:**
```xml
<?xml version="1.0" encoding="utf-8"?>
<ScrollView xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@drawable/bg_gradient">

    <androidx.constraintlayout.widget.ConstraintLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:padding="24dp">

        <!-- Logo/Title -->
        <TextView
            android:id="@+id/textTitle"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="IRONREIGN"
            android:textColor="@color/neon_blue"
            android:textSize="32sp"
            android:textStyle="bold"
            android:letterSpacing="0.15"
            app:layout_constraintTop_toTopOf="parent"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintEnd_toEndOf="parent"
            android:layout_marginTop="32dp" />

        <!-- AR Coach Button -->
        <com.google.android.material.button.MaterialButton
            android:id="@+id/btnArCoach"
            android:layout_width="match_parent"
            android:layout_height="80dp"
            android:text="🤖 AI AR Coach"
            android:textSize="20sp"
            android:textColor="@color/md_theme_onPrimary"
            app:backgroundTint="@color/neon_blue"
            app:cornerRadius="12dp"
            app:layout_constraintTop_toBottomOf="@id/textTitle"
            android:layout_marginTop="48dp" />

        <!-- Trainingsplan Button -->
        <com.google.android.material.button.MaterialButton
            android:id="@+id/btnTrainingsplan"
            android:layout_width="match_parent"
            android:layout_height="80dp"
            android:text="📅 Trainingsplan"
            android:textSize="20sp"
            android:textColor="@color/md_theme_onPrimary"
            app:backgroundTint="@color/neon_blue"
            app:cornerRadius="12dp"
            app:layout_constraintTop_toBottomOf="@id/btnArCoach"
            android:layout_marginTop="16dp" />

        <!-- Fortschritt Button -->
        <com.google.android.material.button.MaterialButton
            android:id="@+id/btnProgress"
            android:layout_width="match_parent"
            android:layout_height="80dp"
            android:text="📊 Fortschritt"
            android:textSize="20sp"
            android:textColor="@color/md_theme_onPrimary"
            app:backgroundTint="@color/neon_blue"
            app:cornerRadius="12dp"
            app:layout_constraintTop_toBottomOf="@id/btnTrainingsplan"
            android:layout_marginTop="16dp" />

        <!-- Ernährung Button -->
        <com.google.android.material.button.MaterialButton
            android:id="@+id/btnNutrition"
            android:layout_width="match_parent"
            android:layout_height="80dp"
            android:text="🥗 Ernährung"
            android:textSize="20sp"
            android:textColor="@color/md_theme_onPrimary"
            app:backgroundTint="@color/neon_blue"
            app:cornerRadius="12dp"
            app:layout_constraintTop_toBottomOf="@id/btnProgress"
            android:layout_marginTop="16dp" />

        <!-- Einstellungen Button -->
        <com.google.android.material.button.MaterialButton
            android:id="@+id/btnSettings"
            style="@style/Widget.Material3.Button.OutlinedButton"
            android:layout_width="match_parent"
            android:layout_height="80dp"
            android:text="⚙️ Einstellungen"
            android:textSize="20sp"
            android:textColor="@color/neon_blue"
            app:strokeColor="@color/neon_blue"
            app:strokeWidth="2dp"
            app:cornerRadius="12dp"
            app:layout_constraintTop_toBottomOf="@id/btnNutrition"
            android:layout_marginTop="16dp" />

    </androidx.constraintlayout.widget.ConstraintLayout>
</ScrollView>
```

---

### 3. TrainingsFragment (Wochenplan)

**Features:**
- Wöchentlicher Trainingsplan Montag-Sonntag
- Verschiedene Muskelgruppen pro Tag
- ViewModel mit StateFlow
- Swipe-to-Refresh
- Loading-State

**Data Model:**
```kotlin
data class TrainingDay(
    val dayOfWeek: String,
    val exercises: List<String>,
    val isRestDay: Boolean = false,
    val muscleGroups: List<String> = emptyList()
) {
    companion object {
        fun restDay(dayOfWeek: String) = TrainingDay(
            dayOfWeek = dayOfWeek,
            exercises = emptyList(),
            isRestDay = true
        )
    }
}

data class Exercise(
    val id: String,
    val name: String,
    val muscleGroup: String,
    val sets: Int,
    val reps: Int,
    val restTime: Int, // Sekunden
    val description: String,
    val videoUrl: String? = null,
    val difficulty: Difficulty
)

enum class Difficulty {
    BEGINNER, INTERMEDIATE, ADVANCED
}
```

**ViewModel:**
```kotlin
class TrainingsViewModel(
    private val repository: WorkoutRepository = WorkoutRepository()
) : ViewModel() {

    private val _trainingPlan = MutableStateFlow<Map<String, List<String>>>(emptyMap())
    val trainingPlan: StateFlow<Map<String, List<String>>> = _trainingPlan.asStateFlow()

    private val _currentDayPlan = MutableStateFlow<TrainingDay?>(null)
    val currentDayPlan: StateFlow<TrainingDay?> = _currentDayPlan.asStateFlow()

    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()

    private val _errorMessage = MutableStateFlow<String?>(null)
    val errorMessage: StateFlow<String?> = _errorMessage.asStateFlow()

    init {
        loadTrainingPlan()
        loadTodaysPlan()
    }

    private fun loadTrainingPlan() {
        viewModelScope.launch {
            _isLoading.value = true
            try {
                val plan = repository.getWeeklyTrainingPlan()
                _trainingPlan.value = plan
            } catch (e: Exception) {
                _errorMessage.value = "Fehler beim Laden: ${e.message}"
            } finally {
                _isLoading.value = false
            }
        }
    }

    private fun loadTodaysPlan() {
        viewModelScope.launch {
            val today = getCurrentDayOfWeek()
            val plan = repository.getTrainingForDay(today)
            _currentDayPlan.value = TrainingDay(
                dayOfWeek = today,
                exercises = plan,
                isRestDay = plan.isEmpty() || plan.contains("Pause")
            )
        }
    }

    fun refresh() {
        loadTrainingPlan()
        loadTodaysPlan()
    }

    fun clearError() {
        _errorMessage.value = null
    }

    private fun getCurrentDayOfWeek(): String {
        val dayNames = listOf("Sonntag", "Montag", "Dienstag", "Mittwoch", 
                              "Donnerstag", "Freitag", "Samstag")
        val calendar = Calendar.getInstance()
        return dayNames[calendar.get(Calendar.DAY_OF_WEEK) - 1]
    }
}
```

**Fragment:**
```kotlin
class TrainingsFragment : Fragment(R.layout.fragment_trainings) {

    private var _binding: FragmentTrainingsBinding? = null
    private val binding get() = _binding!!
    
    private val viewModel: TrainingsViewModel by viewModels()

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        _binding = FragmentTrainingsBinding.bind(view)

        setupUI()
        observeViewModel()
    }

    private fun setupUI() {
        // Swipe-to-Refresh
        binding.swipeRefresh.setOnRefreshListener {
            viewModel.refresh()
        }
        
        binding.swipeRefresh.setColorSchemeResources(
            R.color.neon_blue,
            R.color.neon_purple,
            R.color.neon_green
        )
    }

    private fun observeViewModel() {
        viewLifecycleOwner.lifecycleScope.launch {
            viewLifecycleOwner.repeatOnLifecycle(Lifecycle.State.STARTED) {
                
                // Training Plan
                launch {
                    viewModel.trainingPlan.collect { plan ->
                        updateTrainingPlanUI(plan)
                    }
                }

                // Loading State
                launch {
                    viewModel.isLoading.collect { isLoading ->
                        binding.swipeRefresh.isRefreshing = isLoading
                        binding.progressBar.visibility = 
                            if (isLoading) View.VISIBLE else View.GONE
                    }
                }

                // Error Messages
                launch {
                    viewModel.errorMessage.collect { error ->
                        error?.let {
                            Snackbar.make(binding.root, it, Snackbar.LENGTH_LONG)
                                .setAction("Erneut versuchen") {
                                    viewModel.refresh()
                                }
                                .setBackgroundTint(
                                    ContextCompat.getColor(requireContext(), R.color.md_theme_error)
                                )
                                .setTextColor(
                                    ContextCompat.getColor(requireContext(), R.color.neon_blue)
                                )
                                .show()
                            viewModel.clearError()
                        }
                    }
                }

                // Today's Plan (Highlight)
                launch {
                    viewModel.currentDayPlan.collect { todayPlan ->
                        todayPlan?.let {
                            updateTodayHighlight(it)
                        }
                    }
                }
            }
        }
    }

    private fun updateTrainingPlanUI(plan: Map<String, List<String>>) {
        val planString = buildString {
            plan.forEach { (day, exercises) ->
                append("📅 ")
                append(day.uppercase())
                append("\n")
                
                if (exercises.isEmpty() || exercises.contains("Pause")) {
                    append("   💤 Ruhetag - Regeneration\n")
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

    private fun updateTodayHighlight(todayPlan: TrainingDay) {
        binding.cardToday.visibility = View.VISIBLE
        binding.textTodayTitle.text = "🎯 Heute: ${todayPlan.dayOfWeek}"
        
        if (todayPlan.isRestDay) {
            binding.textTodayDetails.text = "💤 Ruhetag - Gönn dir Regeneration!"
        } else {
            val exercisesText = todayPlan.exercises.joinToString("\n") { "• $it" }
            binding.textTodayDetails.text = exercisesText
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}
```

**Repository:**
```kotlin
class WorkoutRepository {
    
    private val trainingsPlan: Map<String, List<String>> = mapOf(
        "Montag" to listOf("Brust", "Schultern", "Trizeps"),
        "Dienstag" to listOf("Beinstrecker", "Waden", "Bauch"),
        "Mittwoch" to listOf("Rücken", "Bizeps"),
        "Donnerstag" to listOf("Beinbeuger", "Po", "Bauch"),
        "Freitag" to listOf("Pause"),
        "Samstag" to listOf("Cardio", "Core"),
        "Sonntag" to listOf("Pause")
    )

    suspend fun getWeeklyTrainingPlan(): Map<String, List<String>> {
        delay(300) // Simulate network delay
        return trainingsPlan
    }

    fun getTrainingPlanFlow(): Flow<Map<String, List<String>>> = flow {
        delay(300)
        emit(trainingsPlan)
    }

    suspend fun getTrainingForDay(dayOfWeek: String): List<String> {
        delay(100)
        return trainingsPlan[dayOfWeek] ?: emptyList()
    }

    suspend fun getExercisesByMuscleGroup(muscleGroup: String): List<Exercise> {
        delay(200)
        return when (muscleGroup.lowercase()) {
            "brust" -> listOf(
                Exercise(
                    id = "1",
                    name = "Bankdrücken",
                    muscleGroup = "Brust",
                    sets = 4,
                    reps = 10,
                    restTime = 90,
                    description = "Flach auf der Bank, Hantel langsam senken und explosiv hochdrücken",
                    difficulty = Difficulty.INTERMEDIATE
                ),
                Exercise(
                    id = "2",
                    name = "Kurzhantel Flys",
                    muscleGroup = "Brust",
                    sets = 3,
                    reps = 12,
                    restTime = 60,
                    description = "Arme leicht gebeugt, weite Bewegung für maximale Dehnung",
                    difficulty = Difficulty.BEGINNER
                )
            )
            "beine" -> listOf(
                Exercise(
                    id = "3",
                    name = "Kniebeugen",
                    muscleGroup = "Beine",
                    sets = 4,
                    reps = 12,
                    restTime = 120,
                    description = "Tief squatten, Knie nicht über Zehenspitzen",
                    difficulty = Difficulty.INTERMEDIATE
                )
            )
            else -> emptyList()
        }
    }

    suspend fun getWorkoutHistory(limit: Int = 30): List<WorkoutProgress> {
        delay(300)
        // Mock data
        return listOf(
            WorkoutProgress(
                date = System.currentTimeMillis() - 86400000L,
                exerciseName = "Bankdrücken",
                sets = 3,
                reps = 10,
                weight = 80.0,
                notes = "Gutes Gefühl"
            ),
            WorkoutProgress(
                date = System.currentTimeMillis() - (86400000L * 2),
                exerciseName = "Kniebeugen",
                sets = 4,
                reps = 8,
                weight = 100.0,
                notes = "Beine waren müde"
            )
        )
    }

    suspend fun saveWorkoutProgress(progress: WorkoutProgress): Boolean {
        delay(200)
        // In production: save to Room database
        return true
    }
}
```

**Layout XML:**
```xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.coordinatorlayout.widget.CoordinatorLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@color/md_theme_background">

    <androidx.swiperefreshlayout.widget.SwipeRefreshLayout
        android:id="@+id/swipeRefresh"
        android:layout_width="match_parent"
        android:layout_height="match_parent">

        <androidx.core.widget.NestedScrollView
            android:layout_width="match_parent"
            android:layout_height="match_parent">

            <LinearLayout
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:orientation="vertical"
                android:padding="16dp">

                <!-- Header -->
                <TextView
                    android:id="@+id/textHeader"
                    android:layout_width="wrap_content"
                    android:layout_height="wrap_content"
                    android:text="📅 TRAININGSPLAN"
                    android:textColor="@color/neon_blue"
                    android:textSize="24sp"
                    android:textStyle="bold"
                    android:layout_marginBottom="16dp" />

                <!-- Today's Plan Card -->
                <com.google.android.material.card.MaterialCardView
                    android:id="@+id/cardToday"
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    app:cardBackgroundColor="#DD1A1A1A"
                    app:cardCornerRadius="12dp"
                    app:cardElevation="8dp"
                    android:layout_marginBottom="16dp">

                    <LinearLayout
                        android:layout_width="match_parent"
                        android:layout_height="wrap_content"
                        android:orientation="vertical"
                        android:padding="16dp">

                        <TextView
                            android:id="@+id/textTodayTitle"
                            android:layout_width="wrap_content"
                            android:layout_height="wrap_content"
                            android:text="🎯 Heute: Montag"
                            android:textColor="@color/neon_blue"
                            android:textSize="18sp"
                            android:textStyle="bold" />

                        <TextView
                            android:id="@+id/textTodayDetails"
                            android:layout_width="wrap_content"
                            android:layout_height="wrap_content"
                            android:text="• Brust\n• Schultern\n• Trizeps"
                            android:textColor="@color/md_theme_onSurface"
                            android:textSize="14sp"
                            android:layout_marginTop="8dp" />

                    </LinearLayout>

                </com.google.android.material.card.MaterialCardView>

                <!-- Weekly Plan -->
                <TextView
                    android:id="@+id/textWeeklyHeader"
                    android:layout_width="wrap_content"
                    android:layout_height="wrap_content"
                    android:text="📆 Wochenübersicht"
                    android:textColor="@color/neon_purple"
                    android:textSize="18sp"
                    android:textStyle="bold"
                    android:layout_marginTop="8dp"
                    android:layout_marginBottom="12dp" />

                <TextView
                    android:id="@+id/textPlanDetails"
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:textColor="@color/md_theme_onBackground"
                    android:textSize="14sp"
                    android:lineSpacingExtra="4dp"
                    android:fontFamily="@font/orbitron_regular" />

                <!-- Progress Bar -->
                <ProgressBar
                    android:id="@+id/progressBar"
                    android:layout_width="wrap_content"
                    android:layout_height="wrap_content"
                    android:layout_gravity="center"
                    android:indeterminateTint="@color/neon_blue"
                    android:visibility="gone"
                    android:layout_marginTop="16dp" />

            </LinearLayout>

        </androidx.core.widget.NestedScrollView>

    </androidx.swiperefreshlayout.widget.SwipeRefreshLayout>

</androidx.coordinatorlayout.widget.CoordinatorLayout>
```

---

### 4. ARCoachActivity (Augmented Reality Coach)

**Features:**
- ARCore Integration für AR-Overlay
- ML Kit Pose Detection für Körperhaltung
- Real-time Feedback
- Rep-Counter
- Audio-Feedback
- Pause/Resume Funktionalität

**Permissions (AndroidManifest.xml):**
```xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-feature android:name="android.hardware.camera.ar" android:required="true" />
<uses-feature android:name="android.hardware.camera" android:required="true" />
<uses-feature android:name="android.hardware.camera.autofocus" />
```

**Activity Code:**
```kotlin
class ARCoachActivity : AppCompatActivity() {

    private lateinit var binding: ActivityArcoachBinding
    private lateinit var poseDetector: PoseDetector
    private var mediaPlayer: MediaPlayer? = null
    private var arSession: Session? = null
    
    private var repCount = 0
    private var isPaused = false
    private var isDetectingPose = false
    
    private val cameraExecutor = Executors.newSingleThreadExecutor()
    
    companion object {
        private const val CAMERA_PERMISSION_CODE = 100
        private const val TAG = "ARCoachActivity"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityArcoachBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // Keep screen on during workout
        window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)

        setupUI()
        checkPermissionsAndInitialize()
    }

    private fun setupUI() {
        binding.btnStopAr.setOnClickListener {
            finish()
        }

        binding.btnPauseAr.setOnClickListener {
            togglePause()
        }

        binding.btnResetReps.setOnClickListener {
            resetRepCounter()
        }

        updateRepCounter(0)
    }

    private fun checkPermissionsAndInitialize() {
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.CAMERA)
            == PackageManager.PERMISSION_GRANTED) {
            initializeARComponents()
        } else {
            ActivityCompat.requestPermissions(
                this,
                arrayOf(Manifest.permission.CAMERA),
                CAMERA_PERMISSION_CODE
            )
        }
    }

    private fun initializeARComponents() {
        try {
            // Check ARCore availability
            when (ArCoreApk.getInstance().requestInstall(this, true)) {
                ArCoreApk.InstallStatus.INSTALL_REQUESTED -> {
                    updateStatus("📦 ARCore Installation wird angefordert...")
                    return
                }
                ArCoreApk.InstallStatus.INSTALLED -> {
                    updateStatus("✓ ARCore verfügbar")
                }
            }

            // Initialize ARCore session
            arSession = Session(this).apply {
                val config = Config(this)
                config.updateMode = Config.UpdateMode.LATEST_CAMERA_IMAGE
                configure(config)
                resume()
            }
            updateStatus("✓ AR Session aktiv")

            // Initialize ML Kit pose detector
            val options = PoseDetectorOptions.Builder()
                .setDetectorMode(PoseDetectorOptions.STREAM_MODE)
                .build()
            poseDetector = PoseDetection.getClient(options)
            updatePoseInfo("Bereit für Pose Detection...")

            // Initialize audio feedback
            try {
                mediaPlayer = MediaPlayer.create(this, R.raw.beep)
            } catch (e: Exception) {
                updateStatus("⚠️ Audio-Feedback nicht verfügbar")
            }

            // Start camera preview
            startCameraPreview()

        } catch (e: UnavailableArcoreNotInstalledException) {
            showError("ARCore ist nicht installiert")
            finish()
        } catch (e: UnavailableUserDeclinedInstallationException) {
            showError("ARCore Installation wurde abgelehnt")
            finish()
        } catch (e: Exception) {
            showError("Fehler: ${e.message}")
            Log.e(TAG, "Initialization error", e)
        }
    }

    @androidx.camera.core.ExperimentalGetImage
    private fun startCameraPreview() {
        val cameraProviderFuture = ProcessCameraProvider.getInstance(this)
        
        cameraProviderFuture.addListener({
            val cameraProvider = cameraProviderFuture.get()
            
            // Preview
            val preview = Preview.Builder().build().also {
                it.setSurfaceProvider(binding.previewView.surfaceProvider)
            }

            // Image Analysis for Pose Detection
            val imageAnalysis = ImageAnalysis.Builder()
                .setTargetResolution(Size(1280, 720))
                .setBackpressureStrategy(ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST)
                .build()
                .also {
                    it.setAnalyzer(cameraExecutor) { imageProxy ->
                        processImageForPoseDetection(imageProxy)
                    }
                }

            // Camera selector (front camera for selfie mode)
            val cameraSelector = CameraSelector.DEFAULT_FRONT_CAMERA

            try {
                cameraProvider.unbindAll()
                cameraProvider.bindToLifecycle(
                    this,
                    cameraSelector,
                    preview,
                    imageAnalysis
                )
                
                isDetectingPose = true
                updateStatus("▶️ AR Coach Aktiv")
                
            } catch (e: Exception) {
                Log.e(TAG, "Camera binding failed", e)
                showError("Kamera konnte nicht gestartet werden")
            }

        }, ContextCompat.getMainExecutor(this))
    }

    @androidx.camera.core.ExperimentalGetImage
    private fun processImageForPoseDetection(imageProxy: ImageProxy) {
        if (isPaused || !isDetectingPose) {
            imageProxy.close()
            return
        }

        val mediaImage = imageProxy.image
        if (mediaImage != null) {
            val image = InputImage.fromMediaImage(
                mediaImage,
                imageProxy.imageInfo.rotationDegrees
            )

            poseDetector.process(image)
                .addOnSuccessListener { pose ->
                    // Process detected pose
                    analyzePose(pose)
                }
                .addOnFailureListener { e ->
                    Log.e(TAG, "Pose detection failed", e)
                }
                .addOnCompleteListener {
                    imageProxy.close()
                }
        } else {
            imageProxy.close()
        }
    }

    private fun analyzePose(pose: Pose) {
        val allPoseLandmarks = pose.allPoseLandmarks
        
        if (allPoseLandmarks.isEmpty()) {
            runOnUiThread {
                updatePoseInfo("⚠️ Keine Person erkannt")
            }
            return
        }

        // Get key landmarks
        val leftShoulder = pose.getPoseLandmark(PoseLandmark.LEFT_SHOULDER)
        val rightShoulder = pose.getPoseLandmark(PoseLandmark.RIGHT_SHOULDER)
        val leftElbow = pose.getPoseLandmark(PoseLandmark.LEFT_ELBOW)
        val rightElbow = pose.getPoseLandmark(PoseLandmark.RIGHT_ELBOW)
        val leftWrist = pose.getPoseLandmark(PoseLandmark.LEFT_WRIST)
        val rightWrist = pose.getPoseLandmark(PoseLandmark.RIGHT_WRIST)

        // Simple rep detection logic (example for bicep curls)
        // In production: implement sophisticated rep counting algorithm
        if (leftElbow != null && leftShoulder != null && leftWrist != null) {
            val angle = calculateAngle(
                leftShoulder.position,
                leftElbow.position,
                leftWrist.position
            )

            runOnUiThread {
                updatePoseInfo("✓ Pose erkannt | Arm-Winkel: ${angle.toInt()}°")
                
                // Rep counting logic (simplified)
                if (angle < 50) { // Arm bent (curl up)
                    // Mark as potential rep
                } else if (angle > 160) { // Arm extended (curl down)
                    // Complete rep if was bent before
                    incrementRepCounter()
                }
            }
        }

        // Display skeleton overlay (optional)
        // drawPoseOverlay(pose)
    }

    private fun calculateAngle(
        firstPoint: PointF,
        midPoint: PointF,
        lastPoint: PointF
    ): Double {
        val radians = atan2(lastPoint.y - midPoint.y, lastPoint.x - midPoint.x) -
                atan2(firstPoint.y - midPoint.y, firstPoint.x - midPoint.x)
        var angle = Math.toDegrees(radians.toDouble())
        if (angle < 0) {
            angle += 360.0
        }
        return angle
    }

    private fun togglePause() {
        isPaused = !isPaused
        if (isPaused) {
            arSession?.pause()
            isDetectingPose = false
            binding.btnPauseAr.text = "Fortsetzen"
            updateStatus("⏸️ Pausiert")
        } else {
            arSession?.resume()
            isDetectingPose = true
            binding.btnPauseAr.text = "Pause"
            updateStatus("▶️ AR Coach Aktiv")
        }
    }

    private fun incrementRepCounter() {
        repCount++
        updateRepCounter(repCount)
        playFeedbackSound()
        
        // Haptic feedback
        val vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
        if (vibrator.hasVibrator()) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                vibrator.vibrate(VibrationEffect.createOneShot(100, VibrationEffect.DEFAULT_AMPLITUDE))
            } else {
                vibrator.vibrate(100)
            }
        }
    }

    private fun resetRepCounter() {
        repCount = 0
        updateRepCounter(0)
    }

    private fun updateRepCounter(count: Int) {
        binding.textRepCount.text = count.toString()
        
        // Celebrate milestones
        when (count) {
            10 -> showToast("🎯 10 Reps! Keep going!")
            20 -> showToast("🔥 20 Reps! You're on fire!")
            50 -> showToast("💪 50 Reps! Beast mode!")
        }
    }

    private fun playFeedbackSound() {
        mediaPlayer?.start()
    }

    private fun updateStatus(status: String) {
        binding.textStatus.text = status
    }

    private fun updatePoseInfo(info: String) {
        binding.textPoseInfo.text = info
    }

    private fun showError(message: String) {
        Toast.makeText(this, message, Toast.LENGTH_LONG).show()
    }

    private fun showToast(message: String) {
        Toast.makeText(this, message, Toast.LENGTH_SHORT).show()
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode == CAMERA_PERMISSION_CODE) {
            if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                initializeARComponents()
            } else {
                showError("Kamera-Berechtigung erforderlich für AR Coach")
                finish()
            }
        }
    }

    override fun onPause() {
        super.onPause()
        arSession?.pause()
        isDetectingPose = false
    }

    override fun onResume() {
        super.onResume()
        if (!isPaused) {
            arSession?.resume()
            isDetectingPose = true
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        cameraExecutor.shutdown()
        
        try {
            poseDetector.close()
        } catch (e: Exception) {
            Log.e(TAG, "Error closing pose detector", e)
        }
        
        mediaPlayer?.release()
        mediaPlayer = null
        
        arSession?.close()
        arSession = null
        
        window.clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
    }
}
```

**Layout XML:**
```xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout 
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@color/dark_bg">

    <!-- Camera Preview -->
    <androidx.camera.view.PreviewView
        android:id="@+id/previewView"
        android:layout_width="match_parent"
        android:layout_height="match_parent" />

    <!-- Pose Overlay Canvas (optional) -->
    <com.example.ironreign.views.PoseOverlayView
        android:id="@+id/poseOverlay"
        android:layout_width="match_parent"
        android:layout_height="match_parent" />

    <!-- Status Overlay -->
    <LinearLayout
        android:id="@+id/statusOverlay"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:orientation="vertical"
        android:padding="16dp"
        android:background="#DD000000"
        app:layout_constraintTop_toTopOf="parent">

        <TextView
            android:id="@+id/textStatus"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="🎯 AR Coach Aktiv"
            android:textColor="@color/neon_blue"
            android:textSize="20sp"
            android:textStyle="bold" />

        <TextView
            android:id="@+id/textPoseInfo"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_marginTop="8dp"
            android:text="Warte auf Pose Detection..."
            android:textColor="@color/light_gray"
            android:textSize="14sp" />

    </LinearLayout>

    <!-- Rep Counter Card -->
    <com.google.android.material.card.MaterialCardView
        android:id="@+id/repCounterCard"
        android:layout_width="120dp"
        android:layout_height="120dp"
        android:layout_margin="16dp"
        app:cardBackgroundColor="#AA000000"
        app:cardCornerRadius="16dp"
        app:cardElevation="12dp"
        app:strokeColor="@color/neon_blue"
        app:strokeWidth="2dp"
        app:layout_constraintTop_toBottomOf="@id/statusOverlay"
        app:layout_constraintEnd_toEndOf="parent">

        <LinearLayout
            android:layout_width="match_parent"
            android:layout_height="match_parent"
            android:orientation="vertical"
            android:gravity="center"
            android:padding="12dp">

            <TextView
                android:id="@+id/textRepCount"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="0"
                android:textColor="@color/neon_blue"
                android:textSize="48sp"
                android:textStyle="bold"
                android:fontFamily="@font/orbitron_regular" />

            <TextView
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="Reps"
                android:textColor="@color/neon_blue"
                android:textSize="16sp" />

        </LinearLayout>

    </com.google.android.material.card.MaterialCardView>

    <!-- Control Buttons -->
    <LinearLayout
        android:id="@+id/controlButtons"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:orientation="horizontal"
        android:padding="16dp"
        android:gravity="center"
        android:background="#DD000000"
        app:layout_constraintBottom_toBottomOf="parent">

        <com.google.android.material.button.MaterialButton
            android:id="@+id/btnStopAr"
            style="@style/Widget.Material3.Button.OutlinedButton"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:layout_marginEnd="8dp"
            android:text="Beenden"
            android:textColor="@color/neon_blue"
            app:strokeColor="@color/neon_blue"
            app:icon="@drawable/ic_stop"
            app:iconTint="@color/neon_blue" />

        <com.google.android.material.button.MaterialButton
            android:id="@+id/btnPauseAr"
            style="@style/Widget.Material3.Button.TonalButton"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:layout_marginStart="4dp"
            android:layout_marginEnd="4dp"
            android:text="Pause"
            android:textColor="@color/dark_bg"
            app:backgroundTint="@color/neon_blue"
            app:icon="@drawable/ic_pause"
            app:iconTint="@color/dark_bg" />

        <com.google.android.material.button.MaterialButton
            android:id="@+id/btnResetReps"
            style="@style/Widget.Material3.Button.OutlinedButton"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:layout_marginStart="8dp"
            android:text="Reset"
            android:textColor="@color/neon_purple"
            app:strokeColor="@color/neon_purple"
            app:icon="@drawable/ic_refresh"
            app:iconTint="@color/neon_purple" />

    </LinearLayout>

</androidx.constraintlayout.widget.ConstraintLayout>
```

---

### 5. ProgressFragment (Fortschritts-Tracking)

**Features:**
- MPAndroidChart Line Chart für Gewichtsverlauf
- Bar Chart für Wiederholungen
- Statistiken (Total Workouts, Total Reps, etc.)
- Filter nach Zeitraum (Woche, Monat, Jahr)

**ViewModel:**
```kotlin
class ProgressViewModel(
    private val repository: WorkoutRepository = WorkoutRepository()
) : ViewModel() {

    private val _workoutHistory = MutableStateFlow<List<WorkoutProgress>>(emptyList())
    val workoutHistory: StateFlow<List<WorkoutProgress>> = _workoutHistory.asStateFlow()

    private val _statistics = MutableStateFlow<WorkoutStatistics?>(null)
    val statistics: StateFlow<WorkoutStatistics?> = _statistics.asStateFlow()

    private val _selectedTimeRange = MutableStateFlow(TimeRange.LAST_30_DAYS)
    val selectedTimeRange: StateFlow<TimeRange> = _selectedTimeRange.asStateFlow()

    init {
        loadWorkoutHistory()
        calculateStatistics()
    }

    private fun loadWorkoutHistory() {
        viewModelScope.launch {
            try {
                val history = repository.getWorkoutHistory(limit = 100)
                _workoutHistory.value = history
            } catch (e: Exception) {
                // Handle error
            }
        }
    }

    private fun calculateStatistics() {
        viewModelScope.launch {
            val history = _workoutHistory.value
            
            val stats = WorkoutStatistics(
                totalWorkouts = history.size,
                totalSets = history.sumOf { it.sets },
                totalReps = history.sumOf { it.reps },
                totalWeight = history.sumOf { it.weight },
                averageWeight = history.map { it.weight }.average(),
                currentStreak = calculateCurrentStreak(history),
                longestStreak = calculateLongestStreak(history)
            )
            
            _statistics.value = stats
        }
    }

    fun setTimeRange(range: TimeRange) {
        _selectedTimeRange.value = range
        loadWorkoutHistory()
        calculateStatistics()
    }

    private fun calculateCurrentStreak(history: List<WorkoutProgress>): Int {
        // Implementation
        return 0
    }

    private fun calculateLongestStreak(history: List<WorkoutProgress>): Int {
        // Implementation
        return 0
    }
}

data class WorkoutStatistics(
    val totalWorkouts: Int,
    val totalSets: Int,
    val totalReps: Int,
    val totalWeight: Double,
    val averageWeight: Double,
    val currentStreak: Int,
    val longestStreak: Int
)

enum class TimeRange {
    LAST_7_DAYS, LAST_30_DAYS, LAST_90_DAYS, ALL_TIME
}
```

---

### 6. Navigation Graph

**res/navigation/nav_graph.xml:**
```xml
<?xml version="1.0" encoding="utf-8"?>
<navigation xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:id="@+id/nav_graph"
    app:startDestination="@id/menuFragment">

    <!-- Menu (Start) -->
    <fragment
        android:id="@+id/menuFragment"
        android:name="com.example.ironreign.ui.MenuFragment"
        android:label="IronReign">
        
        <action
            android:id="@+id/action_menuFragment_to_trainingsFragment"
            app:destination="@id/trainingsFragment"
            app:enterAnim="@anim/slide_in_right"
            app:exitAnim="@anim/slide_out_left"
            app:popEnterAnim="@anim/slide_in_left"
            app:popExitAnim="@anim/slide_out_right" />
        
        <action
            android:id="@+id/action_menuFragment_to_progressFragment"
            app:destination="@id/progressFragment" />
        
        <action
            android:id="@+id/action_menuFragment_to_nutritionFragment"
            app:destination="@id/nutritionFragment" />
        
        <action
            android:id="@+id/action_menuFragment_to_settingsFragment"
            app:destination="@id/settingsFragment" />
    </fragment>

    <!-- Trainings -->
    <fragment
        android:id="@+id/trainingsFragment"
        android:name="com.example.ironreign.ui.TrainingsFragment"
        android:label="@string/menu_trainingsplan" />

    <!-- Progress -->
    <fragment
        android:id="@+id/progressFragment"
        android:name="com.example.ironreign.ui.ProgressFragment"
        android:label="@string/menu_progress" />

    <!-- Nutrition -->
    <fragment
        android:id="@+id/nutritionFragment"
        android:name="com.example.ironreign.ui.NutritionFragment"
        android:label="@string/menu_nutrition" />

    <!-- Settings -->
    <fragment
        android:id="@+id/settingsFragment"
        android:name="com.example.ironreign.ui.SettingsFragment"
        android:label="@string/menu_settings" />

</navigation>
```

---

## 🎨 Drawable Resources

### bg_gradient.xml
```xml
<?xml version="1.0" encoding="utf-8"?>
<shape xmlns:android="http://schemas.android.com/apk/res/android"
    android:shape="rectangle">
    <gradient
        android:angle="270"
        android:startColor="#000000"
        android:centerColor="#0A0A0A"
        android:endColor="#000000"
        android:type="linear" />
</shape>
```

### neon_button.xml
```xml
<?xml version="1.0" encoding="utf-8"?>
<shape xmlns:android="http://schemas.android.com/apk/res/android"
    android:shape="rectangle">
    <solid android:color="@color/neon_blue" />
    <corners android:radius="12dp" />
    <stroke
        android:width="2dp"
        android:color="@color/neon_purple" />
</shape>
```

---

## 🧪 Testing Strategy

### Unit Tests
```kotlin
class TrainingsViewModelTest {

    @get:Rule
    val instantExecutorRule = InstantTaskExecutorRule()

    private lateinit var viewModel: TrainingsViewModel
    private lateinit var repository: FakeWorkoutRepository

    @Before
    fun setup() {
        repository = FakeWorkoutRepository()
        viewModel = TrainingsViewModel(repository)
    }

    @Test
    fun `loadTrainingPlan should update StateFlow`() = runTest {
        // Given
        val expectedPlan = mapOf("Montag" to listOf("Brust"))
        repository.setMockPlan(expectedPlan)

        // When
        viewModel.refresh()

        // Then
        val actualPlan = viewModel.trainingPlan.value
        assertEquals(expectedPlan, actualPlan)
    }
}
```

---

## 📖 Strings Resources

**res/values/strings.xml:**
```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <!-- App -->
    <string name="app_name">IronReign</string>

    <!-- Menu -->
    <string name="menu_ar_coach">AR Coach starten</string>
    <string name="menu_trainingsplan">Trainingsplan</string>
    <string name="menu_progress">Fortschritt</string>
    <string name="menu_nutrition">Ernährung</string>
    <string name="menu_settings">Einstellungen</string>

    <!-- Trainings -->
    <string name="trainings_heading">Dein Trainingsplan</string>
    <string name="today_plan">Heute: %1$s</string>
    <string name="rest_day">Ruhetag - Regeneration</string>

    <!-- AR Coach -->
    <string name="ar_status_active">AR Coach Aktiv</string>
    <string name="ar_status_paused">Pausiert</string>
    <string name="ar_pose_detected">Pose erkannt</string>
    <string name="ar_no_pose">Keine Person erkannt</string>
    <string name="ar_reps">Reps</string>

    <!-- Progress -->
    <string name="progress_total_workouts">Gesamt Workouts</string>
    <string name="progress_total_reps">Gesamt Wiederholungen</string>
    <string name="progress_current_streak">Aktuelle Serie</string>

    <!-- Errors -->
    <string name="error_camera_permission">Kamera-Berechtigung erforderlich</string>
    <string name="error_arcore_not_installed">ARCore ist nicht installiert</string>
    <string name="error_loading_data">Fehler beim Laden der Daten</string>
</resources>
```

---

## 🚀 Build & Release

### Build Variants
```gradle
android {
    buildTypes {
        debug {
            applicationIdSuffix ".debug"
            debuggable true
            minifyEnabled false
        }
        
        release {
            minifyEnabled true
            shrinkResources true
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
            
            // Signing config (add your keystore details)
            signingConfig signingConfigs.release
        }
    }
}
```

---

## 📝 Verwendung dieser Prompt

### Für KI-Assistenten (ChatGPT, Claude, etc.):

**Copy-Paste diese Prompt direkt in den Chat:**

```
Erstelle eine vollständige Android-App basierend auf den folgenden Spezifikationen:

[GESAMTE PROMPT VON OBEN EINFÜGEN]

Erstelle alle Dateien in der richtigen Verzeichnisstruktur und achte besonders auf:
1. Vollständige Implementation aller Features
2. Moderne Android-Best-Practices (MVVM, Coroutines, StateFlow)
3. Material Design 3
4. ViewBinding überall
5. Fehlerbehandlung
6. Kommentare auf Deutsch
7. Production-ready Code

Starte mit der Projekt-Setup-Datei und arbeite dich dann durch alle Komponenten.
```

---

## 🎯 Erwartetes Ergebnis

Nach Verwendung dieser Prompt solltest du erhalten:

✅ Vollständige Android-App mit 5 Screens  
✅ AR Coach mit Pose Detection  
✅ Trainingsplan mit MVVM  
✅ Fortschritts-Tracking  
✅ Futuristisches Design  
✅ Production-ready Code  
✅ Alle Dependencies konfiguriert  
✅ Navigation Component Setup  
✅ ViewBinding überall  
✅ Error Handling  
✅ Lifecycle-aware Components  

---

**Diese Prompt ist optimiert für maximale Code-Generierung mit AI-Assistenten! 🚀**
