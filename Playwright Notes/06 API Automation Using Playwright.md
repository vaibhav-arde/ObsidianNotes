---
share_link: https://share.note.sx/indrx0x9#pYP/2S7GKLpxETCyTDBW2C1X8T879i/C4rC0OsG8/HA
share_updated: 2026-03-06T12:13:11+05:30
Author: VaibhaV Arde
---

**Comprehensive API Automation notes using Playwright** 

This covers:
- HTTP methods (GET, POST, PUT, PATCH, DELETE)
- Passing URL, headers, payload
- API chaining
- Best practices
- Interview questions senior SDET roles ask
- Production-level patterns

---

# 1. API Automation in Playwright

Playwright supports API testing using **request context**.
The fixture provided by Playwright is:
```code
request
```

Internally it is **APIRequestContext** from **Playwright**.
This allows you to send:
- GET
- POST
- PUT
- PATCH
- DELETE

requests directly to APIs.

---

# 2. Basic API Test Structure

```js
import { test, expect } from '@playwright/test';  
  
test('Get users', async ({ request }) => {  
  const response = await request.get(  
    'https://reqres.in/api/users/2'  
  );  
  expect(response.status()).toBe(200);  
  const body = await response.json();  
  expect(body.data.first_name).toBe('Janet');  
  
});
```

---

# 3. GET Request

GET is used to **retrieve data from server**.
## Example GET request

```js
test('GET user details', async ({ request }) => {  
  
  const response = await request.get(  
    'https://reqres.in/api/users/2'  
  );  
  expect(response.status()).toBe(200);  
  const body = await response.json();  
  expect(body.data.id).toBe(2);  
  expect(body.data.email).toContain('@');  
});
```

---

### Passing Query Parameters

Example URL:
```js
/api/users?page=2&limit=10
```

Playwright syntax:
```js
const response = await request.get('/users', {  
  params: {  
    page: 2,  
    limit: 10  
  }  
});
```

---
# 4. POST Request

POST is used to **create a new resource**.
## Example POST request

```js
test('Create user', async ({ request }) => {  
  
  const response = await request.post(  
    'https://reqres.in/api/users',  
    {  
      data: {  
        name: 'Vaibhav',  
        job: 'QA Engineer'  
      }  
    }  
  );  
  expect(response.status()).toBe(201);  
  const body = await response.json();  
  expect(body.name).toBe('Vaibhav');  
});
```

---

### Passing Headers
```js
const response = await request.post('/users', {  
  
  headers: {  
    'Content-Type': 'application/json',  
    'Authorization': 'Bearer token123'  
  },  
  data: {  
    name: 'Vaibhav'  
  }  
});
```

---

# 5. PUT Request

PUT updates **entire resource**.
### Example
```js
test('Update user with PUT', async ({ request }) => {  
  
  const response = await request.put('/users/2', {  
    data: {  
      name: 'Updated User',  
      job: 'Automation Engineer'  
    }  
  });  
  expect(response.status()).toBe(200);  
});
```

---

# 6. PATCH Request

PATCH updates **partial fields**.
Example:

```js
test('Update email using PATCH', async ({ request }) => {  
  const response = await request.patch('/users/2', {  
    data: {  
      email: 'updated@test.com'  
    }  
  });  
  expect(response.status()).toBe(200);  
});
```

---

# 7. DELETE Request

DELETE removes a resource.
Example:

```js
test('Delete user', async ({ request }) => {  
  const response = await request.delete('/users/2');  
  expect(response.status()).toBe(204);  
});
```

---

# 8. Passing Headers

Headers are used for:
- Authentication
- Content type
- Metadata

Example:
```js
headers: {  
  'Authorization': 'Bearer token123',  
  'Content-Type': 'application/json'  
}
```

---

# 9. Passing Request Payload

Payload is the **data sent to API**.

Example:
```js
data: {  
  name: "Vaibhav",  
  role: "Automation Engineer"  
}
```

Playwright automatically converts object to JSON.

---

# 10. API Chaining (Very Important Interview Topic)

API chaining means **using response from one API as input to another API**.

Example flow:
```text
1 Create user  
2 Get user  
3 Update user  
4 Delete user
```

## Example API chaining

