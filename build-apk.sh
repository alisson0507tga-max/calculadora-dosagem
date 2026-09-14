#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
WORK="/tmp/calculadora-apk-build"
BASE_APK="$WORK/base.apk"
rm -rf "$WORK"
mkdir -p "$WORK/unpacked"
git -C "$ROOT" show 0bf2fc1:CalculadoraDosagem.apk > "$BASE_APK"
unzip -q "$BASE_APK" -d "$WORK/unpacked"
cp "$ROOT/android/app/src/main/assets/index.html" "$WORK/unpacked/assets/index.html"
rm -rf "$WORK/unpacked/META-INF"
rm -f "$WORK/unsigned.apk" "$WORK/aligned.apk" "$WORK/signed.apk"
(cd "$WORK/unpacked" && zip -q -X -r "$WORK/unsigned.apk" .)
zipalign -f -p 4 "$WORK/unsigned.apk" "$WORK/aligned.apk"
keytool -genkeypair -v -keystore "$WORK/apk-signing.jks" -storepass calculadora -keypass calculadora -alias calculadora -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Calculadora de Dosagem, OU=Mobile, O=Calculadora, L=BR, ST=BR, C=BR" >/dev/null 2>&1
apksigner sign --ks "$WORK/apk-signing.jks" --ks-pass pass:calculadora --key-pass pass:calculadora --out "$WORK/signed.apk" "$WORK/aligned.apk" >/dev/null
cp "$WORK/signed.apk" "$ROOT/CalculadoraDosagem.apk"
apksigner verify --verbose "$ROOT/CalculadoraDosagem.apk"
unzip -tq "$ROOT/CalculadoraDosagem.apk"
unzip -p "$ROOT/CalculadoraDosagem.apk" assets/index.html | grep -q 'width:calc(100% - 32px)'
echo "APK criado: $ROOT/CalculadoraDosagem.apk"
ls -lh "$ROOT/CalculadoraDosagem.apk"
