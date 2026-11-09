```

  ░██████  ░██                    ░███████     ░██████     ░██████   
 ░██   ░██ ░██                    ░██   ░██   ░██   ░██   ░██   ░██  
░██        ░██          ░██████   ░██    ░██ ░██     ░██ ░██         
░██  █████ ░██               ░██  ░██    ░██ ░██     ░██  ░████████  
░██     ██ ░██          ░███████  ░██    ░██ ░██     ░██         ░██ 
 ░██  ░███ ░██         ░██   ░██  ░██   ░██   ░██   ░██   ░██   ░██  
  ░█████░█ ░██████████  ░█████░██ ░███████     ░██████     ░██████

                  [ SHE'S ALWAYS WATCHING ]
```
---

**GLaDOS** is a Bash-based reconnaissance pipeline designed to automate subdomain enumeration and HTTP probing.

The project integrates multiple reconnaissance tools into a single workflow, collecting, aggregating, and filtering results to identify active hosts associated with a target domain.

## Features

- Automated subdomain enumeration.
- Parallel execution of reconnaissance tools.
- Subdomain sorting and removal of duplicates.
- HTTP probing to identify responsive hosts.

## Tools

| Tool | Purpose |
|---|---|
| [Subfinder](https://github.com/projectdiscovery/subfinder) | Passive subdomain enumeration |
| [Assetfinder](https://github.com/tomnomnom/assetfinder) | Subdomain discovery |
| [Amass](https://github.com/owasp-amass/amass) | Attack surface mapping and enumeration |
| [HTTPX](https://github.com/projectdiscovery/httpx) | HTTP probing |
| `sort` | Result aggregation and deduplication |

## Requirements

Make sure the following tools are installed and available in your `$PATH`:

- Subfinder
- Assetfinder
- Amass
- HTTPX

## Installation

Clone the repository:

```bash
git clone https://github.com/ynn1000/GLaDOS.git
cd GLaDOS
```

Make the script executable:

```bash
chmod +x pipeline.sh
```

## Usage

Run the pipeline by providing a target domain:

```bash
./pipeline.sh example.com
```

The pipeline executes the following stages:

1. Subfinder, Assetfinder, and Amass run concurrently to discover subdomains.
2. `sort -u` combines the results and removes duplicates.
3. HTTPX probes the discovered hosts to identify responsive endpoints.

## Output Structure

Results are stored in the `output/example` directory:

```text
output/
├── example/
│   ├── subfinder.txt
│   ├── assetfinder.txt
│   ├── amass.txt
│   ├── all.txt
│   └── alive.txt
└── otherexample/
    ├── subfinder.txt
    ├── assetfinder.txt
    ├── amass.txt
    ├── all.txt
    └── alive.txt
```

| File | Description |
|---|---|
| `subfinder.txt` | Subdomains discovered by Subfinder |
| `assetfinder.txt` | Subdomains discovered by Assetfinder |
| `amass.txt` | Results collected by Amass |
| `all.txt` | Combined and deduplicated results |
| `alive.txt` | Hosts responding to HTTPX probes |

## Disclaimer

GLaDOS is intended for educational purposes and authorized security reconnaissance.

Only use this tool against domains and infrastructure you own or have explicit permission to assess. Always respect bug bounty program scopes, rate limits, and applicable policies.

## License

This project is currently under development.
