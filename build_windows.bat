@echo off
:: =========================================
:: IronReign Pro - Windows Build Script
:: =========================================

echo.
echo ====================================
echo  IronReign Pro - APK Builder
echo ====================================
echo.

:: Farbige Ausgabe (optional)
color 0A

:: 1. Verzeichnis prüfen
echo [1/7] Pruefe Projektverzeichnis...
if not exist "gradlew.bat" (
    echo FEHLER: gradlew.bat nicht gefunden!
    echo Bitte dieses Script im IronReignPro-Hauptverzeichnis ausfuehren.
    pause
    exit /b 1
)
echo   OK - Projektverzeichnis gefunden
echo.

:: 2. Java-Version prüfen
echo [2/7] Pruefe Java-Installation...
java -version 2>&1 | findstr /C:"version" > nul
if errorlevel 1 (
    echo FEHLER: Java nicht gefunden!
    echo Bitte installiere JDK 17 von: https://adoptium.net/
    pause
    exit /b 1
)
java -version
echo.

:: 3. Android SDK prüfen
echo [3/7] Pruefe Android SDK...
if not defined ANDROID_HOME (
    echo WARNUNG: ANDROID_HOME ist nicht gesetzt!
    echo Versuche Standard-Pfade...
    
    if exist "%USERPROFILE%\AppData\Local\Android\Sdk" (
        set ANDROID_HOME=%USERPROFILE%\AppData\Local\Android\Sdk
        echo   Gefunden: %ANDROID_HOME%
    ) else (
        echo FEHLER: Android SDK nicht gefunden!
        echo.
        echo Bitte installiere Android Studio oder setze ANDROID_HOME:
        echo   set ANDROID_HOME=C:\Pfad\Zu\Android\Sdk
        echo.
        pause
        exit /b 1
    )
) else (
    echo   OK - ANDROID_HOME: %ANDROID_HOME%
)
echo.

:: 4. Gradle Wrapper vorbereiten
echo [4/7] Bereite Gradle vor...
if not exist ".gradle" mkdir .gradle
echo   Gradle-Verzeichnis bereit
echo.

:: 5. Projekt bereinigen
echo [5/7] Bereinige altes Build...
call gradlew.bat clean
if errorlevel 1 (
    echo FEHLER beim Clean!
    pause
    exit /b 1
)
echo   Build-Verzeichnis bereinigt
echo.

:: 6. Debug-APK bauen
echo [6/7] Baue Debug-APK...
echo   Dies kann einige Minuten dauern...
echo.
call gradlew.bat assembleDebug --stacktrace
if errorlevel 1 (
    echo.
    echo FEHLER beim Build!
    echo Siehe obige Fehlermeldungen fuer Details.
    pause
    exit /b 1
)
echo.
echo   OK - Build erfolgreich!
echo.

:: 7. APK-Pfad anzeigen
echo [7/7] APK wurde erstellt!
echo.
set APK_PATH=app\build\outputs\apk\debug\app-debug.apk

if exist "%APK_PATH%" (
    echo ====================================
    echo  BUILD ERFOLGREICH!
    echo ====================================
    echo.
    echo APK-Datei:
    echo   %CD%\%APK_PATH%
    echo.
    
    :: Dateigröße anzeigen
    for %%A in ("%APK_PATH%") do (
        echo Groesse: %%~zA Bytes
    )
    echo.
    
    :: APK-Ordner öffnen?
    echo Moechtest du den Ordner mit der APK oeffnen?
    echo.
    choice /C JN /M "Ordner oeffnen? (J/N)"
    if errorlevel 2 goto :skip_open
    if errorlevel 1 (
        start "" "%CD%\app\build\outputs\apk\debug"
    )
    :skip_open
    
    echo.
    echo Naechste Schritte:
    echo   1. APK auf dein Android-Geraet kopieren
    echo   2. Auf dem Geraet: Einstellungen ^> Sicherheit ^> Unbekannte Quellen erlauben
    echo   3. APK-Datei antippen und installieren
    echo.
    echo Oder via ADB installieren:
    echo   adb install "%APK_PATH%"
    echo.
) else (
    echo FEHLER: APK-Datei wurde nicht gefunden!
    echo Erwarteter Pfad: %APK_PATH%
)

echo ====================================
pause
