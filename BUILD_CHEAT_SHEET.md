# ⚡ IronReign Pro - Build Cheat Sheet

**Schnell-Referenz** für alle wichtigen Befehle.

---

## 🚀 Schnellstart (Copy & Paste)

### PowerShell (Empfohlen)
```powershell
cd C:\Pfad\Zu\IronReignPro
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
.\build_windows.ps1
```

### CMD
```cmd
cd C:\Pfad\Zu\IronReignPro
build_windows.bat
```

### Manuell
```cmd
cd C:\Pfad\Zu\IronReignPro
gradlew.bat assembleDebug
```

---

## 📦 Build-Befehle

| Befehl | Beschreibung | Dauer |
|--------|--------------|-------|
| `gradlew.bat assembleDebug` | Debug-APK bauen | 1-3 Min |
| `gradlew.bat assembleRelease` | Release-APK bauen | 2-4 Min |
| `gradlew.bat clean` | Build-Ordner löschen | 10 Sek |
| `gradlew.bat build` | Alles bauen + Tests | 3-5 Min |
| `gradlew.bat installDebug` | APK bauen + installieren | 2-4 Min |

---

## 🔍 Prüf-Befehle

| Befehl | Prüft |
|--------|-------|
| `java -version` | Java-Installation |
| `echo %ANDROID_HOME%` | Android SDK Pfad |
| `adb version` | ADB-Installation |
| `adb devices` | Verbundene Geräte |
| `gradlew.bat -v` | Gradle-Version |

---

## 📱 Installation

### Via ADB
```cmd
adb install app\build\outputs\apk\debug\app-debug.apk
adb install -r app\build\outputs\apk\debug\app-debug.apk  (Re-install)
```

### App starten
```cmd
adb shell am start -n com.example.ironreign/.MainActivity
```

### App deinstallieren
```cmd
adb uninstall com.example.ironreign
```

---

## 🧹 Cleanup-Befehle

```cmd
:: Build-Ordner löschen
gradlew.bat clean

:: Gradle-Cache löschen
rmdir /s /q .gradle
rmdir /s /q %USERPROFILE%\.gradle\caches

:: Alles zurücksetzen
gradlew.bat clean
rmdir /s /q build
rmdir /s /q app\build
```

---

## 🐛 Debug-Befehle

```cmd
:: Mit Stacktrace
gradlew.bat assembleDebug --stacktrace

:: Mit Debug-Info
gradlew.bat assembleDebug --debug

:: Mit vollständigen Infos
gradlew.bat assembleDebug --info

:: Scan für Build-Performance
gradlew.bat assembleDebug --scan
```

---

## 📊 Info-Befehle

```cmd
:: Projekt-Info
gradlew.bat projects

:: Tasks anzeigen
gradlew.bat tasks

:: Dependencies anzeigen
gradlew.bat dependencies

:: Properties anzeigen
gradlew.bat properties
```

---

## 🔧 Erweiterte Befehle

### Lint Check
```cmd
gradlew.bat lint
```
Report: `app\build\reports\lint-results.html`

### Unit Tests
```cmd
gradlew.bat test
```
Report: `app\build\reports\tests\testDebugUnitTest\index.html`

### Code Coverage
```cmd
gradlew.bat jacocoTestReport
```

### APK Analysieren
```cmd
gradlew.bat assembleDebug --scan
```

---

## 🌐 ADB Netzwerk-Befehle

```cmd
:: WLAN-Modus aktivieren
adb tcpip 5555

:: Via WLAN verbinden (IP vom Gerät)
adb connect 192.168.1.XXX:5555

:: Verbindung prüfen
adb devices

:: Verbindung trennen
adb disconnect
```

---

## 📁 Wichtige Pfade

```
Debug-APK:
app\build\outputs\apk\debug\app-debug.apk

Release-APK:
app\build\outputs\apk\release\app-release.apk

Logs:
app\build\outputs\logs\

Lint-Report:
app\build\reports\lint-results.html

Test-Report:
app\build\reports\tests\
```

