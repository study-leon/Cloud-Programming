# Cloud-Programming

## Projektbeschreibung
Statische Website gehostet auf AWS S3 + CloudFront als Teil des 
Moduls Cloud-Programmierung (DLBSEPCP01).

## Architektur
- **Amazon S3** – Statisches Website-Hosting (index.html)
- **Amazon CloudFront** – CDN, HTTPS, globale Edge-Standorte
- **AWS IAM** – Zugriffsverwaltung (Least-Privilege-Prinzip)
- **Terraform** – Infrastructure as Code

## Voraussetzungen
- AWS Account
- AWS CLI installiert
- Terraform installiert

## Deployment (Terraform)
```bash
# 1. Umgebungsvariablen setzen (Windows PowerShell)
$env:AWS_ACCESS_KEY_ID="dein-access-key"
$env:AWS_SECRET_ACCESS_KEY="dein-secret-key"
$env:AWS_DEFAULT_REGION="eu-central-1"

# 2. Terraform initialisieren
terraform init

# 3. Vorschau
terraform plan

# 4. Infrastruktur erstellen
terraform apply

# 5. Infrastruktur wieder abbauen
terraform destroy
```

## Website
- Manuell: https://d345pmifhyafra.cloudfront.net
- Terraform: https://d2htfpbf89yo2y.cloudfront.net

## Kosten
Vollständig im AWS Free Tier – ca. 0,00 EUR

## Secret-Verwaltung
Credentials werden ausschließlich als Umgebungsvariablen 
übergeben – niemals im Code gespeichert.
