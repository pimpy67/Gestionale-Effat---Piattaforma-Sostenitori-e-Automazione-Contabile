# 🔌 API Endpoints - Gestionale Effatà

**Base URL**: `https://api.gestionale-effata.it/api/v1`  
**Authentication**: JWT Bearer Token in `Authorization` header

---

## Auth Module

### POST /auth/register
Registrazione nuovo utente (supporter, operator).

```
POST /api/v1/auth/register
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "SecurePass123!",
  "name": "John Doe",
  "role": "SUPPORTER"  # ADMIN | FIELD_OPERATOR | SUPPORTER
}

RESPONSE 201:
{
  "id": "uuid",
  "email": "user@example.com",
  "name": "John Doe",
  "role": "SUPPORTER",
  "createdAt": "2026-09-23T10:00:00Z"
}

RESPONSE 400: { "error": "Email already exists" }
RESPONSE 422: { "errors": { "password": "Too weak" } }
```

### POST /auth/login
Login e ottieni JWT token.

```
POST /api/v1/auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "SecurePass123!"
}

RESPONSE 200:
{
  "accessToken": "eyJhbGciOiJIUzI1NiIs...",
  "refreshToken": "eyJhbGciOiJIUzI1NiIs...",
  "expiresIn": 900,  # 15 minutes in seconds
  "user": {
    "id": "uuid",
    "email": "user@example.com",
    "name": "John Doe",
    "role": "SUPPORTER"
  }
}

RESPONSE 401: { "error": "Invalid credentials" }
```

### POST /auth/refresh
Refresh JWT token.

```
POST /api/v1/auth/refresh
Content-Type: application/json
Authorization: Bearer <refreshToken>

{
  "refreshToken": "eyJhbGciOiJIUzI1NiIs..."
}

RESPONSE 200:
{
  "accessToken": "eyJhbGciOiJIUzI1NiIs...",
  "expiresIn": 900
}

RESPONSE 401: { "error": "Invalid or expired refresh token" }
```

### POST /auth/logout
Logout (invalidate refresh token, audit log).

```
POST /api/v1/auth/logout
Authorization: Bearer <accessToken>

RESPONSE 200: { "message": "Logged out successfully" }
RESPONSE 401: { "error": "Unauthorized" }
```

### GET /auth/me
Get current user profile.

```
GET /api/v1/auth/me
Authorization: Bearer <accessToken>

RESPONSE 200:
{
  "id": "uuid",
  "email": "user@example.com",
  "name": "John Doe",
  "role": "SUPPORTER",
  "telegamId": null,
  "isActive": true,
  "lastLogin": "2026-09-23T10:00:00Z"
}

RESPONSE 401: { "error": "Unauthorized" }
```

---

## Adoptions Module

### GET /adoptions
List adoptions (filtered by role).

```
GET /api/v1/adoptions?status=ACTIVE&limit=10&offset=0
Authorization: Bearer <accessToken>

RESPONSE 200:
{
  "data": [
    {
      "id": "uuid",
      "codeName": "UG-101",
      "childName": "Emmanuel",
      "birthDate": "2015-03-10",
      "location": "Kampala, Uganda",
      "bio": "Emmanuel loves football...",
      "status": "ACTIVE",
      "createdAt": "2026-01-15T00:00:00Z"
    }
  ],
  "total": 45,
  "limit": 10,
  "offset": 0
}

RESPONSE 401: { "error": "Unauthorized" }
```

### GET /adoptions/:id
Get adoption detail with media and supporters.

```
GET /api/v1/adoptions/uuid
Authorization: Bearer <accessToken>

RESPONSE 200:
{
  "id": "uuid",
  "codeName": "UG-101",
  "childName": "Emmanuel",
  "birthDate": "2015-03-10",
  "location": "Kampala, Uganda",
  "bio": "Emmanuel loves football...",
  "status": "ACTIVE",
  "media": [
    {
      "id": "uuid",
      "fileUrl": "https://s3.amazonaws.com/...",
      "fileType": "PHOTO",
      "caption": "Emmanuel at school",
      "createdAt": "2026-09-20T00:00:00Z"
    }
  ],
  "supporters": [
    {
      "id": "uuid",
      "firstName": "Andrea",
      "lastName": "Pavan",
      "monthlyAmount": 30.00,
      "startDate": "2026-01-15",
      "status": "ACTIVE"
    }
  ]
}

RESPONSE 404: { "error": "Adoption not found" }
RESPONSE 401: { "error": "Unauthorized" }
```

### POST /adoptions
Create new adoption (ADMIN only).

