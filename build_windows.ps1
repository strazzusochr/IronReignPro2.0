# =========================================
# IronReign Pro - PowerShell Build Script
# =========================================

# Setze PowerShell-Eigenschaften
$ErrorActionPreference = "Stop"
$Host.UI.RawUI.WindowTitle = "IronReign Pro Builder"

# Farben definieren
function Write-ColorOutput($ForegroundColor) {
    $fc = $host.UI.RawUI.ForegroundColor
    $host.UI.RawUI.ForegroundColor = $ForegroundColor
    if ($args) {
        Write-Output $args
    }
    $host.UI.RawUI.ForegroundColor = $fc
}

function Write-Success($message) {
    Write-ColorOutput Green "✓ $message"
}

function Write-Error($message) {
    Write-ColorOutput Red "✗ $message"
}

function Write-Info($message) {
    Write-ColorOutput Cyan "ℹ $message"
}

function Write-Step($step, $total, $message) {
    Write-ColorOutput Yellow "`n[$step/$total] $message"
}

# Header
Clear-Host
Write-ColorOutput Cyan @"

====================================
  🏋️ IronReign Pro - APK Builder
====================================

"@

# 1. Verzeichnis prüfen
Write-Step 1 8 "Prüfe Projektverzeichnis..."
if (-not (Test-Path "gradlew.bat")) {
    Write-Error "gradlew.bat nicht gefunden!"
    Write-Host "`nBitte dieses Script im IronReignPro-Hauptverzeichnis ausführen."
    Read-Host "Drücke Enter zum Beenden"
    exit 1
}
Write-Success "Projektverzeichnis gefunden"

# 2. Java-Version prüfen
Write-Step 2 8 "Prüfe Java-Installation..."
try {
    $javaVersion = & java -version 2>&1 | Select-String "version"
    Write-Success "Java gefunden: $javaVersion"
    
    # Java 17 prüfen
    if ($javaVersion -match 'version "17') {
        Write-Success "Java 17 erkannt (empfohlen)"
    } elseif ($javaVersion -match 'version "1[1-9]|[2-9][0-9]') {
        Write-Info "Java Version ist OK (17+ wird empfohlen)"
    } else {
        Write-Error "Java 17 wird empfohlen!"
        Write-Info "Download: https://adoptium.net/"
    }
} catch {
    Write-Error "Java nicht gefunden!"
    Write-Host "`nBitte installiere JDK 17 von: https://adoptium.net/"
    Read-Host "Drücke Enter zum Beenden"
    exit 1
}

# 3. Android SDK prüfen
Write-Step 3 8 "Prüfe Android SDK..."
$androidHome = $env:ANDROID_HOME