```js
test('API chaining example', async ({ request }) => {  
  
  // Create user  
  const createResponse = await request.post('/users', {  
    data: {  
      name: 'Vaibhav'  
    }  
  });  
  
  const createBody = await createResponse.json();  
  const userId = createBody.id;  
  
  // Get user using created id  
  const getResponse = await request.get(`/users/${userId}`);  
  expect(getResponse.status()).toBe(200);  
  
});
```

---
# Interview-Ready Answer

> `.json()` is not a native JavaScript language method. It is a method provided by certain HTTP response objects such as those in the Fetch API and Playwright. It reads the response body and parses it into a JavaScript object. Other libraries like Axios return JSON directly through properties like `response.data`.

# Conceptual Equivalent

|Library|Get JSON response|
|---|---|
|Fetch|`response.json()`|
|Playwright|`response.json()`|
|Axios|`response.data`|
|Supertest|`response.body`|

---

# 11. Validate Response Schema

Often done using JSON schema validation.

Example assertion:

```js
expect(body).toMatchObject({  
  id: expect.any(Number),  
  name: expect.any(String)  
});
```

---

# 12. Validations in API Automation

API automation tests should validate:
### Status code
```js
expect(response.status()).toBe(200);
```

---
### Response body
```js
expect(body.name).toBe('Vaibhav');
```

---

### Headers
```js
expect(response.headers()['content-type'])  
  .toContain('application/json');
```

---

### Response time
```js
expect(response.request().timing()).toBeLessThan(2000);
```
---

# 13. Production-Level API Framework Structure

Typical API automation structure:

```text
tests  
api  
  users.spec.js  
  orders.spec.js  
  
schemas  
  userSchema.json  
  
utils  
  apiClient.js
```

---

# 14. Advanced API Concepts Interviewers Ask

### Idempotency
In APIs and HTTP requests, **Idempotency** means:

> Performing the **same operation multiple times produces the same result as performing it once**.

In other words, **repeating the request does not change the system state after the first successful request**.
The **final state of the system remains the same**.

## HTTP Methods and Idempotency

|Method|Idempotent|Reason|
|---|---|---|
|GET|✅ Yes|Only reads data|
|PUT|✅ Yes|Replaces resource|
|DELETE|✅ Yes|Resource already removed|
|POST|❌ No|Creates new resource|
|PATCH|❌ Usually not|Partial updates|

---
##  Real Example (Bank)

Imagine an API:
```text
POST /transfer-money
```

Body:
```js
{  
  "amount": 100  
}
```

If this request runs **twice**, money transfers **twice**.
That is **not idempotent**.
This is why payment APIs use **idempotency keys**.

---

## Idempotency Key Example

Payment APIs like Stripe use:
Idempotency-Key: 123456
Even if request repeats due to network retry, server processes **only once**.

---
## Why Idempotency Is Important

It helps with:

- Safe retries
- Network failures
- Distributed systems
- Preventing duplicate transactions

---
# 🎯 Interview Answer

> Idempotency means that making the same API request multiple times produces the same final state as making it once. HTTP methods like GET, PUT, and DELETE are idempotent because repeating them does not change the system state after the first request, while POST is usually not idempotent because it creates new resources each time.

---

### Rate Limiting

Limits number of API calls.
Example:
```text
100 requests per minute
```

---
### Pagination

Handling large datasets.
Example:
```code
/users?page=2&limit=20
```

---
### API Versioning

Example:
```code
/api/v1/users  
/api/v2/users
```

---
### API Gateway

Central entry point to APIs.

Architecture:

```text
Client  
   |  
API Gateway  
   |  
Microservices
```

---

# 15. Common Interview Questions (Senior SDET)

### What validations do you perform in API testing?

Answer:

- Status codes
- Response schema
- Data validation
- Headers validation
- Authentication
- Performance

---

### Difference between PUT and PATCH?

PUT replaces entire resource.  
PATCH updates partial fields.

---

### What is idempotency?

An API is idempotent if multiple identical requests produce the same result.

Example:
PUT /users/1

---

### How do you handle authentication in API tests?

Using:
- Bearer tokens
- OAuth
- API keys
    

---

### How do you chain APIs?

By extracting data from response and using it in next request.
Example:
const id = responseBody.id

---

# 16. Real SDET Best Practices

Senior automation engineers ensure:

