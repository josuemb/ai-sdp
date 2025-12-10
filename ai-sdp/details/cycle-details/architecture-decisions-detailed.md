# Architecture & Technology Stack Decisions

## MANDATORY: Project Status Updates
**CRITICAL**: Throughout this cycle, you MUST update `project-status.md`:
- **Cycle Start**: Update current phase to "Foundation Cycle 1.2 - Architecture Decisions"
- **Technology Decisions**: Update technology stack section with selected/evaluated technologies
- **Document Creation**: Add architecture.md to deliverables when completed
- **Diagram Creation**: Update deliverables when AWS diagrams are generated
- **Cycle Completion**: Mark phase as completed and set next phase to Development Setup

## MANDATORY: Context Review Requirement
**CRITICAL**: Before starting this cycle, you MUST:
- Read and review `requirements.md` to understand project requirements and constraints
- Read and review `decisions-log.md` to understand requirements specification method and previous decisions
- Incorporate this context into architecture decisions

## MANDATORY: TODO List Creation
**CRITICAL**: At the start of this cycle, create a TODO list using the process defined in `integrations/todo-integration.md`:

**Example TODO List Structure**:
```
Foundation Cycle 1.2 - Architecture Decisions
[ ] Research architecture patterns for [project type]
[ ] Evaluate technology stack options
[ ] Make database and storage decisions
[ ] Plan security and compliance approach
[ ] Document architecture decisions with rationales
[ ] Update decision log with technology choices
```

Use `/todos view` to track progress and `/todos resume` to continue work.

## Input Sources
- Structured Requirements Document
- Context Research Summary
- Technology Feasibility Assessment
- MVP Scope Definition

## Purpose
Make informed architecture and technology decisions through AI-powered research using the framework/decision-framework.md process for every technical choice.

## Overview
Transform requirements into technical architecture through structured AI-assisted decision-making. Each technical decision follows the complete framework/decision-framework.md process: research, options, recommendations, and logging.

## Key Activities

### Architecture Documentation Strategy
**CRITICAL**: Use the AI Decision Assistant process defined in `framework/decision-framework.md` to research and decide on architecture documentation approach:
- Research current architecture documentation methods and tools
- Consider visual diagrams, written documentation, and interactive formats
- Evaluate tools like AWS Diagram MCP Server, C4 Model, UML, ArchiMate, Mermaid
- Present options for documenting system architecture, component relationships, and data flows
- Let developer choose documentation approach based on project needs and team preferences
- **MANDATORY OUTCOME**: Must result in creation of dedicated `architecture.md` document (see Deliverables section)

### System Architecture Decision
**CRITICAL**: Use the AI Decision Assistant process defined in `framework/decision-framework.md` to research and decide on system architecture approach based on specific project context, requirements, and constraints.

### Technology Stack Selection
**CRITICAL**: Use the AI Decision Assistant process defined in `framework/decision-framework.md` for each technology choice:
- Programming Language Decision
- Framework Selection  
- Database Technology Decision

### Infrastructure & Deployment Strategy
**CRITICAL**: Use the AI Decision Assistant process defined in `framework/decision-framework.md` to determine deployment approach.

### Security Architecture Planning
**CRITICAL**: Use the AI Decision Assistant process defined in `framework/decision-framework.md` for security decisions.

## Deliverables
- **Architecture Documentation Strategy** - Chosen approach for documenting system architecture
- **architecture.md** - Dedicated architecture document with visual diagrams and system design
- **System Architecture Documentation** - Visual diagrams created using AWS Diagram MCP Server when applicable
- System Architecture Decision with complete rationale
- Technology Stack Selection with research backing
- Database and Storage Architecture decisions
- Security Architecture Plan with implementation approach
- Infrastructure Deployment Strategy
- Complete Decision Log entries for all major technical choices

## MANDATORY: Architecture Document Creation

**CRITICAL**: After completing all architecture decisions, you MUST create a dedicated `architecture.md` document that includes:

### Required Architecture Document Structure:
```markdown
# System Architecture

## Overview
- System purpose and scope
- Key architectural principles
- High-level system description

## Architecture Decisions Summary
- Reference to decisions made in decisions-log.md
- Key technology choices with rationales
- Architecture pattern selected

## System Architecture
- Component diagram (use AWS Diagram MCP Server if applicable)
- System boundaries and interfaces
- Data flow diagrams
- Integration points

## Technology Stack
- Programming languages and frameworks
- Database and storage solutions
- Infrastructure and deployment tools
- Third-party services and APIs

## Component Design
- Module/component breakdown
- Responsibilities and interfaces
- Communication patterns
- State management approach

## Data Architecture
- Data models and schemas
- Storage strategy
- Data flow and processing
- Backup and recovery approach

## Security Architecture
- Authentication and authorization
- Data protection measures
- Security boundaries
- Compliance considerations

## Deployment Architecture
- Environment strategy
- Infrastructure requirements
- Deployment pipeline
- Monitoring and logging

## Quality Attributes
- Performance requirements
- Scalability considerations
- Reliability and availability
- Maintainability factors
```

### MANDATORY: AWS Diagram Creation
**CRITICAL**: When creating architecture.md, you MUST create visual diagrams using the AWS Diagram MCP Server:

**Required Diagram Creation Process**:
1. **Use AWS Diagram MCP Server**: Always use `@awslabs.aws-diagram-mcp-server` tools first
2. **Create System Architecture Diagram**: Generate high-level system component diagram
3. **Create Data Flow Diagram**: Show data movement between components
4. **Create Deployment Diagram**: Illustrate infrastructure and deployment architecture
5. **Embed Diagrams**: Include all generated diagrams in architecture.md document
6. **Fallback Only**: Use text-based diagrams (Mermaid, ASCII) only if AWS Diagram MCP Server cannot handle the specific project type

**AWS Diagram Integration Steps**:
```markdown
1. Call AWS diagram tools to create architecture diagrams
2. Save generated diagrams to project directory
3. Reference diagrams in architecture.md with proper paths
4. Include diagram descriptions and explanations
```

**Note**: The AWS Diagram MCP Server may block execution during diagram generation - this is expected behavior for complex diagrams.

## AI Decision Assistant Usage

**For EVERY technical decision:** Follow the complete process defined in `framework/decision-framework.md`.
