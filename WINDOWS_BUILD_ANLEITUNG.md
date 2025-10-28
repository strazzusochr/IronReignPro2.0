# 🪟 Windows Build-Anleitung für IronReign Pro

**Vollständige Anleitung** zum Bauen der APK unter Windows mit CMD oder PowerShell.

---

## 📋 Voraussetzungen installieren

### 1. Java Development Kit (JDK) 17 installieren

**Download**: https://adoptium.net/

1. Gehe auf die Website
2. Wähle: **OpenJDK 17 (LTS)** für **Windows**
3. Lade **MSI-Installer** herunter
4. Installiere mit Standard-Optionen
5. ✅ Aktiviere Option: **Add to PATH**

**Prüfen**:
```cmd
java -version
```
Sollte zeigen: `openjdk version "17.x.x"`

---

### 2. Android Studio installieren (für Android SDK)

**Download**: https://developer.android.com/studio

#### Installation:

1. **Android Studio Installer** herunterladen und ausführen
2. **Standard-Installation** wählen
3. Bei **SDK Components**:
   - ✅ Android SDK
   - ✅ Android SDK Platform
   - ✅ Android Virtual Device

#### SDK Manager konfigurieren:

Nach Installation öffne: **Tools → SDK Manager**

**SDK Platforms** Tab:
- ✅ Android 14.0 (API Level 34) ← **WICHTIG!**
- ✅ Show Package Details aktivieren
- Wähle: Android SDK Platform 34

**SDK Tools** Tab:
- ✅ Android SDK Build-Tools 34.0.0
- ✅ Android SDK Platform-Tools
- ✅ Android SDK Tools

Klicke **Apply** und warte auf Download (~2 GB).

---

### 3. Umgebungsvariablen setzen

**ANDROID_HOME** muss gesetzt werden:

#### Automatisch (Empfohlen):

Standardpfad ist meist: `C:\Users\DEIN_NAME\AppData\Local\Android\Sdk`

#### Manuell setzen:

1. **Windows-Taste** drücken, suche: "Umgebungsvariablen"
2. **Systemumgebungsvariablen bearbeiten**
3. Klicke **Umgebungsvariablen**
4. Bei **Systemvariablen** klicke **Neu**:
   - **Variable**: `ANDROID_HOME`
   - **Wert**: `C:\Users\DEIN_NAME\AppData\Local\Android\Sdk`
5. Bearbeite **Path**, füge hinzu:
   - `%ANDROID_HOME%\platform-tools`
   - `%ANDROID_HOME%\tools`
6. Klicke überall **OK**
7. **CMD/PowerShell NEU starten** (wichtig!)

**Prüfen**:
```cmd
echo %ANDROID_HOME%
adb version
```

---

## 🚀 APK Bauen - 3 Methoden

### Methode 1: PowerShell-Script (Empfohlen) ⭐

**Am einfachsten und interaktiv!**

1. **PowerShell als Administrator** öffnen:
   - Rechtsklick auf **Windows-Taste**
   - Wähle: **Windows PowerShell (Administrator)**

2. **Zum Projektordner navigieren**:
   ```powershell
   cd C:\Pfad\Zu\IronReignPro
   ```

3. **Execution Policy temporär ändern** (falls Fehler):
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
   ```

4. **Build-Script ausführen**:
   ```powershell
   .\build_windows.ps1
   ```

5. **Folge den Anweisungen** - das Script macht alles automatisch:
   - ✅ Prüft Java & Android SDK
   - ✅ Baut die APK
   - ✅ Zeigt APK-Pfad an
   - ✅ Bietet Installation via ADB an
   - ✅ Kann APK-Ordner öffnen

**Dauer**: 3-10 Minuten (beim ersten Mal)

---

### Methode 2: CMD Batch-Script

**Klassische Windows-Methode**

1. **Eingabeaufforderung** öffnen:
   - **Windows-Taste + R**
   - Tippe: `cmd`
   - Enter

2. **Zum Projekt navigieren**:
   ```cmd
   cd C:\Pfad\Zu\IronReignPro
   ```

3. **Build-Script ausführen**:
   ```cmd
   build_windows.bat
   ```

4. **Warte auf Fertigstellung** - Script zeigt Fortschritt an

---

### Methode 3: Manuell mit Gradle

**Für erfahrene Nutzer**

```cmd
cd C:\Pfad\Zu\IronReignPro

