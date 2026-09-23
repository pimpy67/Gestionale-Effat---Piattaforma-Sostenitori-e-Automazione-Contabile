# ⚠️ Rischi & Mitigazioni - Gestionale Effatà

---

## 🔴 Rischi Critici (Bloccan o il Progetto)

### 1. OCR Accuracy < 95%

**Problema**: Il parsing di estratti conto tramite AI Vision fornisce risultati inesatti.

**Impatto**: 
- Riconciliazione contabile fallita
- Dati corrotti nel database
- Lavoro manuale massivo per fix

**Probabilità**: Media (⭐⭐)  
**Impatto**: Alta (⭐⭐⭐)

**Mitigazioni**:
- ✅ **Prompt Engineering**: Creare prompts specifici per diversi formati di estratti
  ```
  "Estrai dal documento: Data, Importo, Ordinante, Causale, IBAN.
   Restituisci JSON strutturato. Se mancano campi, usa null."
  ```
- ✅ **Confidence Score**: Se confidence < 0.85, flag per manual review
  ```javascript
  if (confidenceScore < 0.85) {
    donation.status = 'NEEDS_MANUAL_REVIEW';
    notifyAdmin();
  }
  ```
- ✅ **Fallback**: Implementare manual entry UI per operatore
- ✅ **Testing**: PoC week 1 con 10 estratti conti reali
  - Test su diversi formati bancari (Intesa, UniCredit, BCC, etc)
  - Misurare accuracy e latenza

**Owner**: Backend Lead  
**Timeline**: Week 3-4 (validazione), Week 7-8 (fallback UI)

---

### 2. Media Upload Scalabilità (Uganda Connessione Lenta)

**Problema**: Operatori in Uganda uploadano foto via Telegram con connessione instabile (<2 Mbps).

**Impatto**:
- Timeout upload
- File parziali in S3
- UX pessima

**Probabilità**: Alta (⭐⭐⭐)  
**Impatto**: Alta (⭐⭐⭐)

**Mitigazioni**:
- ✅ **Client-side Compression**: Comprimere immagine prima di inviare a Telegram
  ```javascript
  // Sharp per resizing
  const compressed = await sharp(image)
    .resize(1280, 720, { withoutEnlargement: true })
    .jpeg({ quality: 80 })
    .toBuffer();
  ```
- ✅ **S3 Multipart Upload**: Upload in chunks (5MB per chunk)
  ```javascript
  const uploadParams = {
    Bucket: 'gestionale-effata',
    Key: `media/${uuid}`,
    Body: fileStream,
    ContentType: 'image/jpeg'
  };
  ```
- ✅ **Offline Queue**: Se upload fallisce, salvare localmente e retry quando online
  - Telegram bot mantiene queue SQLite locale
  - Exponential backoff retry (1s, 2s, 4s, 8s, 30s)
- ✅ **CDN Caching**: CloudFront per distribuzione globale

**Load Testing**: Week 2
- Simulare 100 upload simultanei
- Misurare timeout rate, latenza media

**Owner**: Backend Lead + DevOps  
**Timeline**: Week 2-3 (implementation)

---

### 3. GDPR Compliance - Diritto all'Oblio

**Problema**: Supporter chiede cancellazione completa dati. Devo garantire compliance legale.

**Impatto**:
- Violazione legale (fini fino a €20M)
- Reputazione compromessa
- Azioni legali da parte degli interessati

**Probabilità**: Bassa (⭐)  
**Impatto**: Critica (⭐⭐⭐⭐⭐)

**Mitigazioni**:
- ✅ **Soft Delete**: Non eliminare fisicamente da DB, markare come deleted
  ```sql
  ALTER TABLE supporters ADD COLUMN deleted_at TIMESTAMP;
  -- Instead of DELETE, set deleted_at = NOW()
  ```
- ✅ **Anonymization**: Per adoption history, sostituire dati sensibili
  ```javascript
  if (deleted_at) {
    supporter.firstName = '[deleted]';
    supporter.taxCode = null;
    supporter.iban = null;
  }
  ```
- ✅ **Audit Logs**: Conservare log di tutte le azioni (per compliance)
  - Retention policy: 7 anni (per norme contabili)
  - Separate storage, encrypted
- ✅ **Data Export**: Supportare GDPR "right to data portability"
  - Endpoint `/auth/me/export` che genera JSON di tutti i miei dati
- ✅ **Privacy Policy**: Documentare chiaramente
  - What data we collect
  - How long we retain it
  - How to request deletion

**Legal Review**: Week 1
- Consultare avvocato specializzato GDPR
- Validare implementazione week 7

**Owner**: Legal + Backend Lead  
**Timeline**: Week 1 (planning), Week 7-8 (implementation + review)

---

### 4. Database Concurrency & Race Conditions

**Problema**: Due admin aggiornano simultaneamente lo stesso estratto conto per riconciliazione.

**Impatto**:
- Data corruption
- Donazioni duplicate/perse
- Inconsistenza contabile

**Probabilità**: Media (⭐⭐)  
**Impatto**: Alta (⭐⭐⭐)

