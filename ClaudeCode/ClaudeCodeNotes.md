---
share_link: https://share.note.sx/z9q0er25#xzyzzlqJaWDzkYJwx6RUW5nwBq2EYESHJJzg8+1gXZg
share_updated: 2026-04-29T18:46:53+05:30
---
Use ! to run bash commands

---
# Slash Commands
![[Pasted image 20260428113444.png]]

![[Pasted image 20260428113727.png]]

To resume session
claude -r

Build it slash command
/resume

![[Pasted image 20260428114410.png]]
/rename nameofSession

## To ask any other question when claude is working on something else you should use /btw, then press space to get back to mention question
- /btw

## To save our conversation with claud in our repo use /export
- /export filename

- /logout
- /login
---
![[Pasted image 20260428115651.png]]

![[Pasted image 20260428115842.png]]

- /model : this is used to switch between models
- /usage : to check model usage
- /extra-usage
- /stats
- /insights
- /config
- /permissions
- /theme
- /voice


----

![[Pasted image 20260428122800.png]]

Add two links to the footer in @templates/base.html:

- "Terms and Conditions"
- "Privacy Policy"

Both should be plain text links, no special styling needed for now.
Point both to "#" as placeholder hrefs since the pages don't exist yet.

Do not modify anything else on the page.

git commit -m "landing: add terms and privacy links to footer”

Create a "Terms and Conditions" page for Sarathi Wallet.

