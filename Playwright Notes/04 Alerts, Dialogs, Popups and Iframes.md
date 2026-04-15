---
share_link: https://share.note.sx/dh4q551m#fq4JCT0oeSxFv1z//Ud5ZHFz/hr8LhEx1zijCpTXph8
share_updated: 2026-03-03T13:09:10+05:30
Author: VaibhaV Arde
---

In Playwright, **alerts, dialogs, and popups** are handled differently.
Let’s break them clearly with examples.

---

# 🟢 1️⃣ JavaScript Alerts / Confirm / Prompt (Dialogs)

These are browser-native dialogs like:

- `alert()`
- `confirm()`
- `prompt()`

Playwright handles them using the **`dialog` event**.

---

## ✅ Example: Handle Alert

```js
await page.on('dialog', async dialog => {  
  console.log(dialog.message());  
  await dialog.accept();   // Click OK  
});  

await page.click('#alertButton');
```
  
---

## ✅ Example: Handle Confirm (OK / Cancel)

```js
await page.on('dialog', async dialog => {  
  await dialog.dismiss();   // Click Cancel  
});
```
---

## ✅ Example: Handle Prompt (Send Text)

```js
await page.on('dialog', async dialog => {  
  await dialog.accept('Vaibhav');  // Enter text  
});
```
---

## 🔥 Cleaner Way (Recommended)

```js
page.once('dialog', async dialog => {  
  await dialog.accept();  
});  
  
await page.click('#alertButton');
```

---

# 🟢 2️⃣ Modal Dialog (HTML Popup)

These are NOT browser alerts.  
They are normal HTML elements styled as popup.

Example:

```html
<div class="modal">  
  <button>Close</button>  
</div>
```

You handle them like normal elements.

```js
await page.getByRole('dialog').isVisible();  
await page.getByRole('button', { name: 'Close' }).click();
```

---

# 🟢 3️⃣ New Tab / Popup Window

When clicking opens a new tab:

```js
const [newPage] = await Promise.all([  
  page.waitForEvent('popup'),  
  page.click('text=Open New Tab')  
]);  
  
await newPage.waitForLoadState();  
console.log(await newPage.title());
```

---

# 🟢 4️⃣ Handling Window Popup (context level)

```js
const [newPage] = await Promise.all([  
  context.waitForEvent('page'),  
  page.click('#openWindow')  
]);
```
---

# 🟢 5️⃣ File Upload Dialog (Special Case)

Playwright does NOT interact with OS dialog directly.

Instead:

```js
await page.setInputFiles('input[type="file"]', 'test.pdf');
```

---

# 🟢 6️⃣ Download Popup

```js
const [download] = await Promise.all([  
  page.waitForEvent('download'),  
  page.click('text=Download')  
]);  
  
await download.saveAs('file.pdf');
```

---

# 🎯 Quick Comparison

|Type|How to Handle|
|---|---|
|alert()|`page.on('dialog')`|
|confirm()|`dialog.accept()` / `dismiss()`|
|prompt()|`dialog.accept('text')`|
|HTML modal|Normal locators|
|New tab|`waitForEvent('popup')`|
|File upload|`setInputFiles()`|
|Download|`waitForEvent('download')`|

---

# 🧠 Interview-Level Answer (Short)

Playwright handles browser alerts using the `dialog` event, HTML modals using normal locators, and popups/new tabs using `waitForEvent('popup')`.

---
---


# Handling **iframes** in Playwright

Handling **iframes** properly is very important in Playwright interviews.
Let’s go step-by-step in detail.

---

# 🧠 What is an iframe?

An `<iframe>` is a webpage embedded inside another webpage.

Example:
```html
<iframe id="loginFrame" src="login.html"></iframe>
```
👉 The content inside iframe has its own DOM.  
👉 You **cannot directly access it** using normal `page.locator()`.

---
# 🚀 How Playwright Handles Iframes

Playwright provides:
### ✅ `frameLocator()` (Recommended Way 🔥)
### ✅ `page.frame()` (Alternative way)

---

# ✅ 1️⃣ Using `frameLocator()` (BEST PRACTICE)

### Example HTML

```html
<iframe id="loginFrame">  
   <input type="text" placeholder="Username">  
   <button>Login</button>  
</iframe>
```
---

### Playwright Code

```js
await page  
  .frameLocator('#loginFrame')  
  .getByPlaceholder('Username')  
  .fill('Vaibhav');  
  
await page  
  .frameLocator('#loginFrame')  
  .getByRole('button', { name: 'Login' })  
  .click();
```

---
# 🔥 Why frameLocator() is Better?

✔ Cleaner  
✔ Auto-waits  
✔ Supports chaining  
✔ Most recommended in Playwright docs

---

# ✅ 2️⃣ Using `page.frame()` (Older Style)

If you know frame name or URL:
```js
const frame = page.frame({ name: 'loginFrame' });  
await frame.fill('input[name="username"]', 'Vaibhav');
```

Or by URL:

```js
const frame = page.frame({ url: /login/ });
```

⚠ Less commonly used now.

---

# ✅ 3️⃣ Handling Nested Iframes

If iframe inside iframe:

```js
await page  
  .frameLocator('#outerFrame')  
  .frameLocator('#innerFrame')  
  .getByRole('button', { name: 'Submit' })  
  .click();
```

🔥 Playwright makes nested frames easy.

---

# ✅ 4️⃣ Getting All Frames

```js
console.log(page.frames());
```

Useful for debugging.

---

# 🧪 Real-World Example

Login form inside iframe:

```js
await page.goto('https://example.com');  
  
const frame = page.frameLocator('#authFrame');  
  
await frame.getByLabel('Email').fill('test@mail.com');  
await frame.getByLabel('Password').fill('1234');  
await frame.getByRole('button', { name: 'Sign in' }).click();
```

---

# 🧠 Selenium vs Playwright

|Feature|Selenium|Playwright|
|---|---|---|
|Switch to iframe|`driver.switchTo().frame()`|No switch needed|
|Clean chaining|❌|✅|
|Nested frames|Complex|Easy|

---

# ❗ Important Notes

1. You must use `frameLocator()` if element is inside iframe.
2. Normal `page.locator()` will NOT work.
3. Cross-domain iframes work in Playwright.
4. No manual switching required.

---

# 🎯 Interview One-Line Answer

In Playwright, iframes are handled using `frameLocator()`, which allows direct interaction with elements inside the iframe without switching context manually.

---

Since you're preparing for strong automation roles, remember:

🔥 `frameLocator()` + `getByRole()` combo is best practice.

---
---
