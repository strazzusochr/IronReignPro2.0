#!/bin/bash
# IronReign Pro - Einfacher GitHub Upload
# Für Nutzer ohne Git-Kenntnisse

echo "🏋️ IronReign Pro - GitHub Actions Setup"
echo "========================================"
echo ""

# Prüfe ob Git installiert ist
if ! command -v git &> /dev/null; then
    echo "❌ Git ist nicht installiert!"
    echo ""
    echo "Bitte installiere Git:"
    echo "  Windows: https://git-scm.com/download/win"
    echo "  Mac: brew install git"
    echo "  Linux: sudo apt install git"
    echo ""
    exit 1
fi

echo "✅ Git gefunden"
echo ""

# GitHub Username abfragen
read -p "📝 Dein GitHub Username: " github_user

if [ -z "$github_user" ]; then
    echo "❌ Username ist erforderlich!"
    exit 1
fi

# Repository-Name
repo_name="IronReignPro"

echo ""
echo "📦 Initialisiere Git Repository..."
git init

echo ""
echo "📝 Füge Dateien hinzu..."
git add .

echo ""
echo "💾 Erstelle ersten Commit..."
git commit -m "Initial commit - IronReign Pro"

echo ""
echo "🌿 Erstelle main branch..."
git branch -M main

echo ""
echo "🔗 Verknüpfe mit GitHub..."
git remote add origin "https://github.com/$github_user/$repo_name.git"

echo ""
echo "📤 Pushe zu GitHub..."
echo ""
echo "⚠️  Du wirst nach deinem GitHub Token/Passwort gefragt!"
echo ""

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Erfolgreich hochgeladen!"
    echo ""
    echo "🎉 GitHub Actions wird nun automatisch die APK bauen!"
    echo ""
    echo "📍 Dein Repository:"
    echo "   https://github.com/$github_user/$repo_name"
    echo ""
    echo "📍 Actions-Status:"
    echo "   https://github.com/$github_user/$repo_name/actions"
    echo ""
    echo "⏱️  Build dauert ca. 3-5 Minuten"
    echo ""
    echo "📥 APK Download:"
    echo "   1. Gehe zu Actions Tab"
    echo "   2. Klicke auf neuesten Workflow"
    echo "   3. Scrolle zu 'Artifacts'"
    echo "   4. Download 'ironreign-debug-apk'"
    echo ""
else
    echo ""
    echo "❌ Fehler beim Upload!"
    echo ""
    echo "Mögliche Lösungen:"
    echo "  1. Repository auf GitHub.com erstellen:"
    echo "     https://github.com/new"
    echo "     Name: $repo_name"
    echo ""
    echo "  2. GitHub Token erstellen (wenn 2FA aktiv):"
    echo "     Settings → Developer Settings → Personal Access Tokens"
    echo ""
    echo "  3. Dann erneut versuchen"
fi
