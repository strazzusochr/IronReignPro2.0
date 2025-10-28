# 🚀 IronReign Pro - Quick Start Guide

**5-Minuten-Anleitung** um das Projekt zu bauen und auszuführen.

---

## 📋 Voraussetzungen (Checklist)

- [ ] **Android Studio** installiert (Electric Eel oder neuer)
- [ ] **JDK 17** installiert und im PATH
- [ ] **Android SDK** installiert mit:
  - [ ] SDK Platform 34 (Android 14)
  - [ ] Build Tools 34.0.0
  - [ ] Android SDK Platform-Tools
- [ ] **Gerät/Emulator** mit Android 8.0+ (API 26+)

---

## ⚡ Schnellstart (3 Schritte)

### 1️⃣ Projekt in Android Studio öffnen

```bash
# Projekt-Verzeichnis öffnen
File → Open → IronReignPro auswählen
```

Android Studio wird automatisch:
- Gradle Sync durchführen
- Dependencies herunterladen
- Projekt konfigurieren

**Wartezeit**: ~2-5 Minuten (beim ersten Mal)

---

### 2️⃣ Gerät/Emulator verbinden

**Option A - Physisches Gerät**:
1. USB-Debugging in Entwickleroptionen aktivieren
2. Gerät per USB verbinden
3. USB-Debugging-Anfrage bestätigen

**Option B - Emulator**:
1. Tools → Device Manager
2. Create Virtual Device
3. Pixel 6 Pro mit API 34 auswählen
4. Emulator starten

---

### 3️⃣ App starten

**Klicke auf grünen Play-Button** ▶️ in Toolbar

Oder:
```
Run → Run 'app' (Shift + F10)
```

**Fertig!** 🎉 Die App sollte nun auf deinem Gerät laufen.

---

## 🛠️ Build via Kommandozeile (Optional)

### Projekt bauen

```bash
# In Projekt-Verzeichnis navigieren
cd IronReignPro

# Debug-Build erstellen
./gradlew assembleDebug

# Ausgabe: app/build/outputs/apk/debug/app-debug.apk
```

### Auf Gerät installieren

```bash
# Automatisch auf verbundenem Gerät installieren
./gradlew installDebug

# Oder manuell via adb
adb install app/build/outputs/apk/debug/app-debug.apk
```

### App starten

```bash
adb shell am start -n com.example.ironreign/.MainActivity
```

---

## 🔧 Troubleshooting (Häufige Probleme)

### ❌ Problem: "SDK not found"

**Lösung**: ANDROID_HOME setzen

```bash
# macOS/Linux (in ~/.bashrc oder ~/.zshrc)
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Windows (System-Umgebungsvariablen)
ANDROID_HOME=C:\Users\YourName\AppData\Local\Android\Sdk
Path=%Path%;%ANDROID_HOME%\tools;%ANDROID_HOME%\platform-tools
```

---

### ❌ Problem: "Gradle sync failed"

**Lösung 1**: File → Invalidate Caches → Invalidate and Restart

**Lösung 2**: Gradle neu herunterladen
```bash
./gradlew --stop
rm -rf ~/.gradle/caches
./gradlew build
```

---

### ❌ Problem: "No devices found"

**Lösung**: 
- Gerät: USB-Debugging aktivieren und Gerät neu verbinden
- Emulator: Emulator neu starten

Prüfen ob Gerät erkannt wird:
```bash
adb devices
```

---

### ❌ Problem: "ARCore not installed"

**Lösung**: ARCore aus Google Play Store installieren

Oder App ohne AR-Features testen (andere Screens funktionieren).

---

## 📱 App-Features testen

### 1. Menu-Screen (Start)
- ✅ 5 Buttons sollten sichtbar sein
- ✅ Neon-Blue-Theme
- ✅ Orbitron-Font

### 2. Trainingsplan
- Klick auf "Trainingsplan"
- ✅ Wochenplan mit Montag-Sonntag
- ✅ Emoji-Icons vor Tagen

### 3. AR Coach (Experimental)
- Klick auf "AR Coach starten"
- ✅ Kamera-Permission-Dialog
- ✅ ARCore-Installation-Check
- ⚠️ Funktioniert nur auf ARCore-fähigen Geräten

### 4. Navigation
- ✅ Zurück-Button navigiert zum Menu
- ✅ Keine Crashes bei Screen-Rotation

---

## 🎯 Entwickler-Modus

### Hot Reload aktivieren (für schnellere Entwicklung)

```
File → Settings → Build, Execution, Deployment → Compiler
✓ Build project automatically

Registry (Ctrl+Shift+Alt+/)
✓ compiler.automake.allow.when.app.running
```

### Logcat verwenden

```
View → Tool Windows → Logcat

# Filter für IronReign:
Filter: package:com.example.ironreign
```

### Layout-Inspektor

```
Tools → Layout Inspector
Wähle laufenden Prozess: com.example.ironreign
```

---

## 📚 Weiterführende Ressourcen

- **Vollständige Dokumentation**: Siehe `README.md`
- **Technische Analyse**: Siehe `PROJEKT_ANALYSE.md`
- **Android Docs**: https://developer.android.com

---

## 🆘 Support

Bei Problemen:

1. **Gradle Clean**:
   ```bash
   ./gradlew clean build
   ```

2. **Cache löschen**: 
   File → Invalidate Caches

3. **Projekt neu öffnen**

4. **Logs checken**: 
   Logcat → Filter com.example.ironreign

---

## ✅ Erfolgs-Checklist

Nach erfolgreichem Start solltest du sehen:

- [ ] App startet ohne Crash
- [ ] Menu-Screen mit 5 Buttons
- [ ] Neon-Blue-Design mit schwarzem Hintergrund
- [ ] Orbitron-Font sichtbar
- [ ] Trainingsplan zeigt Wochenplan
- [ ] Navigation funktioniert
- [ ] Keine Fehlermeldungen im Logcat

---

**Viel Erfolg! 💪**

*Bei weiteren Fragen siehe README.md oder PROJEKT_ANALYSE.md*
