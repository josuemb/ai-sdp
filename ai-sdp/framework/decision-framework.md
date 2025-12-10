# AI Decision Assistant Framework

## Overview

The AI Decision Assistant provides structured decision-making support for every technical choice in the development cycle. It researches options, provides recommendations, and maintains an audit trail of all decisions.

## Decision Process Flow

### 1. Context Research
**AI MUST research using web_search tool in this priority order:**
- **Get current year first**: Use `date +%Y` command to get current year for research
- AWS documentation and tools (if AWS-specific problem)
- **Current best practices using web_search tool** (REQUIRED for all decisions)
- Technical documentation and standards
- Similar problem patterns and solutions
- Recent industry trends and emerging approaches

**Research Context Includes:**
- Problem description and requirements
- Developer intent and goals
- **Current industry standards and best practices** (researched with current year, not assumed)
- Similar problems and proven solutions
- **Recent developments and new methodologies** (using current year in search terms)

**CRITICAL**: Never use pre-defined or hardcoded options. Always research current approaches first.

**MANDATORY**: Before any web research, execute `date +%Y` to get current year and include it in search terms.

### 2. Generate Options (1-5 suggestions)
**For each option, provide:**
- **Solution Name**: Clear, descriptive name
- **Rationale**: Why this approach fits the context (use thinking tool for complex analysis)
- **Source**: Reference Name - URL where the recommendation comes from
- **Pros/Cons**: Key advantages and trade-offs with transparent reasoning
- **Implementation**: Brief overview of approach

**CRITICAL**: All sources must include both reference name and COMPLETE URL in format "Reference Name - https://complete-url-path"

### 3. Recommendation
**Mark one option as RECOMMENDED with:**
- **Transparent reasoning** using thinking tool for complex decisions
- **Clear rationale** explaining why it's the best choice for this specific context
- **Alignment justification** showing how it fits project context and constraints
- **Industry standard considerations** and best practice alignment
- **Risk/benefit analysis** with visible thought process
- **Comparative advantage** over other options considered

**Rationale Structure:**
- **Primary Reason**: Main factor making this the best choice
- **Context Fit**: How it aligns with current project needs and constraints  
- **Long-term Benefits**: Future advantages and scalability considerations
- **Risk Mitigation**: How this choice reduces project risks
- **Industry Alignment**: Adherence to standards and best practices

### 4. Developer Decision
**MANDATORY VALIDATION STEPS:**
- **STOP**: Before making ANY decision, you MUST present options to developer
- **FORMAT**: Use numbered list (1., 2., 3., etc.) for each option
- **ASK**: End with explicit question "Which option do you choose? (1, 2, 3, etc.)"
- **WAIT**: Do NOT proceed until developer responds with a number/choice
- **VALIDATE**: Confirm developer's selection before logging decision

**Present options and:**
- **CRITICAL**: Ask developer to choose ONE decision at a time (NEVER present multiple decisions simultaneously)
- Present each decision with researched alternatives and full references (Reference Name - URL)
- Wait for developer response before presenting next decision
- Allow requests for additional alternatives
- Accept developer override with reasoning
- Support requests for more specific research

**DECISION VALIDATION TEMPLATE:**
```
Based on my research, here are your options:

1. **[Option A]** - [Brief description]
   - Pros: [advantages]
   - Cons: [disadvantages]
   - Source: [Reference Name - URL]

2. **[Option B]** - [Brief description]
   - Pros: [advantages] 
   - Cons: [disadvantages]
   - Source: [Reference Name - URL]

⭐ **RECOMMENDED**: Option [X] because [clear reasoning]

Which option do you choose? (1, 2, 3, etc.)
```

### 5. Decision Logging
**Automatically log to `decisions-log.md`:**
- Date, Status, Context, Decision, Consequences, Alternatives, Research Sources
- Problem description and all research sources with names and URLs
- All options considered with rationales and full references (name - URL)
- Recommendation and final decision
- Developer reasoning if different from recommendation

## Decision Log Template

