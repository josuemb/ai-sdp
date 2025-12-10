# Development Setup & Project Structure

## MANDATORY: Project Status Updates
**CRITICAL**: Throughout this cycle, you MUST update `project-status.md`:
- **Cycle Start**: Update current phase to "Foundation Cycle 1.3 - Development Setup"
- **Environment Setup**: Update progress on development environment configuration
- **Tool Installation**: Track completion of development tools and dependencies
- **Cycle Completion**: Mark Foundation Cycle as completed, transition to Feature Development

## MANDATORY: Context Review Requirement
**CRITICAL**: Before starting this cycle, you MUST:
- Read and review `requirements.md` to understand project requirements and constraints
- Read and review `decisions-log.md` to understand requirements method and architecture decisions
- Incorporate this context into development setup decisions

## MANDATORY: TODO List Creation
**CRITICAL**: At the start of this cycle, create a TODO list using the process defined in `integrations/todo-integration.md`:

**Example TODO List Structure**:
```
Foundation Cycle 1.3 - Development Setup
[ ] Set up development environment and tooling
[ ] Create project structure and organization
[ ] Configure build system and dependency management
[ ] Establish development workflow and standards
[ ] Set up testing framework and CI/CD
[ ] Document setup instructions and procedures
```

Use `/todos view` to track progress and `/todos resume` to continue work.

## Input Sources
- System Architecture Decision with rationale
- Technology Stack Selection documentation
- Database and Storage Architecture decisions
- Security Architecture Plan

## Purpose
Establish development environment, project structure, and tooling through AI-assisted decision-making using framework/decision-framework.md process.

## Overview
Transform architecture and technology decisions into concrete development setup. Each setup decision follows the complete framework/decision-framework.md process: research, options, recommendations, and logging.

## Key Activities

### Development Environment & Tooling
**CRITICAL**: Use framework/decision-framework.md process for development tooling decisions:

**IDE/Editor Selection:**
- Research development environment options for chosen technology stack
- Consider team preferences, language support, debugging capabilities
- Evaluate extensions, plugins, and integration features

**Development Tools Decision:**
- Research build tools, package managers, task runners
- Consider automation capabilities, community support, learning curve
- Evaluate integration with chosen technology stack

# Development Setup & Project Structure

## MANDATORY: Sub-Cycle Sequence Enforcement

**CRITICAL**: This cycle MUST execute ALL three mandatory sub-cycles in the following sequence:

1. **1.3.1 Testing Framework Selection** → `cycles/1.3.1-testing-framework-decision.md`
2. **1.3.2 Code Quality Tools Selection** → `cycles/1.3.2-code-quality-decisions.md`  
3. **1.3.3 Security Best Practices Implementation** → `cycles/1.3.3-security-best-practices-decision.md`

**ENFORCEMENT RULES**:
- **Cannot skip any sub-cycle** - all three are mandatory
- **Must execute in sequence** - 1.3.1 → 1.3.2 → 1.3.3
- **State tracking required** - update .ai-sdp-state.json after each sub-cycle completion
- **Cannot proceed to Feature Cycles** until all sub-cycles are completed

## MANDATORY: Sub-Cycle Execution Logic

**STEP 1 - Check Current Sub-Cycle Status**:
```
READ .ai-sdp-state.json
CHECK foundation.setup.sub_cycles status:
  IF 1.3.1_testing.completed == false:
    EXECUTE cycles/1.3.1-testing-framework-decision.md
  ELSE IF 1.3.2_quality.completed == false:
    EXECUTE cycles/1.3.2-code-quality-decisions.md
  ELSE IF 1.3.3_security.completed == false:
    EXECUTE cycles/1.3.3-security-best-practices-decision.md
  ELSE:
    COMPLETE Development Setup cycle
```

**STEP 2 - Execute Current Sub-Cycle**:
- Follow the complete decision framework process
- Create all required deliverables
- Update state file with completion status
- Create git commit for sub-cycle completion

**STEP 3 - Validate Completion**:
- Verify all artifacts are created
- Update .ai-sdp-state.json with completed: true
- Check if all sub-cycles are completed
- If all completed, mark Development Setup as complete

## Sub-Cycle Execution Details

