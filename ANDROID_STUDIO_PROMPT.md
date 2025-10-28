# 🎯 VOLLSTÄNDIGER ANDROID STUDIO PROMPT FÜR IRONREIGN PRO

**Kopiere diesen kompletten Prompt und gib ihn einer KI (ChatGPT, Claude, etc.)**

---

## 📋 PROMPT START

```
Ich möchte die Android-App "IronReign Pro" in Android Studio komplett fertig bauen und alle Funktionen implementieren. Hilf mir Schritt-für-Schritt durch den kompletten Prozess.

## PROJEKT-KONTEXT

Projektname: IronReign Pro
Typ: Android Fitness App mit AR-Coach
Package: com.example.ironreign
Min SDK: 26 (Android 8.0)
Target SDK: 34 (Android 14)
Kotlin Version: 1.9.0
AGP Version: 8.3.0
Gradle Version: 8.4

## PROJEKT-STRUKTUR

Das Projekt hat folgende Struktur:

IronReignPro/
├── app/
│   ├── build.gradle (Kotlin DSL)
│   ├── src/
│   │   ├── main/
│   │   │   ├── AndroidManifest.xml
│   │   │   ├── java/com/example/ironreign/
│   │   │   │   ├── MainActivity.kt
│   │   │   │   ├── ARCoachActivity.kt
│   │   │   │   ├── PoseDetectionService.kt
│   │   │   │   ├── data/
│   │   │   │   │   ├── WorkoutRepository.kt
│   │   │   │   │   └── model/
│   │   │   │   │       └── TrainingDay.kt
│   │   │   │   └── ui/
│   │   │   │       ├── MenuFragment.kt
│   │   │   │       ├── TrainingsFragment.kt
│   │   │   │       ├── ProgressFragment.kt
│   │   │   │       ├── NutritionFragment.kt
│   │   │   │       ├── SettingsFragment.kt
│   │   │   │       └── viewmodels/
│   │   │   │           └── TrainingsViewModel.kt
│   │   │   ├── res/
│   │   │   │   ├── layout/
│   │   │   │   ├── values/
│   │   │   │   ├── drawable/
│   │   │   │   ├── navigation/
│   │   │   │   └── font/
│   │   │   └── assets/
├── build.gradle (Root)
├── settings.gradle
├── gradle.properties
└── gradle/wrapper/

## DEPENDENCIES (app/build.gradle)

dependencies {
    // AndroidX Core
    implementation("androidx.core:core-ktx:1.13.1")
    implementation("androidx.appcompat:appcompat:1.7.0")
    implementation("com.google.android.material:material:1.12.0")
    implementation("androidx.constraintlayout:constraintlayout:2.2.0")
    
    // Navigation
    implementation("androidx.navigation:navigation-fragment-ktx:2.7.7")
    implementation("androidx.navigation:navigation-ui-ktx:2.7.7")
    
    // Lifecycle & ViewModel
    implementation("androidx.lifecycle:lifecycle-viewmodel-ktx:2.7.0")
    implementation("androidx.lifecycle:lifecycle-livedata-ktx:2.7.0")
    implementation("androidx.lifecycle:lifecycle-runtime-ktx:2.7.0")
    
    // Coroutines
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.7.3")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.7.3")
    
    // ARCore & ML Kit
    implementation("com.google.ar:core:1.44.0")
    implementation("com.google.mlkit:pose-detection-accurate:17.0.0")
    
    // Charts
    implementation("com.github.PhilJay:MPAndroidChart:v3.1.0")
    
    // Future: Room Database (auskommentiert)
    // implementation("androidx.room:room-runtime:2.6.1")
    // implementation("androidx.room:room-ktx:2.6.1")
    // kapt("androidx.room:room-compiler:2.6.1")
    
    // Future: Retrofit (auskommentiert)
    // implementation("com.squareup.retrofit2:retrofit:2.9.0")
    // implementation("com.squareup.retrofit2:converter-gson:2.9.0")
    
    // Testing
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-test:1.7.3")
    androidTestImplementation("androidx.test.ext:junit:1.1.5")
    androidTestImplementation("androidx.test.espresso:espresso-core:3.5.1")
}

## ARCHITEKTUR

Die App folgt MVVM (Model-View-ViewModel) mit Clean Architecture:
- UI Layer: Fragments (MenuFragment, TrainingsFragment, etc.)
- ViewModel Layer: TrainingsViewModel mit StateFlow
- Repository Layer: WorkoutRepository
- Data Layer: TrainingDay, WorkoutProgress Models

## FEATURES ZU IMPLEMENTIEREN

### 1. MAIN ACTIVITY & NAVIGATION
- MainActivity mit Navigation Component
- Bottom Navigation Bar (falls gewünscht)
- Navigation Graph mit allen Fragments
- ViewBinding aktiviert
- Material Design 3 Theme

### 2. MENU FRAGMENT (Hauptmenü)
- 5 Buttons im futuristischen Neon-Design:
  * AR Coach starten
  * Trainingsplan
  * Fortschritt
  * Ernährung
  * Einstellungen
- Navigation zu allen anderen Screens
- Cyber-Ästhetik mit Orbitron-Font

### 3. TRAININGS FRAGMENT
- ViewModel mit StateFlow
- Wochenplan anzeigen (Montag-Sonntag)
- Für jeden Tag: Muskelgruppen auflisten
- Ruhetage anzeigen
- Swipe-to-Refresh (optional)
- Loading State & Error Handling

### 4. PROGRESS FRAGMENT
- MPAndroidChart Integration
- LineChart für Fortschrittskurve
- Mock-Daten anzeigen (später aus Room DB)
- Zeitraum-Auswahl (Woche/Monat/Jahr)
- Statistiken: Total Workouts, Streak, etc.

### 5. NUTRITION FRAGMENT
- Ernährungstipps anzeigen
- Placeholder für zukünftige Features:
  * Kalorienzähler
  * Makro-Tracking
  * Mahlzeiten-Log
- Material Cards für Content

### 6. SETTINGS FRAGMENT
- App-Einstellungen:
  * Benachrichtigungen
  * Theme (Dark/Light)
  * AR-Einstellungen
  * Über die App
- Preferences-Integration

### 7. AR COACH ACTIVITY (Kernfeature!)
- ARCore Session Management
- Camera Permission Handling
- ML Kit Pose Detection Integration
- Real-time Pose Rendering:
  * Skelett-Overlay auf Kamerabild
  * Gelenk-Punkte visualisieren
  * Verbindungslinien zeichnen
- Rep Counter:
  * Automatische Wiederholungserkennung
  * Squat-Detection-Algorithmus
  * Push-up-Detection-Algorithmus
  * Audio-Feedback (Beep bei Rep)
- UI Controls:
  * Pause/Resume Button
  * Stop Button
  * Rep-Counter-Anzeige
  * Status-Overlay
  * Form-Feedback ("Knie zu weit vorn", etc.)
- Error Handling:
  * ARCore nicht installiert
  * Kamera nicht verfügbar
  * Pose Detection fehlgeschlagen

### 8. POSE DETECTION SERVICE
- Service für kontinuierliche Pose-Analyse
- Algorithmen:
  * Squat-Form-Check
  * Push-up-Form-Check
  * Plank-Form-Check
- Winkelberechnungen zwischen Gelenken
- Form-Feedback-System
- Leistungszähler

### 9. WORKOUT REPOSITORY
- Suspend Functions für async ops
- Flow für reactive data
- Mock-Daten für:
  * Wochenplan
  * Workout History
  * Progress Stats
- Vorbereitung für Room-Integration

### 10. DATA MODELS
- TrainingDay (dayOfWeek, exercises, isRestDay)
- WorkoutProgress (date, exercise, sets, reps, weight)
- NutritionEntry (date, mealType, calories, macros)
- User Profile (optional)

### 11. UI/UX DESIGN
- Material Design 3 Theme
- Neon-Farbpalette:
  * Primary: Cyan (#00FFFF)
  * Secondary: Purple (#B400FF)
  * Background: Deep Black (#000000)
- Orbitron Font (futuristisch)
- Custom Drawables:
  * neon_button.xml (glow effect)
  * bg_gradient.xml
  * grid_pattern.xml
- Animations:
  * Fragment Transitions
  * Button Ripple Effects
  * Loading Animations
- Dark Theme standard

### 12. PERMISSIONS
- CAMERA (für AR Coach)
- INTERNET (für zukünftige Features)
- Optional: WRITE_EXTERNAL_STORAGE (für Workout-Logs)

### 13. TESTING
- Unit Tests für ViewModel
- Unit Tests für Repository
- Instrumented Tests für Fragments
- UI Tests mit Espresso

### 14. BUILD VARIANTS
- Debug Build:
  * Logging aktiviert
  * Debug-Menü
  * Test-Daten
- Release Build:
  * ProGuard/R8 aktiviert
  * Keine Logs
  * Optimiert
  * Signiert

### 15. ZUSÄTZLICHE FEATURES (Optional)
- Splash Screen
- Onboarding für neue User
- Workout-Timer
- Rest-Timer zwischen Sätzen
- Notification für Trainingsreminder
- Export/Import von Daten
- Sharing (Social Features)
- Achievements/Badges

## SPEZIFISCHE ANFORDERUNGEN

### AR COACH - DETAILLIERTE IMPLEMENTIERUNG

Die AR Coach Activity ist das Kernfeature. Bitte implementiere:

1. **ARCore Setup**:
   - ARCore Availability Check
   - Installation Dialog wenn nicht vorhanden
   - Session Configuration
   - Camera Stream Setup

2. **ML Kit Pose Detection**:
   - PoseDetector mit STREAM_MODE
   - InputImage von Camera Frame erstellen
   - Pose Processing in separatem Thread
   - 33 Pose Landmarks tracken

3. **Pose Rendering**:
   - Custom SurfaceView oder GLSurfaceView
   - Skelett zeichnen über Kamerabild:
     * Kopf
     * Schultern
     * Ellbogen
     * Handgelenke
     * Hüfte
     * Knie
     * Knöchel
   - Verbindungslinien zwischen Gelenken
   - Farb-Coding: Grün (gut), Gelb (okay), Rot (schlecht)

4. **Rep Detection Algorithmus**:
   
   SQUATS:
   - Berechne Knie-Winkel (Hüfte-Knie-Knöchel)
   - Tief-Position: Knie-Winkel < 90°
   - Hoch-Position: Knie-Winkel > 160°
   - Rep zählt wenn: Hoch → Tief → Hoch
   - Debounce: Min 1 Sekunde zwischen Reps

   PUSH-UPS:
   - Berechne Ellbogen-Winkel
   - Unten-Position: Ellbogen < 90°
   - Oben-Position: Ellbogen > 160°
   - Rep zählt wenn: Oben → Unten → Oben

5. **Form Feedback**:
   - Knie-Tracking bei Squats:
     * "Knie zu weit vorn" wenn über Zehen
     * "Gute Form!" wenn korrekt
   - Rücken-Tracking:
     * "Rücken gerade halten"
   - Hüfte-Tracking:
     * "Hüfte tiefer"

6. **Audio Feedback**:
   - MediaPlayer für Beep-Sound (res/raw/beep.ogg)
   - Sound bei jeder erfolgreichen Rep
   - Text-to-Speech für Form-Feedback (optional)

7. **Performance**:
   - 30 FPS Ziel
   - Frame Dropping wenn zu langsam
   - Optimierte Rendering-Pipeline

### PROGRESS FRAGMENT - CHARTS

MPAndroidChart Integration für schöne Graphen:

```kotlin
val lineChart = binding.chartProgress