```
POST /api/v1/adoptions
Authorization: Bearer <accessToken>
Content-Type: application/json

{
  "codeName": "UG-102",
  "childName": "Grace",
  "birthDate": "2016-07-22",
  "location": "Kampala, Uganda",
  "bio": "Grace is a shy girl who loves reading..."
}

RESPONSE 201:
{
  "id": "uuid",
  "codeName": "UG-102",
  "childName": "Grace",
  "status": "ACTIVE",
  "createdAt": "2026-09-23T10:00:00Z"
}

RESPONSE 403: { "error": "Forbidden: Admin role required" }
RESPONSE 401: { "error": "Unauthorized" }
```

### GET /adoptions/:id/media
Get media gallery for adoption.

```
GET /api/v1/adoptions/uuid/media?limit=20&offset=0
Authorization: Bearer <accessToken>

RESPONSE 200:
{
  "data": [
    {
      "id": "uuid",
      "fileUrl": "https://s3.amazonaws.com/...",
      "fileType": "PHOTO",
      "fileSize": 2048576,
      "caption": "Emmanuel at school",
      "uploadedBy": "operatorName",
      "createdAt": "2026-09-20T00:00:00Z"
    }
  ],
  "total": 45
}
```

---

## Media Module

### POST /media/upload
Upload file (foto, video, documento).

```
POST /api/v1/media/upload
Authorization: Bearer <accessToken>
Content-Type: multipart/form-data

Form Data:
  - file: <binary file>
  - adoptionId: "uuid"
  - caption: "Optional description"

RESPONSE 201:
{
  "id": "uuid",
  "fileUrl": "https://s3.amazonaws.com/gestionale-effata/media/uuid.jpg",
  "fileType": "PHOTO",
  "fileSize": 2048576,
  "createdAt": "2026-09-23T10:00:00Z"
}

RESPONSE 413: { "error": "File too large (max 50MB)" }
RESPONSE 415: { "error": "Unsupported file type" }
RESPONSE 401: { "error": "Unauthorized" }
```

### GET /media/:id
Download/view media (with authorization check).

```
GET /api/v1/media/uuid
Authorization: Bearer <accessToken>

RESPONSE 200: <binary file content>
  (with Content-Type: image/jpeg, etc.)

RESPONSE 403: { "error": "Forbidden: Not authorized to view this media" }
RESPONSE 404: { "error": "Media not found" }
```

### DELETE /media/:id
Delete media (owner or admin only).

```
DELETE /api/v1/media/uuid
Authorization: Bearer <accessToken>

RESPONSE 204: (No content)

RESPONSE 403: { "error": "Forbidden: Only owner or admin can delete" }
RESPONSE 404: { "error": "Media not found" }
```

---

## Accounting Module

### GET /accounting/donations
List donations (paginated, filterable).

```
GET /api/v1/accounting/donations?status=PENDING&supporterId=uuid&limit=20
Authorization: Bearer <accessToken>

RESPONSE 200:
{
  "data": [
    {
      "id": "uuid",
      "supporterId": "uuid",
      "supporterName": "Andrea Pavan",
      "amount": 30.00,
      "donationDate": "2026-09-15",
      "status": "PENDING",
      "rawCausale": "Adozione Emmanuel",
      "notes": null,
      "createdAt": "2026-09-15T14:30:00Z"
    }
  ],
  "total": 120
}

RESPONSE 401: { "error": "Unauthorized" }
```

### PUT /accounting/donations/:id/verify
Verify donation (ADMIN only).

```
PUT /api/v1/accounting/donations/uuid/verify
Authorization: Bearer <accessToken>
Content-Type: application/json

{
  "status": "VERIFIED",  # VERIFIED | ANOMALY
  "notes": "Optional note about verification"
}

RESPONSE 200:
{
  "id": "uuid",
  "status": "VERIFIED",
  "verifiedBy": "adminId",
  "verifiedAt": "2026-09-23T10:00:00Z"
}

RESPONSE 403: { "error": "Forbidden: Admin role required" }
RESPONSE 404: { "error": "Donation not found" }
```

### POST /accounting/parse-statement
Upload bank statement and parse with AI Vision.

```
POST /api/v1/accounting/parse-statement
Authorization: Bearer <accessToken>
Content-Type: multipart/form-data

Form Data:
  - file: <PDF or image of bank statement>
  - iban: "IT60X0542811101000000123456" (optional)

RESPONSE 201:
{
  "bankStatementId": "uuid",
  "parsedData": [
    {
      "date": "2026-09-15",
      "amount": 30.00,
      "description": "Adozione Emmanuel - Andrea Pavan",
      "taxCodeExtracted": "PVNARD75E23L009T"
    },
    {
      "date": "2026-09-14",
      "amount": 50.00,
      "description": "Donazione generica"
    }
  ],
  "status": "PARSED",
  "confidenceScore": 0.94,
  "createdAt": "2026-09-23T10:00:00Z"
}

RESPONSE 400: { "error": "Invalid file format. Use PDF or image." }
RESPONSE 500: { "error": "AI Vision processing failed" }
```