### 1.3.1 Testing Framework Selection (MANDATORY FIRST)
**File**: `cycles/1.3.1-testing-framework-decision.md`
- **PREREQUISITE**: Architecture decisions must be completed
- **EXECUTION**: Follow complete decision framework with web research
- **DELIVERABLES**: Testing framework selection, configuration, sample tests
- **STATE UPDATE**: Set foundation.setup.sub_cycles.1.3.1_testing.completed = true
- **GIT COMMIT**: `chore(testing): select testing framework and configure test environment`

### 1.3.2 Code Quality Tools Selection (MANDATORY SECOND)  
**File**: `cycles/1.3.2-code-quality-decisions.md`
- **PREREQUISITE**: 1.3.1 must be completed first
- **EXECUTION**: Follow complete decision framework with web research
- **DELIVERABLES**: Code quality tools, linting config, formatting setup
- **STATE UPDATE**: Set foundation.setup.sub_cycles.1.3.2_quality.completed = true
- **GIT COMMIT**: `chore(quality): configure code quality tools and best practices`

### 1.3.3 Security Best Practices Implementation (MANDATORY THIRD)
**File**: `cycles/1.3.3-security-best-practices-decision.md`
- **PREREQUISITE**: 1.3.1 and 1.3.2 must be completed first
- **EXECUTION**: Follow complete decision framework with web research
- **DELIVERABLES**: Security tools, guidelines, monitoring setup
- **STATE UPDATE**: Set foundation.setup.sub_cycles.1.3.3_security.completed = true
- **GIT COMMIT**: `feat(security): implement security best practices and tools`

### Project Structure & Code Organization
**CRITICAL**: Use framework/decision-framework.md process for project organization:

**Directory Structure Decision:**
- Research project structure patterns for chosen technology stack
- Consider scalability, maintainability, team collaboration
- Evaluate industry standards and framework conventions

**Module/Package Architecture:**
- Research code organization patterns and best practices
- Consider separation of concerns, dependency management
- Evaluate maintainability and testing implications

**Configuration Management:**
- Research configuration management approaches
- Consider environment-specific settings, secrets management
- Evaluate deployment and operational requirements

### Build System & Dependency Management
**CRITICAL**: Use framework/decision-framework.md process for build configuration:

**Build System Selection:**
- Research build tools and automation options
- Consider compilation, bundling, optimization requirements
- Evaluate development workflow and deployment integration

**Dependency Management Strategy:**
- Research package management and versioning approaches
- Consider security, stability, and update strategies
- Evaluate lock files, vulnerability scanning, license compliance

### Development Workflow & Standards
**CRITICAL**: Use framework/decision-framework.md process for workflow decisions:

**Version Control Workflow:**
- Research branching strategies and collaboration patterns
- Consider team size, release frequency, code review processes
- Evaluate Git workflows, merge strategies, conflict resolution

**Code Quality Standards:**
- Research linting, formatting, and quality tools
- Consider code style guides, automated checks, pre-commit hooks
- Evaluate static analysis, security scanning, performance monitoring

**Local Development Setup:**
- Research containerization vs local installation approaches
- Consider Docker, virtual environments, development databases
- Evaluate consistency, onboarding, and debugging capabilities

## Deliverables
- Development Environment Configuration
- Project Structure and Organization Standards
- Build System and Dependency Management Setup
- Development Workflow and Quality Standards
- Local Development Environment Documentation
- Complete Decision Log entries for all setup decisions

## AI Decision Assistant Usage

**For EVERY development setup decision:**
1. **Context Research**: Use appropriate tools based on technology stack and setup type
2. **Generate Options**: Provide multiple approaches with trade-offs
3. **Recommend**: Mark best option based on project and team context
4. **Log Decision**: Record in core/decision-log.md with implementation details

**Dynamic Research Tool Selection:**
AI selects optimal research tools based on setup context:
- **Development Best Practices**: Web search, community standards
- **Project Examples**: GitHub research, configuration templates
- **Tool Documentation**: Technical documentation, framework guides
- **AWS Development Tools**: AWS documentation (if using AWS services)

**Let AI determine setup complexity based on:**
- Project size and team structure
- Technology stack requirements and constraints
- Development timeline and resource availability
- Maintenance and operational considerations
