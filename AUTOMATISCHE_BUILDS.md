# 🤖 IronReign Pro - Vollautomatische Build-Lösungen

**Keine manuelle Installation nötig!** Lass die APK automatisch bauen.

---

## 🎯 Methode 1: GitHub Actions (EMPFOHLEN) ⭐

**Vollautomatisch, kostenlos, keine Installation nötig!**

### Was passiert?
- ✅ GitHub baut die APK automatisch
- ✅ Bei jedem Upload/Push
- ✅ Fertige APK zum Download
- ✅ Kein Android Studio nötig
- ✅ Funktioniert auf allen Plattformen

### Setup (5 Minuten):

#### 1️⃣ GitHub Repository erstellen

**Option A - Über Website:**
1. Gehe zu: https://github.com
2. Klicke: **New Repository** (grüner Button)
3. Name: `IronReignPro`
4. **Public** oder **Private** (beides OK)
5. **NICHT** "Initialize with README" aktivieren
6. Klicke: **Create Repository**

**Option B - GitHub Desktop:**
1. Installiere: https://desktop.github.com/
2. File → New Repository
3. Name: `IronReignPro`
4. Publish to GitHub

#### 2️⃣ Projekt hochladen

**Via GitHub Desktop (Einfach):**
1. File → Add Local Repository
2. Wähle IronReignPro-Ordner
3. Commit to main
4. Push origin

**Via Git Command Line:**
```bash
cd IronReignPro
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/DEIN_USERNAME/IronReignPro.git
git push -u origin main
```

**Via Website (Upload):**
1. Im Repository: "uploading an existing file"
2. Ziehe alle Dateien in den Browser
3. Commit changes

#### 3️⃣ Build automatisch starten

**Der GitHub Actions Workflow ist bereits im Projekt!**

Sobald du pushst:
- ✅ Workflow startet automatisch
- ✅ Ubuntu-Server wird gestartet
- ✅ Android SDK wird installiert
- ✅ APK wird gebaut
- ✅ Nach 3-5 Minuten: **Fertige APK!**

#### 4️⃣ APK herunterladen

1. Gehe zu: **Actions** Tab in GitHub
2. Klicke auf den neuesten Workflow-Run
3. Scrolle runter zu **Artifacts**
4. Download: **ironreign-debug-apk**
5. ZIP entpacken → **app-debug.apk**

### Manueller Build triggern:

1. GitHub Repository → **Actions** Tab
2. Wähle: "Build IronReign Pro APK"
3. **Run workflow** Button
4. Warte 3-5 Minuten
5. Download APK unter Artifacts

### Release erstellen (Optional):

```bash
git tag v1.0.0
git push origin v1.0.0
```

→ Automatisch wird ein Release mit APK erstellt!

---

## 🐳 Methode 2: Docker Build

**Vollautomatisch in isolierter Umgebung**

### Voraussetzung:
- Docker installiert: https://www.docker.com/products/docker-desktop/

### Build-Prozess:

```bash
# 1. Zum Projekt-Verzeichnis
cd IronReignPro

# 2. Docker-Image bauen (einmalig, ~10 Min)
docker build -t ironreign-builder .

# 3. APK bauen
docker run --rm -v "%cd%\output:/output" ironreign-builder
```

**Linux/Mac:**
```bash
docker run --rm -v "$(pwd)/output:/output" ironreign-builder
```

### Ergebnis:
- APK in `output/ironreign-debug.apk`
- Vollautomatisch gebaut
- Saubere, isolierte Umgebung

---

## ☁️ Methode 3: GitLab CI (Alternative)

**Wie GitHub Actions, aber auf GitLab**

### Setup:

1. **GitLab Account**: https://gitlab.com
2. **Neues Projekt** erstellen
3. Code hochladen
4. Workflow-Datei: `.gitlab-ci.yml` (siehe unten)

### .gitlab-ci.yml:

