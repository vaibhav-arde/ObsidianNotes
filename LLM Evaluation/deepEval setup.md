# **Client-ready evaluation framework**.

---

# 🚀 Step 1 — System Setup (Python + UV)

Install uv (fast + production-friendly)

```bash
curl -Ls https://astral.sh/uv/install.sh | sh
```

Restart shell, then:

```bash
uv --version
```

---

# 📁 Step 2 — Create Project

```bash
mkdir llm-eval-deepeval
cd llm-eval-deepeval

uv init
```

This creates:

```
pyproject.toml
```

---

# 📦 Step 3 — Install Dependencies

```bash
uv add deepeval ollama python-dotenv
```

Optional but useful for real projects:

```bash
uv add pytest rich pandas
```

---

# 🤖 Step 4 — Setup Ollama

Install Ollama:

```bash
curl -fsSL https://ollama.com/install.sh | sh
```

Start server:

```bash
ollama serve
```

👉 In another terminal, test model:

```bash
ollama run gemma4:31b-cloud
```

If it responds → you're good.

---

# ⚠️ Important Architecture Note (Business Insight)

For your automation company:

- ❌ Don’t couple evaluation directly to Ollama CLI
    
- ✅ Build a **wrapper client layer**
    

This lets you swap:

- Ollama
    
- OpenAI
    
- Azure
    
- Local models
    

Clients LOVE this flexibility.

---

# 🧠 Step 5 — Create LLM Wrapper

Create file:

```bash
mkdir src
touch src/llm.py
```

```python
import requests

OLLAMA_URL = "http://localhost:11434/api/generate"

def generate(prompt: str, model="gemma4:31b-cloud"):
    response = requests.post(
        OLLAMA_URL,
        json={
            "model": model,
            "prompt": prompt,
            "stream": False
        }
    )
    return response.json()["response"]
```

---

# 📊 Step 6 — Create DeepEval Test

Create:

```bash
mkdir tests
touch tests/test_llm.py
```

Example using DeepEval:

```python
from deepeval import assert_test
from deepeval.metrics import AnswerRelevancyMetric
from deepeval.test_case import LLMTestCase

from src.llm import generate

def test_basic_qa():
    prompt = "What is the capital of India?"
    expected = "New Delhi"

    actual_output = generate(prompt)

    test_case = LLMTestCase(
        input=prompt,
        actual_output=actual_output,
        expected_output=expected,
    )

    metric = AnswerRelevancyMetric(threshold=0.7)

    assert_test(test_case, [metric])
```

---

# ▶️ Step 7 — Run Tests

```bash
uv run pytest
```

---

# 📁 Step 8 — Add .env (Production Ready)

```bash
touch .env
```

Example:

```env
OLLAMA_BASE_URL=http://localhost:11434
MODEL=gemma4:31b-cloud
```

Update wrapper:

```python
import os
from dotenv import load_dotenv

load_dotenv()

OLLAMA_URL = os.getenv("OLLAMA_BASE_URL") + "/api/generate"
MODEL = os.getenv("MODEL")
```

---

# 🧪 Step 9 — Add Multiple Eval Types (Critical for Clients)

Extend beyond QA:

```bash
touch tests/test_hallucination.py
touch tests/test_bias.py
touch tests/test_summarization.py
```

Use metrics like:

```python
from deepeval.metrics import (
    HallucinationMetric,
    ToxicityMetric,
    BiasMetric
)
```

---

# 🏗️ Step 10 — Structure Like a Product (Important for Selling)

```
llm-eval-deepeval/
│
├── src/
│   ├── llm.py
│   └── prompts.py
│
├── tests/
│   ├── test_qa.py
│   ├── test_hallucination.py
│   └── test_bias.py
│
├── datasets/
│   └── qa_dataset.json
│
├── reports/
│
├── .env
├── pyproject.toml
```

---

# 💡 Where This Becomes a Business Asset

This setup is not just a project—it can be your **core offering**:

### Offer to SaaS clients:

- “We validate your AI before production”
    
- “We catch hallucinations before your users do”
    
- “We create CI/CD guardrails for LLMs”
    

---

# 🔥 Next Level (You Should Do This Next)

If you want to turn this into **revenue-ready service**, next steps:

1. Add **CI integration (GitHub Actions)**
    
2. Add **evaluation reports (HTML dashboards)**
    
3. Add **dataset versioning (DVC)**
    
4. Build **Playwright + LLM combo testing**
    
    - UI + AI validation together (very powerful pitch)
        

---

If you want, I can next help you:

👉 Turn this into a **client demo project (portfolio-ready in 1 day)**  
👉 Or design a **paid offering structure (₹50k–₹3L per client range)**