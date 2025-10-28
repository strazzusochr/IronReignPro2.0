# 🏋️ IronReign Pro - Futuristic AR Fitness Coach

Eine moderne Android-Fitness-App mit AR-Coach, Pose Detection und futuristischem Neon-Design.

## 📱 Features

- **AI AR Coach**: Augmented Reality Trainer mit ML Kit Pose Detection
- **Trainingsplan**: Wöchentlicher Trainingsplan mit verschiedenen Muskelgruppen
- **Fortschritt**: Visualisierung des Trainingsfortschritts mit Diagrammen
- **Ernährung**: Ernährungstipps und Tracking
- **Futuristisches Design**: Neon-Farbschema mit Cyber-Ästhetik

## 🏗️ Architektur

Das Projekt folgt modernen Android-Development-Best-Practices:

- **MVVM Architecture**: ViewModel + StateFlow für reaktive UI
- **Clean Architecture**: Klare Trennung von UI, Domain und Data Layer
- **Material Design 3**: Moderne UI-Komponenten mit Custom Theme
- **ViewBinding**: Type-safe View-Zugriff
- **Coroutines & Flow**: Asynchrone Operationen
- **Navigation Component**: Single-Activity Architecture

### Projektstruktur

```
app/
├── src/main/
│   ├── java/com/example/ironreign/
│   │   ├── MainActivity.kt
│   │   ├── ARCoachActivity.kt
│   │   ├── data/
│   │   │   ├── WorkoutRepository.kt
│   │   │   └── model/
│   │   │       └── TrainingDay.kt
│   │   └── ui/
│   │       ├── MenuFragment.kt
│   │       ├── TrainingsFragment.kt
│   │       ├── ProgressFragment.kt
│   │       ├── NutritionFragment.kt
│   │       ├── SettingsFragment.kt
│   │       └── viewmodels/
│   │           └── TrainingsViewModel.kt
│   ├── res/
│   │   ├── layout/
│   │   ├── drawable/
│   │   ├── values/
│   │   ├── navigation/
│   │   └── font/
│   └── AndroidManifest.xml
└── build.gradle
```

## 🛠️ Technologie-Stack

- **Language**: Kotlin 1.9.0
- **Min SDK**: 26 (Android 8.0)
- **Target SDK**: 34 (Android 14)
- **Compile SDK**: 34
- **AGP**: 8.3.0
- **Gradle**: 8.4
- **JDK**: 17

### Dependencies

- **AndroidX**:
  - Core KTX 1.13.1
  - AppCompat 1.7.0
  - ConstraintLayout 2.2.0
  - Navigation Component 2.7.7

- **Material Design**:
  - Material Components 1.12.0

- **AR & ML**:
  - ARCore 1.44.0
  - ML Kit Pose Detection 17.0.0

- **Charts**:
  - MPAndroidChart v3.1.0 (via JitPack)

## 🚀 Build-Anleitung

### Voraussetzungen

1. **Android Studio** (Electric Eel oder neuer)
2. **JDK 17** (empfohlen: OpenJDK 17)
3. **Android SDK**:
   - SDK Platform 34
   - Build Tools 34.0.0
   - Platform Tools

### Installation

1. **Projekt klonen/entpacken**

2. **Android SDK konfigurieren**:
   ```bash
   export ANDROID_HOME=/path/to/android/sdk
   export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools
   ```

3. **Projekt öffnen** in Android Studio
   - File → Open → IronReignPro-Verzeichnis auswählen
   - Gradle Sync durchführen

4. **Build ausführen**:
   ```bash
   # Debug-Build
   ./gradlew assembleDebug
   
   # Release-Build (signiert)
   ./gradlew assembleRelease
   
   # Installieren auf verbundenem Gerät
   ./gradlew installDebug
   
   # Tests ausführen
   ./gradlew test
   
   # Lint-Check
   ./gradlew lint
   ```

### Android Studio Build

1. **Sync Project with Gradle Files** (Toolbar)
2. **Build → Make Project** (Ctrl+F9)
3. **Run** (Shift+F10) oder **Debug** (Shift+F9)

## 📋 Beheobene Probleme & Optimierungen

### ✅ Strukturelle Verbesserungen