```yaml
image: mingc/android-build-box:latest

stages:
  - build

build_apk:
  stage: build
  script:
    - chmod +x gradlew
    - ./gradlew assembleDebug
  artifacts:
    paths:
      - app/build/outputs/apk/debug/app-debug.apk
    expire_in: 30 days
```

### APK Download:
- CI/CD → Pipelines → Neueste Pipeline
- Download Artifacts

---

## 🌐 Methode 4: Online Build Services

### **Appetize.io** (Android in Browser)
- Upload APK
- Teste im Browser
- https://appetize.io/

### **CircleCI** (CI/CD)
- https://circleci.com/
- Android Build Support
- 6000 Min/Monat kostenlos

### **Travis CI**
- https://travis-ci.org/
- Android unterstützt

---

## 🔄 Methode 5: Automatischer lokaler Build

**Windows Task Scheduler + Script**

### Setup:

#### 1. PowerShell-Script: `auto-build.ps1`

```powershell
# IronReign Pro - Auto Build Script
$projectPath = "C:\Pfad\Zu\IronReignPro"
$outputPath = "C:\APK-Output"

cd $projectPath

Write-Host "🏋️ Starte automatischen Build..." -ForegroundColor Cyan

# Build
.\gradlew.bat clean assembleDebug

# APK kopieren
$apk = "app\build\outputs\apk\debug\app-debug.apk"
if (Test-Path $apk) {
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    Copy-Item $apk "$outputPath\ironreign-$timestamp.apk"
    Write-Host "✅ APK gebaut: ironreign-$timestamp.apk" -ForegroundColor Green
} else {
    Write-Host "❌ Build fehlgeschlagen!" -ForegroundColor Red
}
```

#### 2. Task Scheduler einrichten:

1. **Windows-Taste + R** → `taskschd.msc`
2. **Aktion** → **Aufgabe erstellen**
3. **Allgemein**:
   - Name: "IronReign Auto Build"
4. **Trigger**:
   - Neu → Täglich/Wöchentlich (nach Wahl)
5. **Aktionen**:
   - Neu → Programm starten
   - Programm: `powershell.exe`
   - Argumente: `-File "C:\Pfad\Zu\auto-build.ps1"`
6. **OK** → Fertig!

→ APK wird automatisch gebaut nach Schedule!

---

## 📊 Vergleich der Methoden

| Methode | Setup | Build-Zeit | Kosten | Internet |
|---------|-------|------------|--------|----------|
| **GitHub Actions** | 5 Min | 3-5 Min | Kostenlos | Ja |
| **Docker** | 10 Min | 2-3 Min | Kostenlos | Nein* |
| **GitLab CI** | 5 Min | 3-5 Min | Kostenlos | Ja |
| **Task Scheduler** | 10 Min | 1-3 Min | Kostenlos | Nein* |

*Nur beim ersten Build

---

## ⭐ Beste Wahl für dich:

### Du willst NULL Installation?
→ **GitHub Actions** (Methode 1)

### Du hast Docker?
→ **Docker Build** (Methode 2)

### Du willst automatische Builds?
→ **GitHub Actions** + Auto-Trigger

### Du baust oft lokal?
→ **Task Scheduler** (Methode 5)

---

## 🎯 Empfohlener Workflow (GitHub Actions)

```
1. Code ändern
      ↓
2. Git commit + push
      ↓
3. ☕ Warte 3-5 Min
      ↓
4. Download APK von GitHub
      ↓
5. Auf Smartphone installieren
      ↓
6. Fertig! 🎉
```

**Kein Android Studio, kein SDK-Setup, keine Probleme!**

---

## 🚀 GitHub Actions Setup - Schritt für Schritt

### Visuell erklärt:

