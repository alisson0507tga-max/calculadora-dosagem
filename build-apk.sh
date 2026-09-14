#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
WORK="/tmp/calculadora-apk-build"
rm -rf "$WORK"
mkdir -p "$WORK/unpacked"
unzip -q "$ROOT/CalculadoraDosagem.apk" -d "$WORK/unpacked"
cp "$ROOT/android/app/src/main/assets/index.html" "$WORK/unpacked/assets/index.html"
rm -f "$WORK/unpacked"/META-INF/*.SF "$WORK/unpacked"/META-INF/*.RSA "$WORK/unpacked"/META-INF/*.DSA "$WORK/unsigned.apk" "$WORK/signed.apk"
(cd "$WORK/unpacked" && zip -q -X -r "$WORK/unsigned.apk" .)
if [ ! -f "$ROOT/.apk-release.jks" ]; then
  keytool -genkeypair -v -keystore "$ROOT/.apk-release.jks" -storepass calculadora -keypass calculadora -alias calculadora -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Calculadora de Dosagem, OU=Mobile, O=Calculadora, L=BR, ST=BR, C=BR" >/dev/null 2>&1
fi
jarsigner -keystore "$ROOT/.apk-release.jks" -storepass calculadora -keypass calculadora -sigalg SHA256withRSA -digestalg SHA-256 -signedjar "$WORK/signed.apk" "$WORK/unsigned.apk" calculadora >/dev/null
cp "$WORK/signed.apk" "$ROOT/CalculadoraDosagem.apk"
rm -f "$ROOT/.apk-release.jks"
unzip -tq "$ROOT/CalculadoraDosagem.apk"
unzip -p "$ROOT/CalculadoraDosagem.apk" assets/index.html | grep -q 'width:calc(100% - 32px)'
echo "APK criado: $ROOT/CalculadoraDosagem.apk"
ls -lh "$ROOT/CalculadoraDosagem.apk"
