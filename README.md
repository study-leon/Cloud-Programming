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
- AWS Account und Secret Keys generieren
- Windows PowerShell
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

# 5. index-HTML hochladen über AWS CLI oder AWS Console
aws s3 cp C:\terraform-projekt\index.html s3://study-leon-terraform-demo/
```

## Kosten
Vollständig im AWS Free Tier => Ressourcen wieder freigegeben

## Secret-Verwaltung
Credentials werden ausschließlich als Umgebungsvariablen 
übergeben – niemals im Code gespeichert.