### GET /accounting/bank-statements/:id
Get bank statement detail with parsed data.

```
GET /api/v1/accounting/bank-statements/uuid
Authorization: Bearer <accessToken>

RESPONSE 200:
{
  "id": "uuid",
  "iban": "IT60X0542811101000000123456",
  "statementDate": "2026-09-30",
  "fileUrl": "https://s3.amazonaws.com/.../statement.pdf",
  "parsedData": [...],
  "status": "PARSED",
  "processedBy": "adminId",
  "createdAt": "2026-09-23T10:00:00Z"
}
```

### POST /accounting/reconcile
Match bank transactions with donations.

```
POST /api/v1/accounting/reconcile
Authorization: Bearer <accessToken>
Content-Type: application/json

{
  "bankStatementId": "uuid",
  "matchings": [
    {
      "parsedLineIndex": 0,
      "donationId": "uuid",
      "confidenceScore": 0.95,
      "notes": "Perfect match on CF"
    }
  ]
}

RESPONSE 200:
{
  "bankStatementId": "uuid",
  "status": "RECONCILED",
  "matchedCount": 5,
  "unmatchedCount": 2,
  "reconciliationNotes": "2 transazioni non matchate (verificare manualmente)"
}
```

### POST /accounting/export-verifico
Export donations as CSV for Verifico.it.

```
POST /api/v1/accounting/export-verifico
Authorization: Bearer <accessToken>
Content-Type: application/json

{
  "startDate": "2026-09-01",
  "endDate": "2026-09-30",
  "includeUnverified": false
}

RESPONSE 200:
Content-Type: text/csv
Content-Disposition: attachment; filename="verifico_2026-09.csv"

Data,Categoria,Causale,Importo,CodiceFiscale
2026-09-15,Donazioni,Adozione Emmanuel,30.00,PVNARD75E23L009T
2026-09-14,Donazioni,Donazione generica,50.00,RSSLFX80M12H501Q
...

RESPONSE 400: { "error": "No verified donations in date range" }
```

---

## Reports Module (ADMIN only)

### GET /reports/dashboard
Dashboard KPIs.

```
GET /api/v1/reports/dashboard
Authorization: Bearer <accessToken>

RESPONSE 200:
{
  "totalAdoptions": 45,
  "activeAdoptions": 43,
  "totalDonations": 12500.00,
  "monthlyDonations": 2350.00,
  "pendingVerification": 3,
  "totalSupporters": 120,
  "activeSupporters": 115
}
```

### GET /reports/transactions
Export all transactions as CSV.

```
GET /api/v1/reports/transactions?startDate=2026-09-01&endDate=2026-09-30
Authorization: Bearer <accessToken>

RESPONSE 200:
Content-Type: text/csv

(CSV format with all columns)
```

---

## Telegram Bot Webhook

### POST /telegram/webhook
Receive Telegram bot updates (messages, photos, callbacks).

```
POST /api/v1/telegram/webhook
X-Telegram-Bot-Api-Secret-Token: <secret>
Content-Type: application/json

{
  "update_id": 123456789,
  "message": {
    "message_id": 1,
    "from": { "id": 123456789, "username": "john_doe" },
    "chat": { "id": 123456789 },
    "photo": [{ "file_id": "...", "file_size": 2048576 }],
    "caption": "UG-101"  # Child code
  }
}

RESPONSE 200: { "ok": true }

Backend processing:
1. Authenticate telegram_id against users table
2. Extract adoption code from caption
3. Download photo from Telegram
4. Upload to S3
5. Create Media record in DB
6. Send callback message on Telegram
```

---

## Error Responses

Tutti gli endpoint ritornano errori in questo formato:

```json
{
  "error": "Brief error message",
  "code": "ERROR_CODE",
  "details": {
    "field": "error details"
  },
  "timestamp": "2026-09-23T10:00:00Z"
}
```

### HTTP Status Codes
- `200 OK` - Successful GET/PUT/PATCH
- `201 Created` - Successful POST
- `204 No Content` - Successful DELETE
- `400 Bad Request` - Invalid input
- `401 Unauthorized` - Missing/invalid auth token
- `403 Forbidden` - Authenticated but not authorized
- `404 Not Found` - Resource not found
- `422 Unprocessable Entity` - Validation error
- `429 Too Many Requests` - Rate limited
- `500 Internal Server Error` - Server error
- `503 Service Unavailable` - Maintenance

