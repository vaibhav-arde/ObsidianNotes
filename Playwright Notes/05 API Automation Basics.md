---
share_link: https://share.note.sx/ah6fj0hm#OEWhEGJV32PcJ82jt4jGI+o0pG6qCeiOLWMJR80BuPg
share_updated: 2026-03-04T15:52:06+05:30
Author: VaibhaV Arde
---

Below are **structured, detailed API Automation Notes** (including **REST + GraphQL**) designed so you can **study, revise, and use them for interviews**. I organized them logically from **fundamentals → architecture → testing → Playwright usage**.

---

# 1. What is an API

**API (Application Programming Interface)** is a mechanism that allows **different software systems to communicate with each other**.

It defines **rules and protocols** for requesting and exchanging data.
### Example

When a mobile app requests user data:

```Code
Mobile App → API → Backend Server → Database
```

Example request:
```Code
GET https://api.example.com/users/1
```

Response:
```JSON
{  
"id":1,  
"name":"Vaibhav",  
"email":"vaibhav@test.com"  
}
```

The API acts as the **middle layer between frontend and backend services**.

---

# 2. Client–Server Architecture

API communication follows the **client-server model**.

### Client

The system requesting data.

Examples
- Web application
- Mobile app
- Automation test
- Another backend service

### Server

The system processing the request.

Examples
- Backend application
- Database
- Microservice

---

# 3. HTTP Protocol

Most APIs operate using **HTTP (Hypertext Transfer Protocol)**.
HTTP defines **how messages are formatted and transmitted between systems**.
Communication flow:

```Code
Client → HTTP Request → Server  
Server → HTTP Response → Client
```

---

# 4. HTTP Request Structure

An HTTP request contains:

### 1 Method
Defines the action to perform.

### 2 URL
Endpoint of API.

### 3 Headers
Metadata about request.

### 4 Body
Data sent with request (optional).

Example request:

```Code
POST /users HTTP/1.1  
Host: api.test.com  
Content-Type: application/json  
Authorization: Bearer token123
```
Body:
```JSON
{  
"name":"Vaibhav",  
"email":"test@test.com"  
}
```

---

# 5. HTTP Response Structure

A response contains:

1 Status code  
2 Headers  
3 Response body

Example:
```Code
HTTP/1.1 200 OK  
Content-Type: application/json
```

Body:
```JSON
{  
"id":101,  
"name":"Vaibhav"  
}
```

---

# 6. HTTP Methods
HTTP methods define **operations performed on resources**.

|Method|Purpose|
|---|---|
|GET|Retrieve data|
|POST|Create data|
|PUT|Update entire resource|
|PATCH|Partial update|
|DELETE|Remove resource|

---

### GET Example

```Code
GET /products
```
Response
```JSON
[  
	{"id":1,"name":"Laptop"},  
	{"id":2,"name":"Phone"}  
]
```

---

### POST Example

```Code
POST /users
```

Body
```JSON
{  
"name":"Vaibhav",  
"email":"test@test.com"  
}
```

---

### PUT Example

```Code
PUT /users/10
```

Body
```JSON
{  
"name":"Updated User",  
"email":"updated@test.com"  
}
```

---

### PATCH Example

```Code
PATCH /users/10
```

Body
```JSON
{  
"email":"new@test.com"  
}
```

---

### DELETE Example

```Code
DELETE /users/10
```

---

# 7. HTTP Status Codes

Status codes indicate **result of request**.
### Success Codes

|Code|Meaning|
|---|---|
|200|Request successful|
|201|Resource created|
|204|No content|

---

### Client Errors

| Code | Meaning      |
| ---- | ------------ |
| 400  | Bad request  |
| 401  | Unauthorized |
| 403  | Forbidden    |
| 404  | Not found    |

---

### Server Errors

| Code | Meaning               |
| ---- | --------------------- |
| 500  | Internal server error |
| 503  | Service unavailable   |

---

# 8. Headers

Headers carry **additional metadata**.

Example:
```Code
Content-Type: application/json  
Authorization: Bearer token  
Accept: application/json
```

Common headers:

| Header        | Purpose         |
| ------------- | --------------- |
| Authorization | Authentication  |
| Content-Type  | Data format     |
| Accept        | Response format |

---

# 9. Query Parameters

Used to filter data.
Example:
```Code
GET /users?page=2&limit=10
```

Meaning:
- page = 2
- limit = 10

---

# 10. Path Parameters

Used to identify a specific resource.
Example:
```Code
GET /users/10
```
Here **10** is user ID.

---

# 11. Request Body

Body contains **data sent to server**.

Used in:
- POST
- PUT
- PATCH

Example:
```JSON
{  
	"username":"vaibhav",  
	"password":"12345"  
}
```

---

# 12. JSON

Most APIs exchange data using **JSON (JavaScript Object Notation)**.

