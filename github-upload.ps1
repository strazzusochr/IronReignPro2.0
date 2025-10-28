# IronReign Pro - GitHub Actions Setup (PowerShell)
# Vollautomatisches Upload-Script für Windows

Write-Host @"

╔═══════════════════════════════════════════╗
║  🏋️ IronReign Pro - GitHub Setup         ║
║  Automatischer Build in der Cloud        ║
╚═══════════════════════════════════════════╝

"@ -ForegroundColor Cyan

# Git-Installation prüfen
Write-Host "[1/6] Prüfe Git-Installation..." -ForegroundColor Yellow
try {
    $gitVersion = & git --version 2>&1
    Write-Host "  ✅ Git gefunden: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "  ❌ Git nicht gefunden!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Bitte installiere Git für Windows:" -ForegroundColor Yellow
    Write-Host "  https://git-scm.com/download/win" -ForegroundColor Cyan
    Write-Host ""
    Read-Host "Drücke Enter zum Beenden"
    exit 1
}

Write-Host ""

# GitHub Username
Write-Host "[2/6] GitHub-Account-Daten" -ForegroundColor Yellow
$githubUser = Read-Host "  Dein GitHub Username"

if ([string]::IsNullOrWhiteSpace($githubUser)) {
    Write-Host "  ❌ Username ist erforderlich!" -ForegroundColor Red
    Read-Host "Drücke Enter zum Beenden"
    exit 1
}

$repoName = "IronReignPro"

Write-Host ""
Write-Host "📦 Repository: $githubUser/$repoName" -ForegroundColor Cyan
Write-Host ""

# Bestätigung
$confirm = Read-Host "Repository auf GitHub existiert bereits? (J/N)"
if ($confirm -notmatch "^[Jj]") {
    Write-Host ""
    Write-Host "Bitte erstelle zuerst das Repository auf GitHub:" -ForegroundColor Yellow
    Write-Host "  1. Gehe zu: https://github.com/new" -ForegroundColor Cyan
    Write-Host "  2. Repository Name: $repoName" -ForegroundColor Cyan
    Write-Host "  3. Public oder Private (egal)" -ForegroundColor Cyan
    Write-Host "  4. NICHT 'Initialize with README' aktivieren" -ForegroundColor Red
    Write-Host "  5. Create Repository klicken" -ForegroundColor Cyan
    Write-Host ""
    Read-Host "Drücke Enter wenn fertig"
}

Write-Host ""
Write-Host "[3/6] Initialisiere Git..." -ForegroundColor Yellow

# Git initialisieren
if (Test-Path ".git") {
    Write-Host "  ℹ️  Git bereits initialisiert" -ForegroundColor Cyan
} else {
    & git init
    Write-Host "  ✅ Git initialisiert" -ForegroundColor Green
}

Write-Host ""
Write-Host "[4/6] Füge Dateien hinzu..." -ForegroundColor Yellow
& git add .
Write-Host "  ✅ Dateien hinzugefügt" -ForegroundColor Green

Write-Host ""
Write-Host "[5/6] Erstelle Commit..." -ForegroundColor Yellow
$commitExists = & git log --oneline 2>$null
if ($commitExists) {
    Write-Host "  ℹ️  Commits existieren bereits" -ForegroundColor Cyan
} else {
    & git commit -m "Initial commit - IronReign Pro with GitHub Actions"
    Write-Host "  ✅ Commit erstellt" -ForegroundColor Green
}

& git branch -M main

Write-Host ""
Write-Host "[6/6] Upload zu GitHub..." -ForegroundColor Yellow
Write-Host "  ⚠️  Du wirst nach Username/Passwort oder Token gefragt!" -ForegroundColor Yellow
Write-Host ""

# Remote hinzufügen
$remoteExists = & git remote get-url origin 2>$null
if ($remoteExists) {
    Write-Host "  ℹ️  Remote bereits konfiguriert" -ForegroundColor Cyan
} else {
    & git remote add origin "https://github.com/$githubUser/$repoName.git"
}

# Push
try {
    & git push -u origin main 2>&1
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "╔═══════════════════════════════════════════╗" -ForegroundColor Green
        Write-Host "║  ✅ ERFOLGREICH HOCHGELADEN! 🎉          ║" -ForegroundColor Green
        Write-Host "╚═══════════════════════════════════════════╝" -ForegroundColor Green
        Write-Host ""
        
        Write-Host "🤖 GitHub Actions baut jetzt automatisch die APK!" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "📍 Dein Repository:" -ForegroundColor Yellow
        Write-Host "   https://github.com/$githubUser/$repoName" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "📍 Build-Status (Actions):" -ForegroundColor Yellow
        Write-Host "   https://github.com/$githubUser/$repoName/actions" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "⏱️  Build dauert ca. 3-5 Minuten" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "📥 APK herunterladen:" -ForegroundColor Yellow
        Write-Host "   1. Öffne: https://github.com/$githubUser/$repoName/actions" -ForegroundColor White
        Write-Host "   2. Klicke auf den neuesten Workflow (grüner Haken = fertig)" -ForegroundColor White
        Write-Host "   3. Scrolle runter zu 'Artifacts'" -ForegroundColor White
        Write-Host "   4. Download 'ironreign-debug-apk.zip'" -ForegroundColor White
        Write-Host "   5. Entpacke ZIP → app-debug.apk" -ForegroundColor White
        Write-Host ""
        
        # Browser öffnen?
        $openBrowser = Read-Host "Actions-Seite im Browser öffnen? (J/N)"
        if ($openBrowser -match "^[Jj]") {
            Start-Process "https://github.com/$githubUser/$repoName/actions"
            Write-Host "  ✅ Browser geöffnet" -ForegroundColor Green
        }
        
    } else {
        throw "Push fehlgeschlagen"
    }
    
} catch {
    Write-Host ""
    Write-Host "╔═══════════════════════════════════════════╗" -ForegroundColor Red
    Write-Host "║  ❌ FEHLER BEIM UPLOAD                   ║" -ForegroundColor Red
    Write-Host "╚═══════════════════════════════════════════╝" -ForegroundColor Red
    Write-Host ""
    
    Write-Host "Mögliche Probleme:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "1️⃣  Repository existiert nicht auf GitHub" -ForegroundColor White
    Write-Host "   → Erstelle es: https://github.com/new" -ForegroundColor Cyan
    Write-Host "   → Name: $repoName" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "2️⃣  Falscher Username/Passwort" -ForegroundColor White
    Write-Host "   → Prüfe Zugangsdaten" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "3️⃣  2-Faktor-Authentifizierung aktiv?" -ForegroundColor White
    Write-Host "   → Erstelle Personal Access Token:" -ForegroundColor Cyan
    Write-Host "     https://github.com/settings/tokens" -ForegroundColor Cyan
    Write-Host "   → Nutze Token statt Passwort" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "4️⃣  Repository existiert bereits mit anderem Inhalt" -ForegroundColor White
    Write-Host "   → Force Push: git push -u origin main --force" -ForegroundColor Cyan
    Write-Host ""
}

Write-Host ""
Write-Host "═════════════════════════════════════════════" -ForegroundColor Cyan
Read-Host "Drücke Enter zum Beenden"
