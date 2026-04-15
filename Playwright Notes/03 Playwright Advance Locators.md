---
share_link: https://share.note.sx/qb46f2qe#uzOunQapyuGoEwRkkwNwWKN1K2CfEMLTm5U87vrrx2I
share_updated: 2026-03-03T11:51:45+05:30
Author: VaibhaV Arde
---
Let’s cover **Playwright Advanced Locators** in a structured way — covering almost all powerful combinations you’ll use in real automation.

I’ll keep it **practical + interview-ready**.

---

# 🔥 1️⃣ getByRole() (Accessibility Based – Best Practice)

```js
await page.getByRole('button', { name: 'Login' }).click();
```

With options:

```js
await page.getByRole('button', { name: /log/i, exact: false });  
await page.getByRole('heading', { level: 2 });  
await page.getByRole('checkbox', { checked: false });
await page.getByRole('link', { name: 'Home' }).click();
await page.getByRole('listitem');
await page.getByRole('textbox', { name: 'Username' }).fill('Vaibhav');
await page.getByRole('radio', { name: 'Male' }).check();
await page.getByRole('combobox').selectOption('India');
```

---

# 🔥 2️⃣ getByText()

```js
await page.getByText('Add to cart').click();
```

Partial match:

```js
await page.getByText(/add/i);
```

Exact match:

```js
await page.getByText('Add to cart', { exact: true });
```

---

# 🔥 3️⃣ getByLabel()

For input fields linked to labels:

```js
await page.getByLabel('Username').fill('Vaibhav');
```

---

# 🔥 4️⃣ getByPlaceholder()

```js
await page.getByPlaceholder('Enter email').fill('test@gmail.com');
```

---

# 🔥 5️⃣ getByTestId() (Very Stable)

If app uses `data-testid`:

```js
await page.getByTestId('add-to-cart').click();
```

---

# 🔥 6️⃣ locator() + filter() (Dynamic Repeated Elements)

```js
await page  
  .locator('.inventory_item')  
  .filter({ hasText: 'Fleece Jacket' })  
  .getByRole('button', { name: 'Add to cart' })  
  .click();
```

---

# 🔥 7️⃣ filter() with has (Parent-Child Relation)

```js
await page  
  .locator('.card')  
  .filter({  
    has: page.locator('.title', { hasText: 'Product A' })  
  })  
  .locator('button')  
  .click();
```

---

# 🔥 8️⃣ Chaining Locators

```js
await page  
  .locator('#login-form')  
  .locator('input[name="username"]')  
  .fill('Vaibhav');
```

Scoped and clean.

---

# 🔥 9️⃣ nth(), first(), last()

```js
await page.locator('.item').nth(2).click();  
await page.locator('.item').first().click();  
await page.locator('.item').last().click();
```

---

# 🔥 1️⃣0️⃣ locator.and() (Combine Conditions)

```js
await page  
  .getByRole('button')  
  .and(page.getByTitle('Submit'))  
  .click();
```

Element must satisfy BOTH.

---

# 🔥 1️⃣1️⃣ locator.or() (Alternative Matching)

```js
await page  
  .getByRole('button', { name: 'Sign in' })  
  .or(page.getByRole('button', { name: 'Login' }))  
  .click();
```

Useful for multi-env apps.

---

# 🔥 1️⃣2️⃣ CSS :has() (Advanced CSS)

```js
await page.locator('.product:has-text("Fleece Jacket") button').click();
```

Or:

```js
await page.locator('.card:has(.title:has-text("Product A")) button');
```

---

# 🔥 1️⃣3️⃣ Frame + Locator Combination

```js
await page  
  .frameLocator('#iframe-id')  
  .getByRole('button', { name: 'Submit' })  
  .click();
```

---

# 🔥 1️⃣4️⃣ Shadow DOM

```js
await page.locator('custom-element').locator('button').click();
```

Playwright auto-pierces shadow DOM.

---

# 🔥 1️⃣5️⃣ Dynamic Text Using Regex

```js
await page.getByText(/Sauce Labs/i);
```

---

# 🔥 1️⃣6️⃣ Multiple Conditions (Power Combo)

```js
await page  
  .locator('.inventory_item')  
  .filter({ hasText: 'Fleece Jacket' })  
  .getByRole('button', { name: /add/i })  
  .click();
```

# 1️⃣7️⃣ List

```js
await page.getByRole('list');  
await page.getByRole('listitem');
```

---

# 🔥  1️⃣8️⃣ Table

```js
await page.getByRole('table');  
await page.getByRole('row');  
await page.getByRole('cell');  
await page.getByRole('columnheader');
```

---

# 🔥 1️⃣9️⃣ Dialog (Modal)

```js
await page.getByRole('dialog');
```

---

# 🔥 2️⃣0️⃣ Alert

```js
await page.getByRole('alert');
```

---

# 🔥 2️⃣ 1️⃣ Tab & Tabpanel

```js
await page.getByRole('tab', { name: 'Profile' }).click();  
await page.getByRole('tabpanel');
```

---

# 🔥 2️⃣2️⃣ Menu & Menuitem

```js
await page.getByRole('menu');  
await page.getByRole('menuitem', { name: 'Logout' }).click();
```

---

# 🔥 2️⃣3️⃣ Navigation

```js
await page.getByRole('navigation');
```

---

# 🔥 2️⃣4️⃣ Image

```js
await page.getByRole('img', { name: 'Product image' });
```

---

# 🔥 2️⃣5️⃣ Searchbox

```js
await page.getByRole('searchbox').fill('Laptop');
```

---

# 🔥 2️⃣6️⃣ Slider

```js
await page.getByRole('slider');
```

---

# 🔥 2️⃣7️⃣ Progressbar

```js
await page.getByRole('progressbar');
```

---

# 🧠 Locator Strategy Order (Professional Practice)

1. `getByRole()` ✅
2. `getByLabel()`
3. `getByTestId()`
4. `getByText()`
5. `locator().filter()`
6. CSS
7. XPath (last option)

----
----

![[Playwright Keywords Locators.png]]