1. Add a new route in [@app.py](http://app.py/):
GET /terms → renders templates/terms.html
2. Create templates/terms.html with generic terms and conditions
content appropriate for a personal expense tracking app.
Include sections like: Acceptance of Terms, Use of Service,
User Data, Limitations of Liability, and Changes to Terms.
Extend base.html if it exists, otherwise match the style of
landing.html.
3. In @templates/landing.html, update the "Terms and Conditions"
footer link href from "#" to "/terms".
4. Make sure the appearance looks like the website's theme

git commit -m "landing: add terms and conditions page and route”

Do the same as you did for the Terms and Conditions page,
but for Privacy Policy.

1. Add a new route in [@app.py](http://app.py/):
GET /privacy → renders templates/privacy.html
2. Create templates/privacy.html with generic privacy policy
content appropriate for a personal expense tracking app.
Include sections like: Data We Collect, How We Use Your Data,
Data Storage, Third Party Services, and Contact Us.
Match the style of terms.html.
3. In @templates/landing.html, update the "Privacy Policy"
footer link href from "#" to "/privacy".
4. Make sure the appearance looks like the website's theme

git commit -m "landing: add privacy policy page and route”

![[Pasted image 20260428124123.png]]
![[Pasted image 20260428124243.png]]

I've attached a screenshot of the updated Sarathi Wallet hero section design.

Modify only the hero section in @templates/landing.html and @static/css/landing.css
to match this image exactly. Do not touch any other part of the page.

git commit -m "landing: redesign hero section to match mockup"

Add a modal to @templates/landing.html that opens when the user clicks
"See how it works".

Requirements:
from below element replace "Sign in" with "See how it works"
```
<div class="hero-actions">
            <a href="http://127.0.0.1:5001/register" class="btn-primary">Start tracking free</a>
            <a href="http://127.0.0.1:5001/login" class="btn-ghost">Sign in</a>
        </div>
```

- Clicking "See how it works" opens a modal overlay
- Modal contains an embedded YouTube video (use any placeholder YouTube URL
for now, I will replace it later)
- Video should be playable inside the modal
- Clicking the close button OR clicking outside the modal closes it
- When the modal closes, the video must stop playing (not continue in background)
- No page libraries or dependencies — vanilla JS only, since we are not
using any JS framework in this project

Do not modify any other part of the page.

git commit -m "landing: add youtube modal on see how it works click"


---
---

# Context Window

![[Pasted image 20260428161249.png]]
![[Pasted image 20260428161800.png]]

![[Pasted image 20260428162038.png]]

![[Pasted image 20260428162506.png]]

![[Pasted image 20260428162556.png]]

![[Pasted image 20260428163118.png]]

![[Pasted image 20260428163314.png]]

- /compact : use ctrl +o to see actul compact summary
![[Pasted image 20260428164056.png]]
![[Pasted image 20260428164253.png]]

----
---
# CLAUDE.md
![[Pasted image 20260428165902.png]]

![[Pasted image 20260428170023.png]]

![[Pasted image 20260428170042.png]]

![[Pasted image 20260428170232.png]]

![[Pasted image 20260428170248.png]]

![[Pasted image 20260428170534.png]]

![[Pasted image 20260428170620.png]]

![[Pasted image 20260428170747.png]]

![[Pasted image 20260428170820.png]]

![[Pasted image 20260428170841.png]]

![[Pasted image 20260428170900.png]]

![[Pasted image 20260428170916.png]]

![[Pasted image 20260428170942.png]]

![[Pasted image 20260428171511.png]]

![[Pasted image 20260428171601.png]]

![[Pasted image 20260428171701.png]]

![[Pasted image 20260428172551.png]]

![[Pasted image 20260428172628.png]]

![[Pasted image 20260428172651.png]]

![[Pasted image 20260428172716.png]]

![[Pasted image 20260428172942.png]]

![[Pasted image 20260428173034.png]]

![[Pasted image 20260428173204.png]]

![[Pasted image 20260428173744.png]]

![[Pasted image 20260428173934.png]]

![[Pasted image 20260428174125.png]]

On our wish we can add points to remember in memory by asking claude to do so

----
---

# Spec Driven Development

![[Pasted image 20260428174817.png]]

![[Pasted image 20260428174926.png]]

![[Pasted image 20260428175530.png]]

![[Pasted image 20260428175656.png]]

![[Pasted image 20260428180112.png]]

![[Pasted image 20260428180746.png]]

![[Pasted image 20260428192321.png]]


---
---

# Plan Mode

- double shift button or /plan
- /config : to enable thinking mode
- /effort : control over tokens
![[Pasted image 20260428193458.png]]
# spec file
## 1. Overview

Replace the stub in `database/db.py` with a working SQLite implementation.

This step establishes the **data layer foundation** for the Spendly application.

All future features (authentication, profile, expense tracking) depend on this being correctly implemented.

---

## 2. Depends on

Nothing — this is the first step.

---

## 3. Routes

- No new routes
- Existing placeholder routes in `app.py` remain unchanged

---

## 4. Database Schema

---

### A. users

|Column|Type|Constraints|
|---|---|---|
|id|INTEGER|Primary key, autoincrement|
|name|TEXT|Not null|
|email|TEXT|Unique, not null|
|password_hash|TEXT|Not null|
|created_at|TEXT|Default datetime('now')|

---

### B. expenses

|Column|Type|Constraints|
|---|---|---|
|id|INTEGER|Primary key, autoincrement|
|user_id|INTEGER|Foreign key → [users.id](http://users.id), not null|
|amount|REAL|Not null|
|category|TEXT|Not null|
|date|TEXT|Not null (YYYY-MM-DD format)|
|description|TEXT|Nullable|
|created_at|TEXT|Default datetime('now')|

---

## 5. Functions to Implement (`database/db.py`)

---

### A. `get_db()`

- Opens connection to `spendly.db` (or `expense_tracker.db`) in project root
- Sets:
    - `row_factory = sqlite3.Row`
    - `PRAGMA foreign_keys = ON`
- Returns the connection

---

### B. `init_db()`

- Creates both tables using `CREATE TABLE IF NOT EXISTS`
- Safe to call multiple times
- Ensures schema is ready before app usage

---

### C. `seed_db()`

- Checks if `users` table already contains data
    - If yes → return early (no duplication)
- Inserts one demo user:
    - name: Demo User
    - email: [demo@spendly.com](mailto:demo@spendly.com)
    - password: demo123 (hashed using `werkzeug`)
- Inserts **8 sample expenses**:
    - All linked to demo user
    - Cover multiple categories
    - Dates spread across current month
    - At least one expense per category

---

## 6. Changes to `app.py`

- Import:
    - `get_db`
    - `init_db`
    - `seed_db`
- Call `init_db()` and `seed_db()` inside `app.app_context()` on startup
- Ensure DB is ready before routes are used

---

## 7. Files to Change

- `database/db.py` → implement all functions
- `app.py` → add imports and startup calls

---

## 8. Files to Create

- None

---

## 9. Dependencies

- No new pip packages
- Use:
    - `sqlite3` (standard library)
    - `werkzeug.security` (already installed)

---

## 10. Categories (Fixed List)

Use exactly these values:

- Food
- Transport
- Bills
- Health
- Entertainment
- Shopping
- Other

---

## 11. Rules for Implementation

- No ORMs (no SQLAlchemy)
    
- Use **parameterized queries only**
    
- Never use string formatting in SQL
    
- Enable `PRAGMA foreign_keys = ON` on every connection
    
- Store `amount` as REAL (float), not INTEGER
    
- Hash passwords using:
    
    ```
    fromwerkzeug.securityimportgenerate_password_hash
    ```
    
- `seed_db()` must prevent duplicate inserts
    
- Dates must follow **YYYY-MM-DD format consistently**
    

---

## 12. Expected Behavior

- `get_db()` returns a working connection with:
    - dictionary-like row access
    - foreign key enforcement enabled
- `init_db()`:
    - creates tables safely
    - does not fail on repeated runs
- `seed_db()`:
    - inserts demo data only once
    - does not duplicate records on multiple runs
- Database enforces:
    - unique email constraint
    - valid foreign key relationships

---

## 13. Error Handling Expectations

- Inserting duplicate email → should fail (UNIQUE constraint)
- Inserting expense with invalid `user_id` → should fail (foreign key constraint)
- Invalid queries → should raise clear errors for debugging

---

## 14. Definition of Done

- [ ] Database file is created on app startup
- [ ] Both tables exist with correct schema and constraints
- [ ] Demo user exists with hashed password
- [ ] 8 sample expenses exist across categories
- [ ] No duplicate seed data on repeated runs
- [ ] App starts without errors
- [ ] Foreign key enforcement works
- [ ] All queries use parameterized SQL

---
---

# Custom Slash Commands

![[Pasted image 20260429102935.png]]

![[Pasted image 20260429103133.png]]

![[Pasted image 20260429103244.png]]

#  seed-user 

---

description: Create a single dummy user in the database
allowed-tools: Read, Bash(python3:*)

---

Read database/db.py to understand the users table 
schema and the get_db() helper.

Then write and run a Python script using Bash that:

1. Generates a realistic random Indian user using your 
   own knowledge of common Indian names across regions:
   - Name: a realistic Indian first + last name
   - Email: derived from the name with a random 2-3 digit 
     number suffix (e.g. rahul.sharma91@gmail.com)
   - Password: "password123" hashed with werkzeug's 
     generate_password_hash
   - created_at: current datetime

2. Checks if the generated email already exists in the 
   users table. If it does, regenerate until unique.

3. Inserts the user into the database using the same 
   get_db() pattern found in db.py.

4. Prints confirmation:
   - id
   - name
   - email
   
---
---

# SKILLS

![[Pasted image 20260429123716.png]]

![[Pasted image 20260429123915.png]]

![[Pasted image 20260429124006.png]]

![[Pasted image 20260429124219.png]]

![[Pasted image 20260429124810.png]]

![[Pasted image 20260429124920.png]]

![[Pasted image 20260429125841.png]]

![[Pasted image 20260429130052.png]]

![[Pasted image 20260429130445.png]]

![[Pasted image 20260429130555.png]]


---
---

# SubAgents

![[Pasted image 20260429160703.png]]

![[Pasted image 20260429161517.png]]

---
---
# Custom SubAgents