:: Projekt bereinigen
gradlew.bat clean

:: Debug-APK bauen
gradlew.bat assembleDebug

:: Release-APK bauen (signiert - benötigt Keystore)
gradlew.bat assembleRelease
```

**APK-Pfad**:
```
IronReignPro\app\build\outputs\apk\debug\app-debug.apk
```

---

## 📱 APK auf Gerät installieren

### Option A: Manuell (Einfach)

1. **APK auf Smartphone kopieren**:
   - Via USB-Kabel
   - Via Cloud (Google Drive, Dropbox)
   - Via E-Mail an dich selbst

2. **Auf dem Smartphone**:
   - Gehe zu: **Einstellungen → Sicherheit**
   - Aktiviere: **Installation aus unbekannten Quellen**
   - Öffne **Datei-Manager**
   - Tippe auf `app-debug.apk`
   - Tippe **Installieren**

---

### Option B: Via ADB (USB)

**Voraussetzung**: USB-Debugging aktiviert

#### USB-Debugging aktivieren:

1. Auf dem Smartphone:
   - **Einstellungen → Über das Telefon**
   - Tippe **7x** auf **Build-Nummer**
   - Entwickleroptionen sind nun aktiviert
2. Gehe zu: **Einstellungen → Entwickleroptionen**
3. Aktiviere: **USB-Debugging**

#### Installation via ADB:

```cmd
:: Gerät verbinden und prüfen
adb devices

:: APK installieren
adb install app\build\outputs\apk\debug\app-debug.apk

