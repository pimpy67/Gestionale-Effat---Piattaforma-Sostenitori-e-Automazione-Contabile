# 🚀 Deployment & Infrastructure - Gestionale Effatà

---

## Pre-Deployment Checklist

### Code Quality
- [ ] Unit tests pass: `npm run test` (>80% coverage)
- [ ] Integration tests pass
- [ ] E2E tests pass: `npx cypress run`
- [ ] Lint: `npm run lint` (0 errors)
- [ ] Build successful: `npm run build`

### Security
- [ ] OWASP Top 10 audit done
- [ ] SQL injection tests passing
- [ ] XSS protection verify
- [ ] CSRF protection active
- [ ] Secrets scanning passed (no API keys in code)
- [ ] GDPR audit passed

### Performance
- [ ] Page load <2s (dashboard)
- [ ] API response <500ms (p99)
- [ ] Database queries optimized (EXPLAIN plan review)
- [ ] Image compression verified (WebP, <100KB)
- [ ] PWA lighthouse score >90

### Infrastructure
- [ ] Docker images build cleanly
- [ ] docker-compose up works locally
- [ ] Database migrations run without error
- [ ] All environment variables documented

### Documentation
- [ ] API documentation (Swagger)
- [ ] Deployment runbook complete
- [ ] Admin user manual written
- [ ] Incident response plan created

---

## Local Development Setup

### Prerequisites
```bash
# Required:
Node.js 20+
Docker + Docker Compose
PostgreSQL 15+ (via Docker)
Git

# Recommended:
VS Code + extensions (ESLint, Prettier)
Postman or Insomnia (API testing)
DBeaver (Database inspection)
```

### Initial Setup

```bash
# Clone repo
git clone https://github.com/pimpy67/Gestionale-Effat...
cd gestionale-effata

# Copy environment
cp .env.example .env

# Start Docker services
docker-compose up -d

# Wait for PostgreSQL to be ready (30 seconds)
sleep 30

# Install dependencies
cd backend && npm install
cd ../frontend && npm install

# Run migrations
cd ../backend
npm run migrate

# Start dev servers
npm run dev          # Terminal 1: Backend on :3000
# In another terminal:
cd frontend
ng serve             # Terminal 2: Frontend on :4200
```

### Verify Installation

```bash
# Backend health
curl http://localhost:3000/api/v1/health

# Frontend
open http://localhost:4200

# Database
psql -U postgres -d gestionale_effata -c "SELECT COUNT(*) FROM users;"
```

---

## Staging Deployment (CI/CD)

### GitHub Actions Workflow

File: `.github/workflows/ci-cd.yml`

```yaml
name: CI/CD Pipeline

on:
  push:
    branches: [develop, main]
  pull_request:
    branches: [develop]

jobs:
  lint-and-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '20'
      
      - name: Install dependencies
        run: |
          cd backend && npm install
          cd ../frontend && npm install
      
      - name: Lint
        run: cd backend && npm run lint
      
      - name: Unit tests
        run: cd backend && npm run test
      
      - name: Build
        run: |
          cd backend && npm run build
          cd ../frontend && ng build --prod

  build-docker:
    needs: lint-and-test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2
      
      - name: Login to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}
      
      - name: Build and push backend
        uses: docker/build-push-action@v4
        with:
          context: ./backend
          push: true
          tags: ${{ secrets.DOCKER_USERNAME }}/gestionale-effata-backend:${{ github.sha }}
      
      - name: Build and push frontend
        uses: docker/build-push-action@v4
        with:
          context: ./frontend
          push: true
          tags: ${{ secrets.DOCKER_USERNAME }}/gestionale-effata-frontend:${{ github.sha }}

  deploy-staging:
    needs: build-docker
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/develop'
    steps:
      - name: Deploy to staging
        run: |
          # SSH to staging server
          ssh -i ${{ secrets.STAGING_SSH_KEY }} ${{ secrets.STAGING_USER }}@${{ secrets.STAGING_HOST }} << 'EOF'
          
          cd /app/gestionale-effata
          docker-compose -f docker-compose.staging.yml pull
          docker-compose -f docker-compose.staging.yml up -d
          
          # Run migrations
          docker-compose -f docker-compose.staging.yml exec -T backend npm run migrate
          
          # Health check
          sleep 5
          curl http://localhost:3000/api/v1/health
          
          EOF
      
      - name: Smoke tests
        run: npm run test:e2e:staging

  deploy-production:
    needs: build-docker
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    environment: production
    steps:
      - name: Manual approval
        run: echo "Waiting for approval..."
      
      - name: Deploy to production
        run: |
          ssh -i ${{ secrets.PROD_SSH_KEY }} ${{ secrets.PROD_USER }}@${{ secrets.PROD_HOST }} << 'EOF'
          
          cd /app/gestionale-effata
          
          # Backup database
          docker-compose -f docker-compose.prod.yml exec -T postgres \
            pg_dump gestionale_effata > backup-$(date +%Y%m%d_%H%M%S).sql
          
          # Deploy
          docker-compose -f docker-compose.prod.yml pull
          docker-compose -f docker-compose.prod.yml up -d
          
          # Migrate
          docker-compose -f docker-compose.prod.yml exec -T backend npm run migrate
          
          # Health check
          curl https://api.gestionale-effata.it/api/v1/health
          
          EOF
```

