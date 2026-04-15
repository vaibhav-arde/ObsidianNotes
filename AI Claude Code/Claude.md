## Claude Installation

**Time to get Claude Code set up locally!**

Full setup directions can be found here: [https://code.claude.com/docs/en/quickstart](https://code.claude.com/docs/en/quickstart)

In short, you'll need to do the following:

1. `Install Claude Code`
    1. `` MacOS (Homebrew): `brew install --cask claude-code` ``
    2. MacOS, Linux, WSL: `curl -fsSL https://claude.ai/install.sh | bash`
    3. Windows CMD: `curl -fsSL https://claude.ai/install.cmd -o install.cmd && install.cmd && del install.cmd`
2. After installation, run `claude` at your terminal. The first time you run this command you will be prompted to authenticate

If you're making use of AWS Bedrock or Google Cloud Vertex, there is some additional setup:

- Special directions for AWS Bedrock: [https://code.claude.com/docs/en/amazon-bedrock](https://code.claude.com/docs/en/amazon-bedrock)
- Special directions for Google Cloud Vertex: [https://code.claude.com/docs/en/google-vertex-ai](https://code.claude.com/docs/en/google-vertex-ai)
---
---

## Ollama Setup

Download Ollama as given in docs: https://docs.ollama.com/
For now we can go ahead with cloud model as they dont consume our RAM. : https://docs.ollama.com/cloud

For Claude code we can go ahead with below docs: https://docs.ollama.com/integrations/claude-code

Setup any claud LLM from below as per given in above docs:
#### Recommended Models
- `qwen3-coder`
- `glm-4.7`
- `gpt-oss:20b`
- `gpt-oss:120b`

Then open a folder where you want to code or your project is available, 
Then open that in terminal
Then run below command as per docs:
```code 
ollama launch claude --config
```

---

# Claude : three types of files

![[Screenshot 2026-03-09 at 8.25.08 PM.png]]

- # \# : Use it for memory 
- # Use `@+file path` to specify exact file
- ![[Pasted image 20260309204755.png]]
- **Planning mode** with `Shift + Tab` twice:  this is when we have wide plan or scope to plan the things
- **Thinking mode** is when we have a particular complex task to do 
- ![[Pasted image 20260309205805.png]]
- ![[Pasted image 20260309210151.png]]
- # /compact : clear conversation history but keep summary
- # /clear : this clear all context
- ![[Pasted image 20260309210600.png]]
---
# Custom Commands

Claude Code comes with built-in commands that you can access by typing a forward slash, but you can also create your own custom commands to automate repetitive tasks you run frequently.

## Creating Custom Commands

To create a custom command, you need to set up a specific folder structure in your project:

1. Find the `.claude` folder in your project directory
2. Create a new directory called `commands` inside it
3. Create a new markdown file with your desired command name (like `audit.md`)

The filename becomes your command name - so `audit.md` creates the `/audit` command.

## Example: Audit Command

Here's a practical example of a custom command that audits project dependencies for vulnerabilities:

This audit command does three things:

1. Runs `npm audit` to find vulnerable installed packages
2. Runs `npm audit fix` to apply updates
3. Runs tests to verify the updates didn't break anything

After creating your command file, you must restart Claude Code for it to recognize the new command.

## Commands with Arguments

Custom commands can accept arguments using the `$ARGUMENTS` placeholder. This makes them much more flexible and reusable.

For example, a `write_tests.md` command might contain:

```
Write comprehensive tests for: $ARGUMENTS

Testing conventions:
* Use Vitests with React Testing Library
* Place test files in a __tests__ directory in the same folder as the source file
* Name test files as [filename].test.ts(x)
* Use @/ prefix for imports

Coverage:
* Test happy paths
* Test edge cases
* Test error states
```

You can then run this command with a file path:

`/write_tests the use-auth.ts file in the hooks directory` 

The arguments don't have to be file paths - they can be any string you want to pass to give Claude context and direction for the task.

## Key Benefits

- **Automation** - Turn repetitive workflows into single commands
- **Consistency** - Ensure the same steps are followed every time
- **Context** - Provide Claude with specific instructions and conventions for your project
- **Flexibility** - Use arguments to make commands work with different inputs

Custom commands are particularly useful for project-specific workflows like running test suites, deploying code, or generating boilerplate following your team's conventions.

---
---
# Adding MCP to Claude

You can extend Claude Code's capabilities by adding MCP (Model Context Protocol) servers. These servers run either remotely or locally on your machine and provide Claude with new tools and abilities it wouldn't normally have.

One of the most popular MCP servers is Playwright, which gives Claude the ability to control a web browser. This opens up powerful possibilities for web development workflows.

## Installing the Playwright MCP Server

To add the Playwright server to Claude Code, run this command in your terminal (not inside Claude Code):

```
claude mcp add playwright npx @playwright/mcp@latest
```

This command does two things:

- Names the MCP server "playwright"
- Provides the command that starts the server locally on your machine

## Managing Permissions

When you first use MCP server tools, Claude will ask for permission each time. If you get tired of these permission prompts, you can pre-approve the server by editing your settings.

Open the `.claude/settings.local.json` file and add the server to the allow array:

```
{
  "permissions": {
    "allow": ["mcp__playwright"],
    "deny": []
  }
}
```

Note the double underscores in `mcp__playwright`. This allows Claude to use the Playwright tools without asking for permission every time.

## Practical Example: Improving Component Generation

Here's a real-world example of how the Playwright MCP server can improve your development workflow. Instead of manually testing and tweaking prompts, you can have Claude:

1. Open a browser and navigate to your application
2. Generate a test component
3. Analyze the visual styling and code quality
4. Update the generation prompt based on what it observes
5. Test the improved prompt with a new component

For instance, you might ask Claude to:

> "Navigate to localhost:3000, generate a basic component, review the styling, and update the generation prompt at @src/lib/prompts/generation.tsx to produce better components going forward."

Claude will use the browser tools to interact with your app, examine the generated output, and then modify your prompt file to encourage more original and creative designs.

## Results and Benefits

In practice, this approach can lead to significantly better results. Instead of generic purple-to-blue gradients and standard Tailwind patterns, Claude might update prompts to encourage:

- Warm sunset gradients (orange-to-pink-to-purple)
- Ocean depth themes (teal-to-emerald-to-cyan)
- Asymmetric designs and overlapping elements
- Creative spacing and unconventional layouts

The key advantage is that Claude can see the actual visual output, not just the code, which allows it to make much more informed decisions about styling improvements.

## Exploring Other MCP Servers

Playwright is just one example of what's possible with MCP servers. The ecosystem includes servers for:

- Database interactions
- API testing and monitoring
- File system operations
- Cloud service integrations
- Development tool automation

Consider exploring MCP servers that align with your specific development needs. They can transform Claude from a code assistant into a comprehensive development partner that can interact with your entire toolchain.

---
---