```
GitHub.com
    ↓
Neues Repository erstellen
    ↓
IronReignPro-Dateien hochladen
    ↓
[.github/workflows/build-apk.yml wird erkannt]
    ↓
GitHub Actions startet automatisch
    ↓
Ubuntu-Server wird gestartet (kostenlos!)
    ↓
Android SDK wird installiert
    ↓
Gradle Dependencies werden geladen
    ↓
APK wird gebaut
    ↓
APK wird als Artifact gespeichert
    ↓
Du lädst APK herunter (fertig!)
```

### Nach erstem Push:

1. **Gehe zu**: https://github.com/DEIN_USERNAME/IronReignPro
2. **Klicke**: Actions Tab
3. **Siehst**: "Build IronReign Pro APK" läuft
4. **Warte**: ~3-5 Minuten
5. **Status**: ✅ Grünes Häkchen = Erfolg!
6. **Klicke**: Auf den Workflow-Run
7. **Scrolle**: Runter zu "Artifacts"
8. **Download**: ironreign-debug-apk.zip
9. **Entpacke**: ZIP → app-debug.apk
10. **Installiere**: Auf Smartphone

---

## 🔧 GitHub Actions - Erweiterte Features

### Automatischer Build bei Tag:

```bash
git tag v1.0.0
git push origin v1.0.0
```
→ Erstellt automatisch ein GitHub Release mit APK!

### Build Status Badge:

Füge in README.md ein:
```markdown
![Build Status](https://github.com/DEIN_USERNAME/IronReignPro/workflows/Build%20IronReign%20Pro%20APK/badge.svg)
```

### Build-Matrix (mehrere APKs):

Bearbeite `.github/workflows/build-apk.yml`:
```yaml
strategy:
  matrix:
    variant: [debug, release]
```

---

## 💡 Pro-Tipps

### Tipp 1: Build-Zeit verkürzen
- Dependencies werden gecacht
- Erster Build: 5 Min
- Weitere Builds: 2-3 Min

### Tipp 2: Private Repository
- Code bleibt privat
- Actions funktionieren trotzdem
- APK nur für dich sichtbar

### Tipp 3: Notifications
- GitHub → Settings → Notifications
- Email bei fertigem Build

### Tipp 4: Mehrere Branches
- `develop` Branch → Auto-Test
- `main` Branch → Release-Build

### Tipp 5: Schedule Builds
```yaml
on:
  schedule:
    - cron: '0 2 * * *'  # Täglich um 2 Uhr nachts
```

---

## ❓ FAQ

### Kostet GitHub Actions Geld?
**Nein!** Kostenlos für Public Repos und 2000 Min/Monat für Private.

### Brauche ich Android Studio?
**Nein!** GitHub baut alles in der Cloud.

### Kann ich den Build anpassen?
**Ja!** Bearbeite `.github/workflows/build-apk.yml`

### Wie lange bleiben APKs gespeichert?
**30 Tage** (konfigurierbar)

### Kann ich Release-APKs bauen?
**Ja!** Aber du brauchst einen Keystore (siehe unten)

---

## 🔐 Release-Build mit GitHub Actions

### 1. Keystore erstellen:

```bash
keytool -genkey -v -keystore ironreign.keystore -alias ironreign -keyalg RSA -keysize 2048 -validity 10000
```

### 2. Keystore als Secret in GitHub:

1. Repository → Settings → Secrets → New secret
2. Name: `KEYSTORE_FILE`
   - Wert: Base64 von Keystore
   ```bash
   base64 ironreign.keystore | pbcopy
   ```
3. Name: `KEYSTORE_PASSWORD`
4. Name: `KEY_ALIAS`
5. Name: `KEY_PASSWORD`

### 3. Workflow anpassen:

Siehe erweiterte Workflow-Datei im Projekt.

---

## 📞 Support

Bei Fragen:
- **GitHub Actions Logs** anschauen
- **build-apk.yml** prüfen
- Google: "GitHub Actions Android build"

---

**Mit GitHub Actions: Nie wieder lokale Build-Probleme! 🎉**

Einfach Code pushen, APK downloaden, fertig!
