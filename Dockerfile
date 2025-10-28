# IronReign Pro - Docker Build Container
# Baut die APK vollautomatisch in isolierter Umgebung

FROM ubuntu:22.04

# Umgebungsvariablen
ENV ANDROID_SDK_ROOT=/opt/android-sdk
ENV ANDROID_HOME=/opt/android-sdk
ENV PATH=${PATH}:${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin:${ANDROID_SDK_ROOT}/platform-tools

# Zeitzone setzen (verhindert interaktive Prompts)
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -snf /usr/share/zoneinfo/Europe/Berlin /etc/localtime && echo Europe/Berlin > /etc/timezone

# System-Updates und Basis-Tools
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    wget \
    unzip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Android SDK installieren
RUN mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools && \
    cd ${ANDROID_SDK_ROOT}/cmdline-tools && \
    wget -q https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip && \
    unzip commandlinetools-linux-9477386_latest.zip && \
    mv cmdline-tools latest && \
    rm commandlinetools-linux-9477386_latest.zip

# SDK-Lizenzen akzeptieren
RUN yes | sdkmanager --licenses

# Android SDK Komponenten installieren
RUN sdkmanager \
    "platform-tools" \
    "platforms;android-34" \
    "build-tools;34.0.0"

# Arbeitsverzeichnis
WORKDIR /app

# Projekt-Dateien kopieren
COPY . .

# Gradle Wrapper ausführbar machen
RUN chmod +x gradlew

# Dependencies vorherunterladen (Cache)
RUN ./gradlew dependencies || true

# Build-Script erstellen
RUN echo '#!/bin/bash\n\
set -e\n\
echo "🏋️ IronReign Pro - Docker Build"\n\
echo "================================"\n\
echo ""\n\
echo "📦 Bereinige altes Build..."\n\
./gradlew clean\n\
echo ""\n\
echo "🔨 Baue Debug APK..."\n\
./gradlew assembleDebug --stacktrace\n\
echo ""\n\
APK_PATH="app/build/outputs/apk/debug/app-debug.apk"\n\
if [ -f "$APK_PATH" ]; then\n\
    echo "✅ Build erfolgreich!"\n\
    echo "📦 APK: $APK_PATH"\n\
    echo "📊 Größe: $(du -h $APK_PATH | cut -f1)"\n\
    cp $APK_PATH /output/ironreign-debug.apk 2>/dev/null || true\n\
    echo ""\n\
    echo "APK wurde nach /output/ kopiert"\n\
else\n\
    echo "❌ Build fehlgeschlagen!"\n\
    exit 1\n\
fi\n\
' > /app/docker-build.sh && chmod +x /app/docker-build.sh

# Volume für Output
VOLUME ["/output"]

# Standard-Command
CMD ["/app/docker-build.sh"]
