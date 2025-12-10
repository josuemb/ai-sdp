# Feature Cycle

## MANDATORY: Project Status Updates
**CRITICAL**: Throughout each feature cycle, you MUST update `project-status.md`:
- **Cycle Start**: Update current phase to "Feature Cycle X: [Feature Name]"
- **Feature Progress**: Update feature implementation status and completion percentage
- **Code Creation**: Add implemented components to deliverables section
- **Testing**: Update testing status and results
- **Cycle Completion**: Mark feature as completed, update metrics, set next feature

## Purpose
Deliver specific features with user value through AI-assisted development and continuous feedback integration.

## MANDATORY: Context Review Requirement
**CRITICAL**: Before executing ANY feature cycle sub-cycle, you MUST:
- Read and review `requirements.md` to understand project context and constraints
- Read and review `decisions-log.md` to understand previous architectural and setup decisions
- Read and review `.ai-sdp-state.json` to understand current project state
- Incorporate this context into the feature development process

## Sub-Cycles

### 2.1, 3.1, 4.1... Feature Planning & Research
- AI-powered feature breakdown and task analysis
- Research of implementation approaches and patterns
- Dependency analysis and integration planning
- Effort estimation with AI assistance
- **MANDATORY**: Create TODO list for feature planning tasks (see `integrations/todo-integration.md`)

### 2.2, 3.2, 4.2... Development & Implementation
- AI-assisted code generation and development
- Implementation decision-making with research
- Code organization and architecture decisions
- Integration with existing codebase
- **MANDATORY**: Create TODO list for development implementation tasks (see `integrations/todo-integration.md`)

### 2.3, 3.3, 4.3... Testing & Quality Assurance
**MANDATORY TEST IMPLEMENTATION**:
- **CRITICAL**: Every feature MUST have automated tests before deployment
- **Unit Tests**: Test individual functions and components
- **Integration Tests**: Test feature integration with existing system
- **End-to-End Tests**: Test complete user workflows

**MANDATORY TEST COVERAGE VALIDATION**:
- **Coverage Threshold Decision**: Use `framework/decision-framework.md` to research and decide minimum coverage percentage (typically 70-90%)
- **Coverage Tools Decision**: Use `framework/decision-framework.md` to select coverage measurement tools
- **ENFORCEMENT**: Feature cannot proceed to deployment without meeting coverage threshold
- **VALIDATION**: Generate coverage report and verify threshold compliance

**Testing Process**:
- AI-generated comprehensive test suites
- Quality assurance validation and code review
- Performance testing and optimization
- Security testing and vulnerability assessment
- **Coverage Report Generation**: Create detailed coverage analysis
- **MANDATORY**: Create TODO list for testing and QA tasks (see `integrations/todo-integration.md`)

### 2.4, 3.4, 4.4... Deployment & Feedback Integration
**MANDATORY PRE-DEPLOYMENT VALIDATION**:
- **Test Execution**: All automated tests must pass
- **Coverage Verification**: Coverage report must meet established threshold
- **BLOCKER**: Cannot deploy if tests fail or coverage is below threshold

**Deployment Process**:
- Automated deployment to production
- User feedback collection and analysis
- Performance monitoring and optimization
- **Next cycle planning based on feedback** (see "Next Cycle Planning" section)
- **Present 3-5 specific next feature options** with rationales and priorities
- **MANDATORY**: Create TODO list for deployment and feedback tasks (see `integrations/todo-integration.md`)

## Overview
Feature Cycles are repeatable iterations that deliver specific user value. Each cycle builds on the foundation and previous features, with AI assistance for research, implementation, and decision-making throughout.

## Key Deliverables
- Working feature integrated with existing system
- **MANDATORY**: Comprehensive automated test suite with verified coverage
- **MANDATORY**: Test coverage report meeting established threshold
- Updated documentation and decision log
- TODO lists completed for feature development tasks
- User feedback analysis and insights
- Performance metrics and monitoring data

## Success Criteria
- Feature delivers measurable user value
- All implementation decisions documented with rationales
- **MANDATORY**: Automated tests implemented with coverage meeting threshold
- **MANDATORY**: All tests pass before deployment
- Feature successfully deployed to production
- User feedback collected and analyzed for next cycle

## Duration
**AI-Calculated**: Duration determined by AI using the process defined in `framework/decision-framework.md`.

## AI Decision Points
Each sub-cycle includes decision points where AI follows the process defined in `framework/decision-framework.md`:
1. Researches implementation approaches and best practices
2. Provides multiple options with trade-off analysis
3. Recommends optimal approach based on context
4. Logs all decisions for project audit trail

## Continuous Improvement
Each feature cycle incorporates learnings from previous cycles:
- AI recommendations improve based on project context
- Decision patterns become more refined
- Development velocity increases over time
- Quality metrics guide process optimization

## Next Cycle Planning

**MANDATORY**: At the end of each feature cycle, you MUST:

### 1. Analyze Current Cycle Results
- Review user feedback and usage metrics
- Assess feature performance and adoption
- Identify gaps or improvement opportunities
- Document lessons learned in `decisions-log.md`

### 2. Suggest Next Feature Cycles
**Present 3-5 specific next feature options with:**
- **Feature Name & Description**
- **User Value Proposition** 
- **Technical Complexity** (Low/Medium/High)
- **Dependencies** on current features
- **Estimated Duration** using `framework/decision-framework.md`
- **Priority Rationale** based on feedback and roadmap

### 3. Decision Framework Application
Use `framework/decision-framework.md` to:
- Research similar features and implementation approaches
- Present options with trade-off analysis
- Mark RECOMMENDED next feature with clear reasoning
- Log the next cycle decision in `decisions-log.md`

### 4. State Management Update
Update `.ai-sdp-state.json` with:
- Current cycle completion status
- Next cycle selection and rationale
- Updated project roadmap priorities

## Next Cycle
→ **Next Feature Cycle**: Continue iterative development based on user feedback and roadmap priorities
