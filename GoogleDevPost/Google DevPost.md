## Project categories

#### Theme

- Build (Net-New Agents)
- Optimize (Existing Agents)
- Refactor for Google Cloud Marketplace & Gemini Enterprise

---
## Criteria

Technical Implementation (30%)
![[Pasted image 20260427190423.png]]

Business Case (30%)
![[Pasted image 20260427190441.png]]

Innovation & Creativity (20%)
![[Pasted image 20260427190455.png]]

Demo and Presentation (20%)
![[Pasted image 20260427190513.png]]

---

# Additional details

**_Examples_**

To help visualize what you can build for the challenge, imagine tackling complex, multi-step workflows, some where multiple specialized agents collaborate.

- To improve hiring practices, you could build an Automated Talent Sourcing Agent that screens inbound resumes against open roles, utilizes internal knowledge bases to evaluate candidate experience against company hiring rubrics, and dynamically generates tailored technical interview questions.
- If your focus is IT, you might architect an IT Incident Resolution System that triages backend alerts, queries historical tickets via RAG, and safely runs diagnostics to propose automated fixes.
- Or, you could reinvent logistics with a Dynamic Supply Chain Predictor that monitors real-world weather events and cross-references them with internal inventory data to proactively alert affected clients. These examples illustrate the ultimate goal of the competition: leveraging Gemini Enterprise Agent Platform to move beyond simple chatbots and engineer scalable, production-ready systems that take meaningful action.

_Let’s take a look at a specific example across all three tracks:_

  

**The Concept:** A Smart Facility Energy Agent, a multi-agent system designed to help commercial property managers dynamically optimize their building's energy consumption based on occupancy, weather forecasts, and grid pricing.

### **_Track 1_**

_Build (Net-New Agents): Move from a blank canvas to a functional prototype that connects to external tools and executes tasks autonomously._

- The Build: The startup uses the Agent Development Kit (ADK) to build the core orchestration engine. The agent utilizes the Model Context Protocol (MCP) to securely connect to the building's existing IoT HVAC sensors and real-time local weather APIs.
- The Action: Instead of just reporting data, the agent moves from static code to declarative intent. It autonomously lowers heating in unoccupied conference rooms based on scheduled calendar data.

### _Track 2_

_Optimize (Existing Agents): Take an agent that works in a sandbox and apply rigorous engineering discipline to make it handle real-world edge cases._ 

- The Action: The agent works well on a normal day, but struggles when a sudden extreme weather event occurs at the same time a utility provider issues a peak-demand pricing surge.
- The Build: The team uses Agent Simulation to generate synthetic user interactions and test the agent against these rare, multi-variable events in a controlled environment. By leveraging Agent Observability, the startup can visually trace the agent's complex reasoning to debug stalled logic where the agent couldn't decide whether to prioritize occupant comfort or energy cost. They then use Agent Optimizer to programmatically refine the system instructions to handle the conflict.

### _Track 3_

_Refactor (Marketplace & Enterprise Ready): Transform the functional MVP into a scalable, monetizable asset ready for the Google Cloud ecosystem._ 

- The Build: The startup refactors the agent to run natively on Google Cloud infrastructure, deploying it via Cloud Run or Google Kubernetes Engine (GKE) to ensure effortless scale. They ensure the underlying reasoning engine is exclusively powered by Gemini. To guarantee the agent is secure by design, they implement Agent Identity to assign a unique cryptographic ID to the agent. The team implements the Agent-to-Agent (A2A) protocol. This allows their Energy Agent to seamlessly communicate with a company's internal HR Agent to anticipate building occupancy spikes during all-hands meetings and pre-cool the building during off-peak hours.

**_Additional Information for Track 3_**

To successfully refactor your agent for this track, your final build must migrate to and meet the following architectural mandates:

- B2B Focus: The agent's core function must solve a clear business-to-business (B2B) challenge.
- Cloud-Native Runtime: You must migrate the agent’s runtime natively to Google Cloud infrastructure (e.g., deployed via Google Kubernetes Engine (GKE) or Cloud Run).
- Google Cloud Powered Intelligence: The underlying reasoning engine must be swapped to or currently running on Gemini, or a third-party LLM deployed exclusively through Agent Platform.
- A2A Interoperability: Your agent’s communication layer must utilize the Agent-to-Agent (A2A) protocol, ensuring it can be seamlessly discovered by and coordinate with other enterprise agents.

### **_Key Considerations for Participants_**

- Focus on the design and orchestration of interactions between multiple agents using the Agent Development Kit.
- Focus on the deployment of your multi-agent system on Agent Engine.
- Clearly articulate a compelling business use case for your multi-agent solution.
- Strategically employ Grounding (using Vertex AI Search, Google Search, Google Maps, private data) and RAG (with Vertex AI Search or custom implementations) to enhance the knowledge and reliability of individual agents within the system.
- Clearly demonstrate how the collaboration between agents, enhanced by effective grounding and retrieval, leads to a more powerful and capable solution than a single agent could achieve.

### **_Mandatory Technologies_**

Your project must be built using Google’s agent platform specifically incorporating:

- Intelligence: The Gemini API or a third-party LLM deployed exclusively through Agent Platform.
- Orchestration: The newly launched Agent Development Kit (ADK) or a supported open-source framework (e.g., LangChain, CrewAI) managed on our platform.
- Infrastructure: Google Cloud deployment (e.g., Cloud Run or GKE).

### _Resources_

- [ADK](https://adk.dev/)
- [The Complete Resource Guide](https://services.google.com/fh/files/misc/ai_agents_challenge_designed_guide.pdf)

### ﻿_Official Rules_

_The official rules can be found_ [**_here_**](https://s3.amazonaws.com/devpost-public/Google/DfT/Google%20for%20Startups%20AI%20Agents%20Challenge%20Rules.pdf)**_._**

### **_Additional Questions_**

For any additional questions, please email dani@devpost.com or please click the blue question mark on the bottom right side of the page.