---

## Production Deployment

### Server Setup (Linux VPS)

```bash
# SSH into VPS
ssh root@your-server.com

# Update system
apt update && apt upgrade -y
apt install -y docker.io docker-compose nginx certbot python3-certbot-nginx

# Create app directory
mkdir -p /app/gestionale-effata
cd /app/gestionale-effata

# Clone repo (or pull)
git clone https://github.com/pimpy67/Gestionale-Effat...
cd gestionale-effata

# Copy production env
cp .env.prod.example .env
# Edit .env with production secrets
nano .env
```

### Docker Compose Production Setup

File: `docker-compose.prod.yml`

```yaml
version: '3.9'

services:
  postgres:
    image: postgres:15
    container_name: gestionale_effata_postgres
    environment:
      POSTGRES_DB: gestionale_effata
      POSTGRES_USER: ${DB_USER}
      POSTGRES_PASSWORD: ${DB_PASSWORD}
    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ./database/backups:/backups
    restart: unless-stopped
    networks:
      - backend

  backend:
    image: ${DOCKER_REGISTRY}/gestionale-effata-backend:${VERSION}
    container_name: gestionale_effata_backend
    environment:
      NODE_ENV: production
      DATABASE_URL: postgres://${DB_USER}:${DB_PASSWORD}@postgres:5432/gestionale_effata
      JWT_SECRET: ${JWT_SECRET}
      OPENAI_API_KEY: ${OPENAI_API_KEY}
      AWS_ACCESS_KEY_ID: ${AWS_ACCESS_KEY_ID}
      AWS_SECRET_ACCESS_KEY: ${AWS_SECRET_ACCESS_KEY}
      TELEGRAM_BOT_TOKEN: ${TELEGRAM_BOT_TOKEN}
    depends_on:
      - postgres
    restart: unless-stopped
    networks:
      - backend
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:3000/api/v1/health"]
      interval: 30s
      timeout: 10s
      retries: 3

  frontend:
    image: ${DOCKER_REGISTRY}/gestionale-effata-frontend:${VERSION}
    container_name: gestionale_effata_frontend
    restart: unless-stopped
    networks:
      - frontend

  nginx:
    image: nginx:alpine
    container_name: gestionale_effata_nginx
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx/nginx.conf:/etc/nginx/nginx.conf:ro
      - ./nginx/conf.d:/etc/nginx/conf.d:ro
      - /etc/letsencrypt:/etc/letsencrypt:ro
      - ./frontend/dist:/usr/share/nginx/html:ro
    depends_on:
      - backend
      - frontend
    restart: unless-stopped
    networks:
      - frontend
      - backend

  prometheus:
    image: prom/prometheus
    container_name: gestionale_effata_prometheus
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml:ro
      - prometheus_data:/prometheus
    command:
      - '--config.file=/etc/prometheus/prometheus.yml'
      - '--storage.tsdb.path=/prometheus'
    restart: unless-stopped
    networks:
      - backend

volumes:
  postgres_data:
  prometheus_data:

networks:
  backend:
  frontend:
```

### Nginx Configuration

File: `nginx/conf.d/gestionale-effata.conf`