```text
1 Tests are independent  
2 Test data is dynamic  
3 APIs are chained logically  
4 Response schema is validated  
5 Logs and reports are captured
```

---

# 17. GraphQL API Testing with Playwright

GraphQL requests are sent using POST.
Example:
```js
const response = await request.post('/graphql', {  
  data: {  
    query: `  
      query {  
        user(id:1) {  
          name  
          email  
        }  
      }  `  
  }  
});
```
---

# 18. Production Tips

### Use environment variables

Example:
```
process.env.API_URL
```

---

### Reusable API client

Create helper methods for:
- GET
- POST    
- DELETE

---

# 19. Example Real Order Flow Test

```js
test('Create order flow', async ({ request }) => {  
  const createOrder = await request.post('/orders', {  
    data: {  
      productId: 1,  
      quantity: 2  
    }  
  });  
  const orderBody = await createOrder.json();  
  const orderId = orderBody.id;  
  const getOrder = await request.get(`/orders/${orderId}`);  
  expect(getOrder.status()).toBe(200);  
});
```

---

# 20. Key Takeaway

Playwright API automation helps validate:
- backend logic
- data consistency
- business workflows

without UI dependency.

---
---
## JSON Schema Validation
**Clear and correct example of JSON Schema Validation using Playwright API testing**.  
Playwright itself does **not include built-in JSON schema validation**, so we typically use a library like **Ajv** (Another JSON Validator).

---

# 1️⃣ Install Required Package

Install **Ajv** for schema validation.
``npm install ajv``

---

# 2️⃣ Example API Response

Suppose the API returns:
```js
{  
  "id": 1,  
  "name": "Leanne Graham",  
  "email": "leanne@example.com"  
}
```

We want to verify the **structure of this response**.

---

# 3️⃣ Define JSON Schema

```js
const userSchema = {  
  type: "object",  
  properties: {  
    id: { type: "number" },  
    name: { type: "string" },  
    email: { type: "string" }  
  },  
  required: ["id", "name", "email"],  
  additionalProperties: false  
};
```

This schema ensures:
- `id` must be number
- `name` must be string
- `email` must be string
- All fields are required

---

# 4️⃣ Playwright Test with JSON Schema Validation

```js
import { test, expect } from '@playwright/test';  
import Ajv from "ajv";  
  
test('Validate user API response schema', async ({ request }) => {  
  const response = await request.get(  
    'https://jsonplaceholder.typicode.com/users/1'  
  );  
  expect(response.status()).toBe(200);  
  const body = await response.json();  
  const schema = {  
    type: "object",  
    properties: {  
      id: { type: "number" },  
      name: { type: "string" },  
      email: { type: "string" }  
    },  
    required: ["id", "name", "email"]  
  };  
  const ajv = new Ajv();  
  const validate = ajv.compile(schema);  
  const valid = validate(body);  
  expect(valid).toBe(true);  
});
```

---

# 5️⃣ What Happens in This Test

Step by step:

1️⃣ Send API request  
2️⃣ Get response JSON
```js
const body = await response.json();
```
3️⃣ Validate JSON structure against schema
```js
validate(body);
```
4️⃣ Assert schema validation result
```js
expect(valid).toBe(true);
```

---

# 6️⃣ If Response Is Invalid

Example response:
```js
{  
  "id": "1",  
  "name": "Vaibhav"  
}
```

Errors:
- `id` should be number but is string
- `email` missing

Ajv returns validation errors.

---

# 7️⃣ Advanced Version (Better Error Reporting)

```js
if (!valid) {  
  console.log(validate.errors);  
}
```

Example error:
```js
[  
  {  
    keyword: 'type',  
    message: 'should be number'  
  }  
]
```

---

# 8️⃣ Why Schema Validation Is Important

It ensures:
- API contract is correct
- Backend changes don’t break clients
- Required fields exist
- Correct data types

---

# 🎯 Interview Answer

> JSON schema validation ensures that an API response matches a predefined structure. In Playwright, this is typically implemented using libraries like Ajv, where the API response is parsed using `response.json()` and validated against a schema to confirm that required fields and data types match the expected contract.

---
---

Below is a **complete Playwright POST API test example** that validates:

- URL
- Headers
- Request payload (body)
- Status code
- Response body
- Response headers
- Response time