```markdown
# Decision Log

## [YYYY-MM-DD HH:MM] - [Cycle.SubCycle] Decision

**Decision Context:** [What needed to be decided]
**Problem:** [Brief description of the challenge]
**Research Sources:** [Reference Name - URL, Reference Name - URL, ...]

**Options Considered:**
1. **[Option A]** - [Rationale] (Source: [Reference Name - URL])
   - Pros: [advantages]
   - Cons: [disadvantages]

2. **[Option B]** - [Rationale] (Source: [Reference Name - URL])
   - Pros: [advantages]
   - Cons: [disadvantages]

[Additional options as needed]

**Recommended:** [Option X] 

**Recommendation Rationale:**
- **Primary Reason**: [Main factor making this the best choice]
- **Context Fit**: [How it aligns with current project needs and constraints]
- **Long-term Benefits**: [Future advantages and scalability considerations]
- **Risk Mitigation**: [How this choice reduces project risks]
- **Industry Alignment**: [Adherence to standards and best practices]

**Decision Taken:** [Developer's choice]
**Rationale:** [Developer's reasoning if different from recommendation]

---
```

## Research Tools Selection

**AI determines optimal research tools based on problem context:**

### Problem-Context Driven Selection:
- **AWS-Specific Problems**: AWS documentation and tools
- **General Technical Problems**: Web search, technical documentation
- **Code/Implementation Problems**: GitHub research, code analysis tools
- **Frontend-Specific Problems**: Frontend documentation and examples
- **Industry Standards**: Web search, best practices research

### Dynamic Tool Selection Process:
1. **Analyze Problem Context**: Understand domain, technology, scope
2. **Select Appropriate Tools**: Choose tools most relevant to problem type
3. **Prioritize Sources**: Order research based on reliability and relevance
4. **Adapt Based on Results**: Switch tools if initial research insufficient

## Decision Categories

### Duration and Timeline Decisions
- Cycle duration estimation based on complexity analysis
- Sub-cycle timeline planning and resource allocation
- Milestone and deliverable scheduling
- Risk buffer and contingency planning

### Architecture Decisions
- Technology stack selection
- System architecture patterns
- Database choices
- Deployment strategies

### Implementation Decisions
- **Language and Version Selection**: Programming language version (Python 3.8 vs 3.9 vs 3.10+, Node.js versions, etc.)
- Framework and library choices
- Code organization patterns
- Security implementations

### Testing Decisions
- **Testing Framework Selection**: unittest vs pytest vs Jest vs other frameworks
- **Test Coverage Strategy**: Unit tests, integration tests, end-to-end tests
- **Test Organization**: Test file structure and naming conventions
- **Mocking and Fixtures**: Test data and dependency management approaches
- **Continuous Testing**: CI/CD integration and automated test execution
- **Performance Testing**: Load testing and benchmarking strategies

### Requirements Prioritization Decisions
- **Prioritization Method Research**: Web search for current prioritization frameworks and methodologies
- **Stakeholder Input Strategy**: Research approaches for gathering and weighting stakeholder priorities
- **Business Value Assessment**: Research methods for evaluating revenue impact, user satisfaction, strategic alignment
- **Technical Complexity Evaluation**: Research approaches for development effort, risk assessment, dependencies
- **Release Planning Approach**: Research MVP definition methods, feature grouping strategies, timeline approaches
- **Priority Review Cadence**: Research best practices for reassessing and adjusting priorities

### Code Quality and Standards Decisions
- **Code Formatting**: Black vs autopep8 vs Prettier vs other formatters
- **Linting Strategy**: pylint vs flake8 vs ESLint vs other linters
- **Import Organization**: isort vs other import sorting tools
- **Type Checking**: mypy vs pyright vs TypeScript strict mode
- **Code Style Standards**: PEP 8, Google Style Guide, Airbnb Style Guide
- **Pre-commit Hooks**: Automated formatting and linting on commit
- **Documentation Standards**: Docstring formats (Google, NumPy, Sphinx)
- **Code Complexity Limits**: Cyclomatic complexity thresholds and enforcement

### Infrastructure Decisions
- Cloud service selections
- Deployment configurations
- Monitoring and logging setups
- Performance optimizations

## Best Practices

1. **Always Research First**: Use available tools before making recommendations
2. **Show Transparent Reasoning**: Use thinking tool for complex decisions to show analysis process
3. **Provide Multiple Options**: Give developers choices with clear trade-offs
4. **Source Everything**: Reference where recommendations come from with both name and URL
5. **Log All Decisions**: Maintain complete audit trail
6. **Allow Overrides**: Support developer expertise and preferences
7. **Learn from Context**: Use project history to improve future recommendations
8. **Calculate Durations Dynamically**: Analyze complexity, scope, and team context for timeline estimates
9. **Provide Duration Rationale**: Explain factors influencing timeline recommendations