Example:
```JSON
{  
	"user":{  
		"id":1,  
		"name":"Vaibhav"  
	}  
}
```

Advantages
- Lightweight
- Easy to parse
- Human readable

---

# 13. Authentication

APIs often require authentication.

Common methods:
### Basic Authentication
```Code
Authorization: Basic base64(username:password)
```

---
### Bearer Token
```Code
Authorization: Bearer token123
```

---
### API Key
```Code
x-api-key: abc123
```

---

# 14. Exposed vs Unexposed APIs

### Exposed APIs

Public APIs accessible by external systems.

Examples:

```Code
Weather APIs  
Payment APIs  
Google Maps APIs
```

---
### Unexposed APIs

Internal APIs used within system architecture.

Example architecture:
```Code
Frontend  
   |  
API Gateway  
   |  
User Service  
Order Service  
Payment Service
```

These APIs are **not publicly accessible**.

---

# 15. Web Services

A **web service** is a service that allows systems to communicate over the internet.

Two main types:

### REST
Modern and widely used.
Uses:
- HTTP
- JSON
- Stateless communication

---

### SOAP
Older protocol used in enterprise systems.
Uses:
- XML
- WSDL contracts

Example SOAP request:
```XML
<soap:Envelope>  
	<soap:Body>  
		<GetUser>  
			<id>1</id>  
		</GetUser>  
	</soap:Body>  
</soap:Envelope>
```

---

# 16. REST API Principles

REST APIs follow these principles:

### Stateless
Each request is independent.

### Client–Server separation
Frontend and backend are separate.

### Cacheable
Responses can be cached.

### Uniform interface
Standard methods (GET POST PUT DELETE).

---

# 17. Microservices

Microservices architecture divides system into **small independent services**.

Example system:
```Code
User Service  
Order Service  
Payment Service  
Inventory Service
```

Each service exposes APIs.
Example:
```Code
GET /users  
GET /orders  
POST /payments
```

Benefits:
- Independent deployment
- Better scalability
- Fault isolation

---

# 18. Serialization & Deserialization

### Serialization

Converting object → JSON.
Example object:
```Code
User(name="Vaibhav")
```
Serialized JSON:
```JSON
{  
	"name":"Vaibhav"  
}
```

---

### Deserialization

```Code
JSON → object.
```

---

# 19. GraphQL

GraphQL is a **query language for APIs** that allows clients to request **exact data needed**.

Unlike REST, GraphQL uses **a single endpoint**.

Typical endpoint:

```Code
POST /graphql
```

---

### GraphQL Query Example

```Graphql
query {  
	user(id:1) {  
		name  
		email  
	}  
}
```

Response:
```Graphql
{  
	"data":{  
		"user":{  
			"name":"Vaibhav",  
			"email":"test@test.com"  
		}  
	}  
}
```

---

### GraphQL Mutation

Used to modify data.

```
mutation {  
	createUser(name:"Vaibhav",email:"test@test.com") {  
		id  
		name  
	}  
}
```

---

### GraphQL Advantages

- No over-fetching
- No under-fetching
- Flexible queries
- Single endpoint

---

# 20. GraphQL vs REST

| Feature        | REST     | GraphQL  |
| -------------- | -------- | -------- |
| Endpoints      | Multiple | Single   |
| Data retrieval | Fixed    | Flexible |
| Over-fetching  | Possible | No       |

---

# 21. API Testing Concepts

API automation validates:

1 Status codes  
2 Response body  
3 Response time  
4 Headers  
5 Authentication  
6 Schema validation  
7 Data consistency

Example validation:
```text
Expect status = 200  
Expect name = Vaibhav  
Expect response time < 2s
```

---

# 22. API Automation with Playwright

Playwright supports API testing using **APIRequestContext**.

Example:

```js
import { test, expect } from '@playwright/test';  
  
test('Get user API', async ({ request }) => {  
	const response = await request.get('https://reqres.in/api/users/2');  
	expect(response.status()).toBe(200);  
	const body = await response.json();  
	expect(body.data.first_name).toBe('Janet');  
	}
);
```

---

# 23. What API Automation Engineers Validate

During API testing we verify:

- Status code
- Response schema
- Response data
- Headers
- Authentication
- Performance
- Error handling

---

# 24. Important API Terminologies

### Endpoint
Specific URL where API is available.
Example:
```Code
/users  
/orders
```

---
### Payload
Data sent in request body.

---

### Rate Limiting

Restrict number of API calls.
Example:
100 requests per minute

---

### API Gateway

Central entry point for all APIs.

Example architecture:

```Code
Client  
  |  
API Gateway  
  |  
Microservices
```

---

### Pagination

Used when returning large datasets.

Example:

```Code
GET /users?page=2&limit=20
```

---

# 25. Real API Testing Flow

Typical automation workflow:

Send API Request  
Validate Status Code  
Validate Response Body  
Validate Headers  
Validate Performance

---
---