```nginx
upstream backend {
    server backend:3000;
}

server {
    listen 80;
    server_name api.gestionale-effata.it;
    
    # Redirect to HTTPS
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name api.gestionale-effata.it;
    
    ssl_certificate /etc/letsencrypt/live/api.gestionale-effata.it/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/api.gestionale-effata.it/privkey.pem;
    
    # Security headers
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-Frame-Options "DENY" always;
    add_header X-XSS-Protection "1; mode=block" always;
    
    # Compression
    gzip on;
    gzip_types application/json text/css application/javascript;
    
    # Rate limiting
    limit_req_zone $binary_remote_addr zone=api:10m rate=100r/m;
    limit_req zone=api burst=10 nodelay;
    
    # Proxy to backend
    location /api/ {
        proxy_pass http://backend;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_connect_timeout 60s;
        proxy_send_timeout 60s;
        proxy_read_timeout 60s;
    }
}

server {
    listen 443 ssl http2;
    server_name gestionale-effata.it www.gestionale-effata.it;
    
    ssl_certificate /etc/letsencrypt/live/gestionale-effata.it/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/gestionale-effata.it/privkey.pem;
    
    root /usr/share/nginx/html;
    index index.html;
    
    location / {
        try_files $uri $uri/ /index.html;
    }
}
```

### SSL Certificate Setup

```bash
# Generate certificate
certbot certonly --standalone -d api.gestionale-effata.it -d gestionale-effata.it

# Auto-renew (cron job)
0 12 * * * certbot renew --quiet

# Verify
curl https://api.gestionale-effata.it/api/v1/health
```

---

## Monitoring & Alerting

### Prometheus Metrics

File: `prometheus.yml`

```yaml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: 'backend'
    static_configs:
      - targets: ['backend:3000']
    metrics_path: '/metrics'
```

### Key Metrics to Monitor

```
- HTTP request latency (p50, p95, p99)
- Error rate (5xx errors)
- Database query latency
- Database connection pool usage
- OCR processing time
- Media upload success rate
- JWT token refresh rate
- Telegram bot message rate
```

### Alerting Rules

```yaml
groups:
  - name: gestionale-effata
    rules:
      - alert: HighErrorRate
        expr: rate(http_requests_total{status=~"5.."}[5m]) > 0.05
        for: 5m
        annotations:
          summary: "High error rate detected"
      
      - alert: HighLatency
        expr: histogram_quantile(0.99, http_request_duration_seconds) > 1
        for: 10m
        annotations:
          summary: "API latency too high"
      
      - alert: DatabaseDown
        expr: up{job="postgres"} == 0
        for: 1m
        annotations:
          summary: "Database is down"
```

---

## Backup & Disaster Recovery

### Automated Backups

```bash
# Daily backup script
#!/bin/bash
# backup.sh
BACKUP_DIR="/app/gestionale-effata/database/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.sql"

docker-compose exec -T postgres pg_dump gestionale_effata > "$BACKUP_FILE"
gzip "$BACKUP_FILE"

# Upload to S3
aws s3 cp "$BACKUP_FILE.gz" s3://gestionale-effata-backups/

# Delete old backups (keep 30 days)
find "$BACKUP_DIR" -name "backup_*.sql.gz" -mtime +30 -delete

echo "Backup completed: $BACKUP_FILE.gz"
```

### Restore Procedure

```bash
# If database corrupted
docker-compose down

# Restore from backup
BACKUP_FILE="backup_20260923_100000.sql.gz"
gunzip "$BACKUP_FILE"
psql gestionale_effata < "${BACKUP_FILE%.gz}"

docker-compose up -d
```

---

## Post-Deployment

### Health Checks

```bash
# API health
curl https://api.gestionale-effata.it/api/v1/health

# Database connectivity
docker-compose exec postgres psql -U $DB_USER -d gestionale_effata -c "SELECT 1;"

# Frontend accessibility
curl https://gestionale-effata.it/ | grep "<title>"
```

### Smoke Tests

```bash
npm run test:e2e:production
```

---

## Incident Response

### Database Down
1. Check container: `docker-compose logs postgres`
2. Restart: `docker-compose restart postgres`
3. Verify: `curl http://localhost:3000/api/v1/health`
4. If still down, restore from backup

### Memory Leak
1. Check memory: `docker stats`
2. Restart container: `docker-compose restart backend`
3. Investigate logs

### High Latency
1. Check database queries: `EXPLAIN ANALYZE`
2. Check network: `ping api.gestionale-effata.it`
3. Scale backend if needed

---

## Rollback Procedure

```bash
# If deployment breaks production
cd /app/gestionale-effata

# Get previous image tag
PREVIOUS_TAG=$(docker inspect gestionale_effata_backend | grep Image | tail -1)

# Rollback
docker-compose down
docker-compose -f docker-compose.prod.yml pull
docker run -d --name gestionale_effata_backend $PREVIOUS_TAG

# Verify
curl https://api.gestionale-effata.it/api/v1/health
```

