#!/bin/bash

domain="$1"

mkdir -p output

echo "[+] Iniciando enumeração..."

subfinder -d "$domain" -silent -o output/subfinder.txt > /dev/null 2>&1 &
assetfinder --subs-only "$domain" > output/assetfinder.txt 2>/dev/null &
amass enum -D "$domain" > output/amass.txt 2>/dev/null &

wait

echo "[+] Unificando resultados..."

sort -u output/subfinder.txt output/assetfinder.txt output/amass.txt > output/all.txt

httpx -l output/all.txt -o output/alive.txt > /dev/null 2>&1

echo "[+] Enumeração finalizada."
echo "[+] Você pode visualizar o resultado da enumeração no diretório /output."