**Mitigazioni**:
- ✅ **Optimistic Locking**: Aggiungere `version` field a tabelle critiche
  ```sql
  ALTER TABLE bank_statements ADD COLUMN version INT DEFAULT 1;
  
  UPDATE bank_statements 
  SET status = 'RECONCILED', version = version + 1
  WHERE id = $1 AND version = $2
  RETURNING version;
  
  -- Se return 0 righe = update conflitto, retry con ultima version
  ```
- ✅ **Database Transactions**: Sequelize transazioni SERIALIZABLE per operazioni critiche
  ```javascript
  const t = await sequelize.transaction({
    isolationLevel: Transaction.ISOLATION_LEVELS.SERIALIZABLE
  });
  
  try {
    await Donation.update({ status: 'VERIFIED' }, { 
      where: { id }, 
      transaction: t 
    });
    await t.commit();
  } catch (e) {
    await t.rollback();
    throw new ConflictError('Concurrent update detected');
  }
  ```
- ✅ **Pessimistic Locking**: Per operazioni molto critiche, lock la riga
  ```javascript
  const donation = await Donation.findByPk(id, {
    lock: true,  // SELECT ... FOR UPDATE
    transaction: t
  });
  ```

**Testing**: Week 5
- Test con 10 admin che updated simultaneamente
- Verificare no race condition

**Owner**: Backend Lead  
**Timeline**: Week 3-4 (implementation), Week 5 (testing)

---

### 5. JWT Token Lifecycle & Session Management

**Problema**: Token JWT scaduto sul mobile PWA causa logout improvviso. Refresh token non gestito correttamente.

**Impatto**:
- Bad UX: user perde form data
- Session timeout mentre compila form
- Confusion operatori

**Probabilità**: Alta (⭐⭐⭐)  
**Impatto**: Media (⭐⭐)

**Mitigazioni**:
- ✅ **Sliding Window**: Refresh token quando < 5 min dalla scadenza
  ```javascript
  // In HTTP interceptor (frontend)
  if (timeUntilExpiry < 5 * 60) {
    await refreshToken();
  }
  ```
- ✅ **Access Token**: Short-lived (15 min), Refresh Token: long-lived (7 days)
- ✅ **Retry Logic**: Se 401, auto-refresh e retry la richiesta originale
  ```javascript
  // HTTP interceptor
  if (status === 401) {
    const newToken = await authService.refresh();
    request.headers['Authorization'] = `Bearer ${newToken}`;
    return http.request(request);
  }
  ```
- ✅ **Blacklist Refresh Tokens**: Quando logout, aggiungere token a blacklist
  ```javascript
  // Redis blacklist
  redis.setex(`blacklist:${tokenId}`, 7 * 24 * 3600, true);
  ```

**Testing**: Week 1-2
- Test token expiry scenario
- Test simultaneous requests con token scaduto

**Owner**: Frontend Lead + Backend Lead  
**Timeline**: Week 1 (backend JWT setup), Week 5 (frontend interceptor)

---

## 🟡 Rischi Importanti (Degradazione UX)

### 6. Offline Support - Telegram Bot

**Problema**: Bot queue perde messaggi se service va down.

**Impatto**: Media
**Mitigazione**: SQLite local queue + sync on reconnect

### 7. CF/IBAN Validation Robustness

**Problema**: False positives nella validazione (CF/IBAN errati passano il check).

**Impatto**: Media
**Mitigazione**: Regex + checksum validation + manual review per edge cases

### 8. Timezone Handling

**Problema**: Operatori in Uganda, sostenitori in Italia, dates confuse.

**Impatto**: Media
**Mitigazione**: Store UTC in DB, display con timezone user preference

---

## Risk Matrix

```
                HIGH IMPACT
                     ↑
                     │
        GDPR    ╱────┼────╲    OCR
        (Low)  ╱     │     ╲  (Med)
              ╱      │      ╲
         ───┼─────┬──┼──┬─────┼───
            │     │  │  │     │
         ╱──┼─────┴──┼──┴─────┼──╲
        ╱   │        │        │   ╲
    Media  │    Database │  JWT   │
  (High)   │   (Med)     │ (Med)  │
           │            │        │
                     LOW IMPACT
```

---

## Monitoring & Early Warning

### Metrics to Track

```
1. OCR Metrics
   - Confidence score distribution
   - Manual review rate
   - Correction rate (corretti vs parsed)

2. Upload Metrics
   - File upload success rate
   - Average upload time by region
   - Timeout rate
   - Retry rate

3. Concurrency Metrics
   - Lock wait times
   - Transaction conflicts
   - Deadlock rate

4. Auth Metrics
   - Token refresh rate
   - Invalid token errors
   - Login failure rate
   - Session duration
```

### Alerting (Prometheus)

```yaml
- alert: OCRConfidenceLow
  expr: avg(ocr_confidence_score) < 0.85
  for: 1h
  annotations:
    summary: "OCR confidence below threshold"

- alert: UploadTimeoutHigh
  expr: upload_timeout_rate > 0.05
  for: 30m
  annotations:
    summary: "Upload timeout rate > 5%"

- alert: DatabaseLockWait
  expr: db_lock_wait_ms > 5000
  for: 5m
  annotations:
    summary: "Database lock wait time too high"
```

---

## Risk Review Cadence

- **Weekly**: Dev team review metrics
- **Bi-weekly**: Risk assessment meeting
- **Post-Launch**: Daily monitoring week 1, then weekly