1. **Gradle-Konfiguration modernisiert**:
   - Veraltete `buildscript`/`allprojects` durch `plugins` DSL ersetzt
   - `pluginManagement` und `dependencyResolutionManagement` in `settings.gradle`
   - JitPack Repository für MPAndroidChart hinzugefügt

2. **Gradle Wrapper hinzugefügt**:
   - Gradle 8.4 (kompatibel mit AGP 8.3.0)
   - Wrapper-Skripte für Unix/Windows
   - Konsistente Build-Umgebung

3. **AndroidManifest modernisiert**:
   - Deprecated `package=` Attribut entfernt
   - Namespace nur noch in `build.gradle` definiert

### ✅ Ressourcen & UI

4. **Fehlende Drawables erstellt**:
   - `neon_button.xml` - Futuristischer Button-Style
   - `bg_gradient.xml` - Dunkler Gradient-Hintergrund
   - `grid_pattern.xml` - Cyber-Grid-Muster

5. **Erweiterte Farbpalette**:
   - Vollständige Material Design 3 Farben
   - Neon-Akzentfarben (Cyan, Purple, Pink, Green)
   - Semantische Farbnamen

6. **Material Design 3 Theme**:
   - Neue `themes.xml` mit MD3-Support
   - Dynamische Farben und Typografie
   - Orbitron-Font Integration

7. **Verbessertes AR Coach Layout**:
   - Status-Overlay mit Echtzeit-Info
   - Rep-Counter Card
   - Control-Buttons (Pause/Stop)
   - Futuristisches Design

### ✅ Code-Architektur

8. **MVVM Implementation**:
   - `TrainingsViewModel` mit StateFlow
   - Lifecycle-aware Coroutines
   - Unidirectional Data Flow

9. **Data Layer**:
   - Erweiterte `WorkoutRepository` mit Coroutines
   - Data Models (`TrainingDay`, `WorkoutProgress`, `NutritionEntry`)
   - Mock-Daten für Demonstration

10. **Verbesserte Fragments**:
    - ViewBinding in allen Fragments
    - Memory-Leak-Prevention
    - Moderne StateFlow-Observation

11. **ARCoachActivity Enhancement**:
    - Permission-Handling
    - ARCore Installation Check
    - ViewBinding
    - Pause/Resume Lifecycle
    - Audio-Feedback
    - Rep-Counter-Logik

### 📝 Best Practices Implementiert

- ✅ ViewBinding statt findViewById
- ✅ Coroutines für asynchrone Operationen
- ✅ StateFlow für reaktive UI
- ✅ Lifecycle-aware Komponenten
- ✅ Repository Pattern
- ✅ Null-Safety
- ✅ Resource-Cleanup in onDestroy
- ✅ Error Handling
- ✅ Logging & Exception-Handling
- ✅ Material Design 3 Richtlinien

## 🎨 Design-System

### Farbpalette

- **Primary**: `#00FFFF` (Neon Cyan)
- **Secondary**: `#B400FF` (Neon Purple)
- **Background**: `#000000` (Deep Black)
- **Surface**: `#0A0A0A` (Dark Gray)
- **Accent**: Neon Pink, Green, Yellow

### Typografie

- **Font Family**: Orbitron (Futuristisch)
- **Headings**: Bold, 20-24sp
- **Body**: Regular, 14-16sp
- **Captions**: Regular, 12sp

## 🔧 Fehlersuche

### Build-Fehler

**Problem**: `Plugin 'com.android.application' not found`
- **Lösung**: Gradle Sync durchführen, Repositories prüfen

**Problem**: `SDK not found`
- **Lösung**: `ANDROID_HOME` Umgebungsvariable setzen

### Runtime-Fehler

**Problem**: ARCore nicht verfügbar
- **Lösung**: ARCore aus Play Store installieren

**Problem**: Kamera-Permission fehlt
- **Lösung**: App-Berechtigungen in Einstellungen prüfen

## 📄 Lizenz

Copyright © 2025 IronReign. Alle Rechte vorbehalten.

## 👥 Kontakt

Bei Fragen oder Problemen, bitte ein Issue erstellen oder Kontakt aufnehmen.

---

**Built with ❤️ using Modern Android Development**
