#!/bin/bash

domain="$1"
dir=$(echo "$domain" | cut -d "." -f 1)

mkdir -p output
mkdir -p "output/$dir"

echo "[+] Iniciando enumeração..."

subfinder -d "$domain" -silent -o "output/$dir/subfinder.txt" > /dev/null 2>&1 &
assetfinder --subs-only "$domain" > "output/$dir/assetfinder.txt" 2>/dev/null &
amass enum -D "$domain" > "output/$dir/amass.txt" 2>/dev/null &

wait

echo "[+] Unificando resultados..."

sort -u "output/$dir/subfinder.txt" "output/$dir/assetfinder.txt" "output/$dir/amass.txt" > "output/$dir/all.txt"

httpx -l "output/$dir/all.txt" -o "output/$dir/alive.txt" > /dev/null 2>&1

echo "[+] Enumeração finalizada."
echo "[+] Você pode visualizar o resultado da enumeração no diretório output/${dir}"