I’ll also explain **what each step means from an interview perspective**.

---

# Example Scenario

We want to **create a new user** using a POST API.
Endpoint:
```code
POST https://reqres.in/api/users
```
Request Body:
```js
{  
  "name": "Vaibhav",  
  "job": "Automation Engineer"  
}
```

Expected validations:
- Status = **201**
- Response body contains **name**
- Header contains **application/json**
- Response time < **2 seconds**

---

# Playwright API Automation Example

```js
import { test, expect } from '@playwright/test';  

test('POST API validation example', async ({ request }) => {  
  const startTime = Date.now();  
  const response = await request.post(  
    'https://reqres.in/api/users',  
    {  
      headers: {  
        'Content-Type': 'application/json'  
      },  
  
      data: {  
        name: 'Vaibhav',  
        job: 'Automation Engineer'  
      }  
    }  
  );  

  const responseTime = Date.now() - startTime;  
  // Validate Status Code  
  expect(response.status()).toBe(201);  
  
  // Validate Response Headers  
  expect(response.headers()['content-type'])  
    .toContain('application/json');  
  
  // Validate Response Body  
  const body = await response.json();  
  
  expect(body.name).toBe('Vaibhav');  
  expect(body.job).toBe('Automation Engineer');  
  
  // Validate Response Time  
  expect(responseTime).toBeLessThan(2000);  
  
});
```
---

# Explanation (Interview Perspective)

## 1. Passing URL
The API endpoint is passed inside the request method.
```js
request.post('https://reqres.in/api/users')
```
Interview explanation:
> The API endpoint represents the resource where the request is sent.

---

# 2. Passing Headers
Headers define metadata about the request.
Example:
```js
headers: {  
 'Content-Type': 'application/json'  
}
```

Common headers used in API automation:

|Header|Purpose|
|---|---|
|Authorization|Authentication|
|Content-Type|Request data format|
|Accept|Response format|

Example with authentication:
```js
headers: {  
  Authorization: 'Bearer token123'  
}
```

---

# 3. Passing Request Payload

Payload is the **data sent in POST / PUT / PATCH** requests.
Example:
```js
data: {  
 name: 'Vaibhav',  
 job: 'Automation Engineer'  
}
```
Playwright automatically converts it to JSON.

---

# 4. Validating Status Code

Status code tells whether API call succeeded.
Example:
```js
expect(response.status()).toBe(201);
```

Meaning:

|Code|Meaning|
|---|---|
|200|Success|
|201|Resource created|
|204|Deleted successfully|

---

# 5. Validating Response Body

First convert response to JSON.
```js
const body = await response.json();
```

Then assert fields.
```js
expect(body.name).toBe('Vaibhav');
```
This ensures API returns correct data.

---

# 6. Validating Headers

Headers can be accessed using:
```js
response.headers()
```

Example validation:
```js
expect(response.headers()['content-type'])  
  .toContain('application/json');
```

---

# 7. Validating Response Time

Performance is important in API automation.
Example:
```js
const startTime = Date.now();
```

After request:
```js
const responseTime = Date.now() - startTime;
```

Validation:
```js
expect(responseTime).toBeLessThan(2000);
```
Meaning response must be **less than 2 seconds**.

---

# Example Output Response

Typical API response:
```js
{  
 "name": "Vaibhav",  
 "job": "Automation Engineer",  
 "id": "125",  
 "createdAt": "2026-03-05T12:10:00Z"  
}
```

---

# Important API Assertions (Senior SDET Level)

A good API test should validate:

1. Status code
2. Response body
3. Response headers
4. Response schema
5. Response time
6. Business logic

Example business logic validation:
```js
expect(body.total).toBe(body.subtotal + body.shipping);
```

---

# Common Interview Questions Based on This

### What validations do you perform in API testing?
Answer:
- Status code validation
- Response body validation
- Header validation
- Response schema validation
- Performance validation

---
### Why validate headers?
Headers ensure correct **data format, authentication, and caching behavior**.

---
### How do you validate response time?
Measure time before request and after response.

---

# Best Practice (Real Framework)
Most teams create **reusable API client functions**.
Example:
```js
async function createUser(request, payload) {  
  return request.post('/users', { data: payload });  
}
```

This improves maintainability.

---
---