if (-not $androidHome) {
    Write-Info "ANDROID_HOME nicht gesetzt, versuche Standard-Pfad..."
    $defaultSdkPath = "$env:USERPROFILE\AppData\Local\Android\Sdk"
    
    if (Test-Path $defaultSdkPath) {
        $env:ANDROID_HOME = $defaultSdkPath
        $androidHome = $defaultSdkPath
        Write-Success "Android SDK gefunden: $androidHome"
    } else {
        Write-Error "Android SDK nicht gefunden!"
        Write-Host @"

Bitte installiere Android Studio oder setze ANDROID_HOME:
  PowerShell:  `$env:ANDROID_HOME = "C:\Pfad\Zu\Android\Sdk"
  CMD:         set ANDROID_HOME=C:\Pfad\Zu\Android\Sdk

Oder füge zu Umgebungsvariablen hinzu:
  System > Erweiterte Systemeinstellungen > Umgebungsvariablen

"@
        Read-Host "Drücke Enter zum Beenden"
        exit 1
    }
} else {
    Write-Success "ANDROID_HOME: $androidHome"
}

# SDK Platform 34 prüfen
$platform34 = "$androidHome\platforms\android-34"
if (Test-Path $platform34) {
    Write-Success "Android SDK 34 installiert"
} else {
    Write-Error "Android SDK 34 (API 34) nicht gefunden!"
    Write-Info "Installiere über Android Studio SDK Manager"
}

# 4. Gradle Wrapper-Permissions (falls auf Linux/Mac ausgeführt)
Write-Step 4 8 "Bereite Gradle vor..."
if (Test-Path "gradlew") {
    try {
        & chmod +x gradlew 2>$null
    } catch {
        # Ignoriere Fehler auf Windows
    }
}
Write-Success "Gradle bereit"

# 5. Abhängigkeiten prüfen
Write-Step 5 8 "Prüfe Projekt-Abhängigkeiten..."
Write-Info "Führe Gradle Dependencies Check aus..."
try {
    & .\gradlew.bat dependencies --console=plain > $null 2>&1
    Write-Success "Abhängigkeiten geprüft"
} catch {
    Write-Info "Abhängigkeiten werden beim Build heruntergeladen"
}

# 6. Projekt bereinigen
Write-Step 6 8 "Bereinige altes Build..."
try {
    & .\gradlew.bat clean --console=plain
    Write-Success "Build-Verzeichnis bereinigt"
} catch {
    Write-Error "Fehler beim Clean: $_"
    Read-Host "Drücke Enter zum Beenden"
    exit 1
}

# 7. Debug-APK bauen
Write-Step 7 8 "Baue Debug-APK..."
Write-Info "Dies kann beim ersten Mal 5-10 Minuten dauern..."
Write-Info "Gradle lädt Dependencies herunter...`n"

$buildStartTime = Get-Date

try {
    # Build mit Fortschrittsanzeige
    & .\gradlew.bat assembleDebug --console=plain
    
    if ($LASTEXITCODE -ne 0) {
        throw "Build fehlgeschlagen mit Exit-Code: $LASTEXITCODE"
    }
    
    $buildEndTime = Get-Date
    $buildDuration = $buildEndTime - $buildStartTime
    
    Write-Success "Build erfolgreich! (Dauer: $($buildDuration.Minutes)m $($buildDuration.Seconds)s)"
    
} catch {
    Write-Error "Build fehlgeschlagen!"
    Write-Host "`nFehlerdetails: $_"
    Write-Host "`nHäufige Lösungen:"
    Write-Host "  1. Internetverbindung prüfen (für Gradle-Downloads)"
    Write-Host "  2. Android SDK 34 im SDK Manager installieren"
    Write-Host "  3. gradlew.bat clean ausführen und erneut versuchen"
    Write-Host "  4. Projekt in Android Studio öffnen für detaillierte Fehler"
    Read-Host "`nDrücke Enter zum Beenden"
    exit 1
}

# 8. APK-Details anzeigen
Write-Step 8 8 "APK-Details"

$apkPath = "app\build\outputs\apk\debug\app-debug.apk"

if (Test-Path $apkPath) {
    $apkFile = Get-Item $apkPath
    $apkSizeMB = [math]::Round($apkFile.Length / 1MB, 2)
    
    Write-ColorOutput Green @"

====================================
  ✓ BUILD ERFOLGREICH! 🎉
====================================

APK-Datei:
  $($apkFile.FullName)

Größe:
  $apkSizeMB MB ($($apkFile.Length) Bytes)

Erstellt:
  $($apkFile.LastWriteTime)

"@

    # Installation-Optionen
    Write-ColorOutput Cyan "Installation-Optionen:"
    Write-Host @"

Option 1 - Manuell:
  1. Kopiere APK auf dein Android-Gerät
  2. Aktiviere: Einstellungen > Sicherheit > Unbekannte Quellen
  3. Tippe auf APK-Datei zum Installieren

Option 2 - Via ADB (USB):
  adb install "$apkPath"

Option 3 - Via ADB (WLAN):
  adb connect <Gerät-IP>:5555
  adb install "$apkPath"

"@

    # Ordner öffnen
    Write-ColorOutput Yellow "═══════════════════════════════════"
    $openFolder = Read-Host "Möchtest du den Ordner mit der APK öffnen? (J/N)"
    if ($openFolder -match "^[Jj]") {
        Start-Process explorer.exe -ArgumentList "/select,`"$($apkFile.FullName)`""
        Write-Success "Ordner geöffnet"
    }
    
    # APK auf Gerät installieren?
    Write-Host ""
    $installNow = Read-Host "Möchtest du die APK jetzt via ADB installieren? (J/N)"
    if ($installNow -match "^[Jj]") {
        Write-Info "Prüfe verbundene Geräte..."
        $devices = & adb devices 2>&1
        
        if ($devices -match "device$") {
            Write-Info "Installiere APK auf Gerät..."
            & adb install -r $apkPath
            
            if ($LASTEXITCODE -eq 0) {
                Write-Success "App erfolgreich installiert!"
                
                # App starten?
                $startApp = Read-Host "`nApp jetzt starten? (J/N)"
                if ($startApp -match "^[Jj]") {
                    & adb shell am start -n com.example.ironreign/.MainActivity
                    Write-Success "App gestartet!"
                }
            } else {
                Write-Error "Installation fehlgeschlagen"
            }
        } else {
            Write-Error "Kein Android-Gerät gefunden!"
            Write-Info "Verbinde dein Gerät via USB und aktiviere USB-Debugging"
        }
    }
    
} else {
    Write-Error "APK-Datei wurde nicht gefunden!"
    Write-Host "Erwarteter Pfad: $apkPath"
}

Write-ColorOutput Cyan @"

====================================
  Build-Prozess abgeschlossen
====================================

"@

# Build-Log speichern?
$saveLog = Read-Host "Build-Log speichern? (J/N)"
if ($saveLog -match "^[Jj]") {
    $logPath = "build_log_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"
    & .\gradlew.bat assembleDebug --console=plain > $logPath 2>&1
    Write-Success "Log gespeichert: $logPath"
}

Read-Host "`nDrücke Enter zum Beenden"
