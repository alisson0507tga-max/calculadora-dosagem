#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
APK_DIR="$ROOT/android/app/build/outputs/apk/release"
UNSIGNED="$APK_DIR/app-release-unsigned.apk"
ALIGNED="$APK_DIR/app-release-aligned.apk"
KEYSTORE="$APK_DIR/release-key.jks"
OUT="$ROOT/CalculadoraDosagem-v1.3.3.apk"
[ -s "$UNSIGNED" ]
rm -f "$ALIGNED" "$OUT" "$KEYSTORE"
zipalign -f -p 4 "$UNSIGNED" "$ALIGNED"
keytool -genkeypair -v -keystore "$KEYSTORE" -storepass calculadora -keypass calculadora -alias calculadora -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Calculadora de Dosagem, OU=Mobile, O=Calculadora, L=BR, ST=BR, C=BR" >/dev/null 2>&1
apksigner sign --ks "$KEYSTORE" --ks-pass pass:calculadora --key-pass pass:calculadora --out "$OUT" "$ALIGNED" >/dev/null
apksigner verify --verbose "$OUT"
zipalign -c 4 "$OUT"
unzip -tq "$OUT"
rm -f "$KEYSTORE"
echo "APK nativo criado: $OUT"
ls -lh "$OUT"