:: App starten
adb shell am start -n com.example.ironreign/.MainActivity
```

---

### Option C: Via ADB (WLAN)

**Ohne USB-Kabel!**

1. **Smartphone und PC im selben WLAN**

2. **USB-Debugging einmal aktivieren** (siehe Option B)

3. **Smartphone via USB verbinden** (einmalig):
   ```cmd
   adb tcpip 5555
   ```

4. **USB trennen**, dann:
   ```cmd
   adb connect SMARTPHONE_IP:5555
   ```
   
   Smartphone-IP finden: **Einstellungen → WLAN → Verbundenes Netzwerk → IP-Adresse**

5. **APK installieren**:
   ```cmd
   adb install app\build\outputs\apk\debug\app-debug.apk
   ```

---

## 🔧 Troubleshooting

### ❌ "Java wurde nicht gefunden"

**Lösung**:
1. JDK 17 von https://adoptium.net/ installieren
2. Bei Installation: **"Add to PATH"** aktivieren
3. CMD/PowerShell **NEU starten**
4. Prüfen: `java -version`

---

### ❌ "ANDROID_HOME ist nicht gesetzt"

**Lösung**:
1. Android Studio installieren
2. Umgebungsvariable setzen (siehe oben)
3. CMD/PowerShell **NEU starten**
4. Prüfen: `echo %ANDROID_HOME%`

**Häufige Pfade**:
```
C:\Users\DEIN_NAME\AppData\Local\Android\Sdk
```

---

### ❌ "SDK Platform 34 not found"

**Lösung**:
1. Android Studio öffnen
2. **Tools → SDK Manager**
3. **SDK Platforms** Tab:
   - ✅ Android 14.0 (API Level 34)
4. **Apply** klicken und warten

---

### ❌ "Gradle build failed"

**Mögliche Lösungen**:

**1. Clean Build**:
```cmd
gradlew.bat clean
gradlew.bat assembleDebug
```

**2. Gradle Cache löschen**:
```cmd
rmdir /s /q .gradle
gradlew.bat assembleDebug
```

**3. Gradle neu herunterladen**:
```cmd
rmdir /s /q %USERPROFILE%\.gradle\caches
gradlew.bat --refresh-dependencies assembleDebug
```

**4. Offline-Build deaktivieren**:
Prüfe `gradle.properties`, entferne:
```
org.gradle.offline=true
```

---

### ❌ "Execution policy" Fehler (PowerShell)

**Fehler**: `cannot be loaded because running scripts is disabled`

**Lösung**:
```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
.\build_windows.ps1
```

Oder Script mit CMD starten:
```cmd
build_windows.bat
```

---

### ❌ "Out of memory" beim Build

**Lösung**: Erhöhe Gradle-Speicher

Bearbeite `gradle.properties`:
```properties
org.gradle.jvmargs=-Xmx4g -Dfile.encoding=UTF-8
```

Ändere `4g` zu `6g` oder `8g` (je nach verfügbarem RAM)

---

### ❌ Build dauert ewig

**Normal beim ersten Build!**
- Gradle lädt Dependencies herunter (~500 MB)
- Dauer: 5-15 Minuten beim ersten Mal
- Danach: 1-3 Minuten

**Beschleunigen**:
1. Bessere Internetverbindung
2. Gradle Daemon aktivieren (bereits aktiviert)
3. Build Cache nutzen (bereits aktiviert)

---

### ❌ APK installiert nicht auf Smartphone

**Lösungen**:

**1. Unbekannte Quellen erlauben**:
- Einstellungen → Sicherheit
- "Installation aus unbekannten Quellen" aktivieren

**2. Alte Version deinstallieren**:
```cmd
adb uninstall com.example.ironreign
adb install -r app-debug.apk
```

**3. Signatur-Konflikt**:
Falls eine Play Store-Version existiert, deinstalliere diese zuerst.

---

## 📊 Build-Varianten

### Debug-Build (Standard)

```cmd
gradlew.bat assembleDebug
```

**Eigenschaften**:
- ✅ Schneller Build
- ✅ Debugging aktiviert
- ✅ Selbst-signiert
- ⚠️ Größere APK
- ⚠️ Nicht für Play Store

**APK**: `app\build\outputs\apk\debug\app-debug.apk`

---

### Release-Build (Optimiert)

**Benötigt Keystore!**

**1. Keystore erstellen**:
```cmd
keytool -genkey -v -keystore ironreign.keystore -alias ironreign -keyalg RSA -keysize 2048 -validity 10000
```

**2. signing.properties erstellen**:
```properties
storeFile=../ironreign.keystore
storePassword=DEIN_PASSWORD
keyAlias=ironreign
keyPassword=DEIN_PASSWORD
```

**3. Release bauen**:
```cmd
gradlew.bat assembleRelease
```

**Eigenschaften**:
- ✅ Optimiert mit R8/ProGuard
- ✅ ~40% kleinere APK
- ✅ Bessere Performance
- ✅ Play Store-ready

**APK**: `app\build\outputs\apk\release\app-release.apk`

---

## 🎯 Häufige Fragen (FAQ)

### Wie lange dauert der Build?
- **Erster Build**: 5-15 Minuten (Downloads)
- **Weitere Builds**: 1-3 Minuten
- **Clean Build**: 2-5 Minuten

### Wie groß ist die APK?
- **Debug**: ~8-12 MB
- **Release**: ~5-8 MB (optimiert)

### Kann ich ohne Android Studio bauen?
- **Ja!** Du brauchst nur:
  - JDK 17
  - Android SDK (aus Android Studio)
  - Dieses Projekt

### Funktioniert das auch offline?
- **Erster Build**: Nein (Dependencies-Download)
- **Weitere Builds**: Ja (wenn Dependencies gecacht)

### Kann ich das auf anderen Windows-PCs bauen?
- **Ja!** Nutze `gradlew.bat` (enthält Gradle)
- Benötigt nur: JDK 17 + Android SDK

---

## 📁 Build-Ordner-Struktur

Nach erfolgreichem Build:

```
IronReignPro\
├── app\
│   └── build\
│       └── outputs\
│           └── apk\
│               ├── debug\
│               │   └── app-debug.apk          ← Hier ist die APK!
│               └── release\
│                   └── app-release.apk        ← Release-APK
├── build_windows.bat
├── build_windows.ps1
└── gradlew.bat
```

---

## 🎉 Erfolg!

Nach erfolgreichem Build kannst du:

1. ✅ APK auf dein Smartphone übertragen
2. ✅ App installieren und testen
3. ✅ An Freunde weitergeben
4. ✅ Für Play Store vorbereiten (Release-Build)

**Viel Spaß mit deiner IronReign Pro App! 💪**

---

## 📞 Weitere Hilfe

- **Projekt-README**: `README.md`
- **Technische Analyse**: `PROJEKT_ANALYSE.md`
- **Quick Start**: `QUICK_START.md`

