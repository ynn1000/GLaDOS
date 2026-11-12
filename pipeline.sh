#!/bin/bash

pipeline(){
	local domain="$1"
	local dir=$(echo "$domain" | cut -d "." -f 1)
	local output_dir="$GLADOS_DIR/output/$dir"

	mkdir -p "$output_dir"

	echo "[+] Iniciando enumeração..."

	subfinder -d "$domain" -silent -o "$output_dir/subfinder.txt" > /dev/null 2>&1 &
	assetfinder --subs-only "$domain" > "$output_dir/assetfinder.txt" 2>/dev/null &
	amass enum -D "$domain" > "$output_dir/amass.txt" 2>/dev/null &

	wait

	echo "[+] Unificando resultados..."

	sort -u "$output_dir/subfinder.txt" "$output_dir/assetfinder.txt" "$output_dir/amass.txt" > "$output_dir/all.txt"

	httpx -l "$output_dir/all.txt" -o "$output_dir/alive.txt" > /dev/null 2>&1

	echo "[+] Enumeração finalizada."
	echo "[+] Você pode visualizar o resultado da enumeração no diretório $output_dir"
}

