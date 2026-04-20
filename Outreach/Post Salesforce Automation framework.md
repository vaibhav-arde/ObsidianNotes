
🚀 **Excited to announce that I'm open-sourcing my Salesforce Playwright TypeScript Automation Framework!**

After months of building, iterating, and battle-testing this framework against real Salesforce Lightning orgs, I've decided to give it back to the community. If you've ever struggled with automating Salesforce — the shadow DOM, Lightning's dynamic rendering, MFA hurdles, or fragile selectors — this framework was built to solve exactly those pain points.

**🔧 What is it?**
An enterprise-grade, hybrid (UI + API) test automation framework purpose-built for **Salesforce Lightning**, powered by **Playwright** and **TypeScript**.

**✨ Key Highlights:**

✅ **Hybrid Testing Architecture** — API creates test data, UI validates it. Fast, reliable, and eliminates flaky setup.

✅ **TypeScript-First with Strict Mode** — Full type safety across Page Objects, API Clients, fixtures, and test data using generics and interfaces.

✅ **SOLID & DRY Design Principles** — `BasePage` for all Page Objects, `BaseApiClient<T>` for all REST clients — zero code duplication.

✅ **Custom Playwright Fixtures** — Chained dependency injection (`authToken → accountApi → loginPage`) with session-scoped authentication.

✅ **Salesforce MFA Handled** — Automated auth setup flow that persists session cookies, so your CI and Docker runs never hit a login wall.

✅ **Multi-Environment Support** — Dynamically switch between dev, QA, staging, and production Salesforce orgs via environment configs.

✅ **Docker-Ready** — Containerized headless execution with volume-mounted auth sessions for full environment parity.

✅ **CI/CD Pipeline** — GitHub Actions with ESLint gating, multi-browser matrix (Chromium, Firefox, WebKit), and automated regression runs.

✅ **API Testing** — Full Salesforce REST API coverage with typed clients for Account, Contact, and generic SObject CRUD operations using OAuth2 authentication.

✅ **Code Quality Guardrails** — ESLint, Prettier, Husky pre-commit hooks, and lint-staged — baked in from day one.

**🤝 Who is this for?**
- QA Engineers & SDETs working with Salesforce
- Teams looking for a production-ready Playwright + TypeScript starter for enterprise CRMs
- Anyone who wants to see how SOLID principles, custom fixtures, and hybrid testing come together in a real-world framework

The repo includes a full README, Contributing Guide, Code of Conduct, Security Policy, and Bruno API collections for exploratory Salesforce REST flows.

⭐ If this helps you, star the repo. If you improve it, send a PR. Let's make Salesforce test automation less painful — together.

🔗 **GitHub**: [https://github.com/vaibhav-arde/saleforcePlaywrightAutomation]

#Salesforce #Playwright #TypeScript #TestAutomation #QualityEngineering #OpenSource #SDET #QA #CypressAlternative #SalesforceDeveloper #SalesforceAdmin #SalesforceTesting #CI_CD #Docker #GitHubActions #SoftwareTesting #AutomationFramework

---

**Tips before posting:**
- Replace `[Link to your repo]` with your actual GitHub URL.
- Consider adding a short screen recording or screenshot of the Playwright HTML report or a test run to boost engagement.
- Tag relevant people or communities (Salesforce Trailblazers, Playwright team, etc.).
- If you want, you can also pin this post to your profile for visibility.