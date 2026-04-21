
![[Pasted image 20260420192315.png]]
![[Pasted image 20260420192538.png]]
![[Pasted image 20260420192849.png]]

---
## AI Applications : 
![[Pasted image 20260420193010.png]]

![[Pasted image 20260420193057.png]]

![[Pasted image 20260420193308.png]]

![[Pasted image 20260420193504.png]]

---
## Basics of LLM Evaluation:
![[Pasted image 20260420194146.png]]

![[Pasted image 20260420194230.png]]

![[Pasted image 20260420194343.png]]

![[Pasted image 20260420194430.png]]

![[Pasted image 20260420194532.png]]

![[Pasted image 20260420194626.png]]

![[Pasted image 20260420194804.png]]

![[Pasted image 20260420194853.png]]

![[Pasted image 20260420195014.png]]

![[Pasted image 20260420195106.png]]

![[Pasted image 20260420195259.png]]

---

## Working with Human Based (Graded) Evaluation
![[Pasted image 20260420195448.png]]

console.anthropic.com
![[Pasted image 20260420200237.png]]

?
?
?
?
?



-------

## Understanding different Evaluation Metrics to evaluate AI Applications

![[Pasted image 20260420201553.png]]

![[Pasted image 20260420201639.png]]

![[Pasted image 20260420201740.png]]

![[Pasted image 20260420201827.png]]

![[Pasted image 20260420201924.png]]

![[Pasted image 20260420202032.png]]

---

## Different LLM libraries to Evaluate LLMs and LLM Applications

![[Pasted image 20260420202334.png]]

![[Pasted image 20260420202402.png]]

![[Pasted image 20260420202513.png]]

![[Pasted image 20260420202720.png]]

![[Pasted image 20260420202919.png]]

https://www.ragas.io/
https://deepeval.com/
https://galileo.ai/

---

Local Ollama :

## Starting Ollama with API to run as a API server
ollama serve

![[Pasted image 20260420221341.png]]

POST:
URL: http://localhost:11434/api/generate
Body:
{
  "model": "gemma4:31b-cloud",
  "prompt": "Why is the sky blue?",
  "stream": false
}

---

---

## Testing LLMs with Traditional Approach

![[Pasted image 20260420234958.png]]

![[Pasted image 20260420235205.png]]

![[Pasted image 20260420235225.png]]

![[Pasted image 20260420235303.png]]

![[Pasted image 20260420235342.png]]

![[Pasted image 20260420235501.png]]

---

## Testing/Evaluating LLMs with Non Traditional Approach

![[Pasted image 20260420235730.png]]

![[Pasted image 20260420235841.png]]

![[Pasted image 20260420235943.png]]

---

## LLMs-As-Judge while Evaluating LLMs and LLMs Based Applications

![[Pasted image 20260421000111.png]]

![[Pasted image 20260421000224.png]]

![[Pasted image 20260421000256.png]]

![[Pasted image 20260421000331.png]]

![[Pasted image 20260421000353.png]]
 ![[Pasted image 20260421000606.png]]
 
---

## Writing First DeepEval Code for AnswerRelevance