// Daten vorbereiten
val entries = listOf(
    Entry(0f, 60f),  // Tag 0, Gewicht 60kg
    Entry(1f, 62f),
    Entry(2f, 65f),
    Entry(3f, 63f),
    Entry(4f, 67f),
    Entry(5f, 70f),
    Entry(6f, 72f)
)

val dataSet = LineDataSet(entries, "Bankdrücken (kg)")
dataSet.color = Color.parseColor("#00FFFF")  // Neon Cyan
dataSet.setCircleColor(Color.parseColor("#00FFFF"))
dataSet.lineWidth = 3f
dataSet.circleRadius = 6f
dataSet.setDrawValues(false)
dataSet.mode = LineDataSet.Mode.CUBIC_BEZIER

val lineData = LineData(dataSet)
lineChart.data = lineData

// Styling
lineChart.description.isEnabled = false
lineChart.legend.textColor = Color.parseColor("#00FFFF")
lineChart.xAxis.textColor = Color.parseColor("#00FFFF")
lineChart.axisLeft.textColor = Color.parseColor("#00FFFF")
lineChart.axisRight.isEnabled = false
lineChart.xAxis.position = XAxis.XAxisPosition.BOTTOM

lineChart.invalidate()  // Refresh
```

### VIEWMODEL PATTERN

Alle Fragments sollten ViewModels nutzen:

```kotlin
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

    private fun loadTrainingPlan() {
        viewModelScope.launch {
            _isLoading.value = true
            _errorMessage.value = null
            
            try {
                val plan = repository.getWeeklyTrainingPlan()
                _trainingPlan.value = plan
            } catch (e: Exception) {
                _errorMessage.value = "Fehler: ${e.message}"
            } finally {
                _isLoading.value = false
            }
        }
    }

    fun refresh() {
        loadTrainingPlan()
    }
}
```

### NAVIGATION SETUP

Navigation Graph (res/navigation/nav_graph.xml):

```xml
<navigation>
    <fragment
        android:id="@+id/menuFragment"
        android:name="com.example.ironreign.ui.MenuFragment"
        android:label="IronReign"
        tools:layout="@layout/fragment_menu">
        
        <action
            android:id="@+id/action_menu_to_trainings"
            app:destination="@id/trainingsFragment"
            app:enterAnim="@anim/slide_in_right"
            app:exitAnim="@anim/slide_out_left"
            app:popEnterAnim="@anim/slide_in_left"
            app:popExitAnim="@anim/slide_out_right" />
            
        <!-- Weitere Actions für andere Fragments -->
    </fragment>
    
    <!-- Weitere Fragments -->