---

## ⚙️ Umgebungsvariablen

### Temporär setzen (CMD)
```cmd
set ANDROID_HOME=C:\Users\NAME\AppData\Local\Android\Sdk
set PATH=%PATH%;%ANDROID_HOME%\platform-tools
```

### Temporär setzen (PowerShell)
```powershell
$env:ANDROID_HOME = "C:\Users\NAME\AppData\Local\Android\Sdk"
$env:PATH += ";$env:ANDROID_HOME\platform-tools"
```

### Permanent setzen
```
Windows → Systemeinstellungen → Umgebungsvariablen
Neu → ANDROID_HOME → C:\...\Android\Sdk
Path → Bearbeiten → Neu → %ANDROID_HOME%\platform-tools
```

---

## 🔑 Keystore-Befehle

### Keystore erstellen
```cmd
keytool -genkey -v -keystore ironreign.keystore -alias ironreign -keyalg RSA -keysize 2048 -validity 10000
```

### Keystore-Info anzeigen
```cmd
keytool -list -v -keystore ironreign.keystore
```

### APK signieren (manuell)
```cmd
jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 -keystore ironreign.keystore app-release-unsigned.apk ironreign
```

---

## 🚨 Fehler-Lösungen (Quick Fix)

### "Java not found"
```cmd
where java
set PATH=%PATH%;C:\Program Files\Java\jdk-17\bin
```

### "SDK not found"
```cmd
set ANDROID_HOME=C:\Users\%USERNAME%\AppData\Local\Android\Sdk
```

### "Gradle build failed"
```cmd
gradlew.bat clean
gradlew.bat assembleDebug --refresh-dependencies
```

### "Out of memory"
Bearbeite `gradle.properties`:
```properties
org.gradle.jvmargs=-Xmx6g
```

### "APK not found"
```cmd
dir /s app-debug.apk
```

---

## 📊 Performance-Tipps

```properties
# gradle.properties
org.gradle.jvmargs=-Xmx4g -XX:MaxMetaspaceSize=512m
org.gradle.parallel=true
org.gradle.caching=true
org.gradle.daemon=true
android.enableJetifier=true
android.useAndroidX=true
```

---

## 🎯 Häufige Build-Sequenzen

### Frischer Build
```cmd
gradlew.bat clean assembleDebug
```

### Build + Install
```cmd
gradlew.bat clean installDebug
```

### Build + Install + Start
```cmd
gradlew.bat installDebug
adb shell am start -n com.example.ironreign/.MainActivity
```

### Full Quality Check
```cmd
gradlew.bat clean lint test assembleDebug
```

---

## 📱 Device-Info

```cmd
:: Geräte-Info
adb shell getprop ro.product.model
adb shell getprop ro.build.version.release

:: App-Info
adb shell pm list packages | findstr ironreign
adb shell dumpsys package com.example.ironreign

:: Logcat (Live)
adb logcat | findstr IronReign

:: Logcat (Filtered)
adb logcat -s "IronReign:*"
```

---

## ⏱️ Build-Zeiten

| Build-Typ | Erste Build | Weitere Builds |
|-----------|-------------|----------------|
| Clean | 3-5 Min | 2-3 Min |
| Incremental | - | 30-60 Sek |
| Mit Tests | 5-8 Min | 3-4 Min |

---

## 💡 Pro-Tipps

1. **Gradle Daemon** läuft im Hintergrund → Builds sind schneller
2. **Build Cache** → Gradle cacht Ergebnisse
3. **Incremental Builds** → Nur geänderte Files werden neu gebaut
4. **Offline Mode**: `gradlew.bat assembleDebug --offline` (wenn Dependencies gecacht)
5. **Parallel Execution**: Bereits in `gradle.properties` aktiviert

---

**Gespeichert für schnelles Copy & Paste! ⚡**
