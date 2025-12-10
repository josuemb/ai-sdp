# Foundation Cycle

## Purpose
Establish technical foundation through AI-assisted research, decisions, and structured planning with complete git tracking.

## MANDATORY: Project Initialization
**CRITICAL**: At the start of Foundation Cycle, follow complete initialization from `core/workflow.md`.

## MANDATORY: Context Review Requirement
**CRITICAL**: Before executing foundation cycles 1.2 and 1.3, you MUST:
- Read and review `requirements.md` (if exists) to understand project context
- Read and review `decisions-log.md` (if exists) to understand previous decisions
- Incorporate this context into the current cycle execution

## Sub-Cycles

### 0.1 Requirements Method Decision
**File**: `cycles/0.1-requirements-method-decision.md`
- **MANDATORY FIRST STEP**: Research and select requirements specification method
- Use web_search tool to research current approaches (User Stories, BDD, Use Cases, etc.)
- Use decision framework to present researched options with pros/cons
- Wait for developer selection before proceeding to requirements analysis
- **Git Commit**: `feat(requirements): select requirements specification method`

### 1.1 Requirements Analysis & Context Research
**File**: `cycles/1.1-requirements-analysis.md`
- AI-powered requirements extraction from input using chosen method
- Context research and similar problem analysis using web_search tool
- Technology feasibility assessment with current best practices
- Project scope definition with AI recommendations
- Create comprehensive requirements.md document
- **Git Commit**: `feat(requirements): complete requirements analysis and documentation`
- **MANDATORY**: Create TODO list for requirements analysis tasks (see `integrations/todo-integration.md`)

### 1.2 Architecture & Technology Stack Decisions
**File**: `cycles/1.2-architecture-decisions.md`
- AI research of architecture patterns and options using web_search tool
- Technology stack decision with multiple researched recommendations
- Database and storage decisions based on current best practices
- Security and compliance planning with industry standards
- Create architecture.md with system design and AWS diagrams
- **Git Commit**: `docs(architecture): define system architecture and technology stack`
- **MANDATORY**: Create TODO list for architecture decision tasks (see `integrations/todo-integration.md`)

### 1.3 Development Setup & Project Structure
**File**: `cycles/1.3-development-setup.md`
- **CRITICAL**: This cycle MUST execute ALL three mandatory sub-cycles in sequence
- **MANDATORY SEQUENCE**: 1.3.1 → 1.3.2 → 1.3.3 (cannot skip any)
- Development environment and tooling decisions using web_search tool
- Project structure and code organization based on current standards
- Build system and dependency management with best practices
- Development workflow and standards setup
- Create development documentation and setup guides
- **Git Commit**: `chore(setup): configure development environment and tooling`
- **MANDATORY**: Create TODO list for development setup tasks (see `integrations/todo-integration.md`)

### 1.3.1 Testing Framework Selection (MANDATORY SUB-CYCLE)
**File**: `cycles/1.3.1-testing-framework-decision.md`
- **CRITICAL**: MUST be executed as FIRST mandatory sub-cycle of 1.3
- **CANNOT SKIP**: This sub-cycle is required before proceeding to 1.3.2
- AI research of testing frameworks and strategies using web_search tool
- Unit testing, integration testing, and E2E testing framework decisions
- Testing strategy and CI/CD integration planning
- Create testing configuration and sample tests
- **Git Commit**: `chore(testing): select testing framework and configure test environment`
- **STATE UPDATE**: Mark 1.3.1 as completed before proceeding to 1.3.2

### 1.3.2 Code Quality Tools Selection (MANDATORY SUB-CYCLE)
**File**: `cycles/1.3.2-code-quality-decisions.md`
- **CRITICAL**: MUST be executed as SECOND mandatory sub-cycle of 1.3
- **PREREQUISITE**: 1.3.1 must be completed first
- **CANNOT SKIP**: This sub-cycle is required before proceeding to 1.3.3
- AI research of code quality tools and best practices using web_search tool
- Linting, formatting, static analysis, and documentation tool decisions
- Pre-commit hooks and automated quality checks setup
- Create code quality configuration and guidelines
- **Git Commit**: `chore(quality): configure code quality tools and best practices`
- **STATE UPDATE**: Mark 1.3.2 as completed before proceeding to 1.3.3

### 1.3.3 Security Best Practices Implementation (MANDATORY SUB-CYCLE)
**File**: `cycles/1.3.3-security-best-practices-decision.md`
- **CRITICAL**: MUST be executed as THIRD mandatory sub-cycle of 1.3
- **PREREQUISITE**: 1.3.1 and 1.3.2 must be completed first
- **CANNOT SKIP**: This sub-cycle is required before Foundation Cycle completion
- AI research of security tools and best practices using web_search tool
- Security scanning, secrets management, authentication decisions
- Input validation, monitoring, and incident response planning
- Create security configuration and guidelines
- **Git Commit**: `feat(security): implement security best practices and tools`
- **STATE UPDATE**: Mark 1.3.3 as completed to finish Foundation Cycle

## Overview
The Foundation Cycle establishes the technical foundation for development through AI-assisted decision-making. Each sub-cycle focuses on structured research, multiple options, recommendations, and decision logging to create a solid foundation for feature development.

## Key Deliverables
- Requirements Analysis and Context Research
- Architecture and Technology Stack Decisions
- Development Setup and Project Structure
- Complete decision audit trail in `core/decision-log.md`
- TODO lists for each sub-cycle with actionable tasks
- Decision patterns stored in knowledge base for future projects
- Foundation ready for feature development cycles

## Success Criteria
- Clear requirements and context understanding established
- All major technical decisions documented with rationales
- Architecture, technology stack, and development setup selected
- Complete decision audit trail maintained
- Foundation ready for feature development cycles

## Duration
**AI-Calculated**: Duration determined by AI using the process defined in `framework/decision-framework.md`.

**Typical Range**: 1-5 days depending on project complexity and team context

## AI Decision Points
Each sub-cycle includes multiple decision points where AI:
1. Researches available options using appropriate tools
2. Provides 1-5 recommendations with rationales
3. Marks one as RECOMMENDED with clear reasoning
4. Logs developer decisions for audit trail

## Next Phase
→ **Feature Cycles**: Iterative feature development with continuous value delivery