</navigation>
```

## AUFGABEN FÜR DIE KI

Bitte hilf mir mit Folgendem:

1. **PROJEKT-SETUP**:
   - Android Studio-Projekt richtig konfigurieren
   - Alle Dependencies in build.gradle eintragen
   - Gradle Sync erfolgreich durchführen
   - SDK/NDK/Build-Tools prüfen

2. **FEHLENDE DATEIEN ERSTELLEN**:
   - Alle Layout-XMLs vollständig
   - Alle Kotlin-Klassen vollständig
   - Alle Ressourcen (colors, strings, themes, drawables)
   - Navigation Graph
   - Assets (Fonts, Sounds)

3. **AR COACH KOMPLETT IMPLEMENTIEREN**:
   - ARCore Integration
   - ML Kit Pose Detection
   - Skelett-Rendering
   - Rep-Counter-Logik
   - Form-Feedback-System
   - UI mit allen Controls

4. **ALLE FRAGMENTS FERTIGSTELLEN**:
   - Jedes Fragment mit vollständiger Funktionalität
   - ViewModels für alle Data-Screens
   - StateFlow-Observations
   - Error Handling
   - Loading States

5. **CHARTS & VISUALISIERUNG**:
   - MPAndroidChart in Progress Fragment
   - Schöne Neon-Style Charts
   - Mock-Daten anzeigen

6. **PERMISSIONS & RUNTIME**:
   - Kamera-Permission richtig implementieren
   - Runtime Permission Requests
   - Permission Denied Handling

7. **TESTING**:
   - Beispiel Unit Tests schreiben
   - Beispiel UI Tests schreiben

8. **BUILD & DEPLOYMENT**:
   - Debug-Build konfigurieren
   - Release-Build vorbereiten (ProGuard)
   - APK erfolgreich bauen

9. **TROUBLESHOOTING**:
   - Häufige Fehler erklären
   - Build-Probleme lösen
   - Gradle-Issues fixen

10. **OPTIMIERUNG**:
    - Performance-Tipps
    - Memory-Leaks vermeiden
    - Battery-Optimierung

## ERWARTETE AUSGABE

Ich erwarte von dir:

1. **Vollständiger Code** für alle fehlenden oder unvollständigen Dateien
2. **Schritt-für-Schritt-Anleitung** zur Implementierung
3. **Erklärungen** zu komplexen Teilen (AR, Pose Detection)
4. **Troubleshooting-Guide** für häufige Probleme
5. **Build-Anleitung** um die APK zu erstellen

Beginne mit den wichtigsten Komponenten:
1. MainActivity & Navigation
2. AR Coach Activity (vollständig!)
3. Trainings Fragment mit ViewModel
4. Progress Fragment mit Charts
5. Weitere Fragments

Für jeden Schritt:
- Gib den kompletten Code
- Erkläre was der Code macht
- Weise auf mögliche Probleme hin
- Gib Best Practices an

## WICHTIGE HINWEISE

- Nutze ViewBinding überall
- Nutze Kotlin Coroutines für async operations
- Nutze StateFlow statt LiveData (modern)
- Lifecycle-aware Components
- Memory Leaks vermeiden (ViewBinding cleanup)
- Error Handling überall
- Null-Safety beachten
- Material Design 3 Guidelines folgen
- Performance optimieren (60 FPS Ziel)
- Comments für komplexen Code

## ZUSÄTZLICHE FRAGEN

Falls etwas unklar ist, frage mich:
- Soll ich Room Database jetzt schon integrieren?
- Soll ich Retrofit für Backend vorbereiten?
- Welche zusätzlichen Features sind gewünscht?
- Soll ich Tests schreiben?

Lass uns anfangen! Beginne mit dem Projekt-Setup und dann implementieren wir Feature für Feature.
```

---

## 📋 PROMPT ENDE

**Kopiere alles von "PROMPT START" bis "PROMPT ENDE" und gib es der KI!**

