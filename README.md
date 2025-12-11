# AI-SDP Agent for Kiro CLI

AI-Assisted Software Development Process agent that guides you through structured development cycles with web research, collaborative decision-making, and comprehensive project tracking.

This is a [custom agent](https://kiro.dev/docs/cli/custom-agents/) for Kiro CLI that provides specialized functionality for software development workflows.

## Prerequisites

- **Kiro CLI**: [Installation Guide](https://kiro.dev/docs/cli/installation/)
- **curl**: Required for remote installation (pre-installed on most systems)
- **Supported OS**: macOS, Linux, Windows Subsystem for Linux
- **uv/uvx**: Required for MCP servers - [Installation Guide](https://docs.astral.sh/uv/getting-started/installation/)

## Installation

### Global Installation (Recommended)
```bash
curl -sSL https://raw.githubusercontent.com/josuemb/ai-sdp/main/install.sh | bash
```

### Local Installation (Project-specific)
```bash
curl -sSL https://raw.githubusercontent.com/josuemb/ai-sdp/main/install.sh | bash -s -- --local
```

### Custom Path Installation
```bash
curl -sSL https://raw.githubusercontent.com/josuemb/ai-sdp/main/install.sh | bash -s -- /path/to/custom/agents
```

### Installation Help
```bash
curl -sSL https://raw.githubusercontent.com/josuemb/ai-sdp/main/install.sh | bash -s -- --help
```

## Agent Features

### 🏗️ Structured Development Process
- **Foundation Cycles**: Complete project initialization with requirements analysis, architecture decisions, and development setup
- **Feature Cycles**: Iterative feature development with mandatory testing and validation
- **State Management**: Automatic progress tracking through development phases with checkpoint system
- **Sequential Enforcement**: Prevents skipping cycles, ensures proper development flow

### 🔍 Intelligent Research & Decision Making
- **Web Research Integration**: Real-time technology research using `web_search` and `web_fetch` tools
- **AI Decision Framework**: Presents 3-5 researched alternatives for every technical decision
- **Collaborative Decision Making**: Requires explicit developer choice, never makes autonomous decisions
- **Decision Logging**: Comprehensive tracking of all decisions with reasoning and context

### ☁️ AWS Cloud Integration
- **AWS Documentation Access**: Real-time access to AWS knowledge base and documentation
- **Architecture Diagram Generation**: Automated AWS architecture diagram creation
- **Regional Availability Checking**: Validates AWS service availability across regions
- **Cloud Best Practices**: Integrated AWS development and deployment guidance

### 📋 Comprehensive Project Management
- **TODO List Integration**: Automatic task breakdown and progress tracking
- **Git Workflow Automation**: Structured commit messages and repository management
- **Project Status Dashboard**: Real-time project health and progress monitoring
- **Requirements Documentation**: Automated requirements.md and decisions-log.md generation

### 🧪 Testing & Quality Assurance
- **Mandatory Testing Requirements**: Every feature cycle includes automated test implementation
- **Coverage Validation**: Test coverage threshold management and validation
- **Testing Framework Selection**: Guided selection of unit, integration, and e2e testing tools
- **Quality Gates**: All tests must pass before deployment approval

### 🔒 Security & Best Practices
- **Security Framework Integration**: Built-in security best practices and tool selection
- **Code Quality Tools**: Automated selection and configuration of linting, formatting tools
- **Vulnerability Assessment**: Security scanning and best practice validation
- **Compliance Checking**: Ensures adherence to security standards throughout development

### 📊 Advanced Development Cycles

#### Foundation Cycle (Phases 0-1.3)
- **0.1 Requirements Method Decision**: Research-driven selection of requirements specification approach
- **1.1 Requirements Analysis**: Comprehensive project requirements capture and documentation
- **1.2 Architecture Decisions**: Technology stack, patterns, and architectural choices
- **1.3 Development Setup**: Complete development environment configuration
  - **1.3.1 Testing Framework**: Unit, integration, and e2e testing tool selection
  - **1.3.2 Code Quality Tools**: Linting, formatting, and code analysis setup
  - **1.3.3 Security Best Practices**: Security tools and practices implementation

#### Feature Development Cycles
- **Feature Planning**: Requirements analysis and technical design
- **Implementation**: Code development with real-time guidance
- **Testing**: Automated test creation and validation
- **Documentation**: Feature documentation and API updates
- **Deployment**: Deployment strategy and rollback planning

### 🤖 AI-Powered Capabilities
- **Context-Aware Guidance**: Understands project history and current state
- **Technology Research**: Current year technology trends and best practices
- **Automated Documentation**: Generates and maintains project documentation
- **Progress Validation**: Ensures completion of required steps before advancement

### 🔧 Tool Integration & Automation
- **File System Operations**: Complete project file management and organization
- **Shell Command Execution**: Automated setup and configuration commands
- **MCP Server Integration**: Extensible tool ecosystem through Model Context Protocol
- **Web Information Retrieval**: Real-time access to current technology information

### 📈 Continuous Improvement
- **Feedback Loops**: Continuous validation and improvement suggestions
- **Best Practice Updates**: Integration of latest development methodologies
- **Performance Monitoring**: Project health and development velocity tracking
- **Knowledge Base**: Persistent learning from project decisions and outcomes

## Usage

### Start AI-SDP Agent
```bash
kiro-cli chat --agent ai-sdp
```

### Basic Workflow
1. **Project Initialization**: Agent captures your requirements
2. **Foundation Cycles**: Complete requirements, architecture, and setup
3. **Feature Development**: Iterative feature cycles with testing
4. **Continuous Value**: Ongoing development and maintenance

### Example Commands
```bash
# Start new project
"I want to build a web application for task management"

# Continue existing project
"Continue with the next development cycle"

# Get project status
"Show me the current project status"
```

## Agent Configuration

The agent includes:
- **Built-in Tools**: File operations, bash execution, web search
- **MCP Servers**: AWS tools and diagram generation
- **Auto-approved Tools**: Pre-configured permissions for seamless workflow

### File Structure After Installation

**Global Installation:**
```
~/.kiro/agents/
├── ai-sdp.json          # Agent configuration
└── ai-sdp/              # Supporting files
    ├── prompt.md         # Main agent prompt
    ├── core/             # Core workflow files
    ├── cycles/           # Development cycle definitions
    ├── framework/        # Decision framework
    ├── integrations/     # Tool integrations
    └── details/          # Additional documentation
```

**Local Installation (Project-specific):**
```
.kiro/agents/
├── ai-sdp.json          # Agent configuration
└── ai-sdp/              # Supporting files
    ├── prompt.md         # Main agent prompt
    ├── core/             # Core workflow files
    ├── cycles/           # Development cycle definitions
    ├── framework/        # Decision framework
    ├── integrations/     # Tool integrations
    └── details/          # Additional documentation
```

## Troubleshooting

### Verify Installation
```bash
# Check if agent is installed
kiro-cli agent

# Verify files exist (global)
ls ~/.kiro/agents/ai-sdp.json

# Verify files exist (local)
ls .kiro/agents/ai-sdp.json
```

### MCP Server Issues
- Ensure uv/uvx is installed and accessible in PATH
- Check network connectivity for package downloads
- Verify uvx can run: `uvx --version`
- Review Kiro CLI logs for MCP server errors

### Permission Issues
- Agent pre-approves most tools
- Web search requires initial permission approval
- Use `kiro-cli settings` to configure tool permissions

## Advanced Features

### Local vs Global Installation
- **Global**: Available from any directory
- **Local**: Project-specific, takes precedence over global
- **Precedence**: Local agents override global agents with same name

### Customization
- Modify `ai-sdp.json` for tool permissions
- Edit prompt files in `ai-sdp/` directory
- Add custom MCP servers or tools

## Support

- **Documentation**: [Kiro CLI Docs](https://github.com/aws/kiro-cli)
- **Issues**: Use `/issue` command in Kiro CLI
- **Reinstallation**: Re-run installation command to get latest version

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
