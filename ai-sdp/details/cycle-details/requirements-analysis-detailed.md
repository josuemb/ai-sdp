# Requirements Analysis & Context Research

## MANDATORY: Project Status Updates
**CRITICAL**: Throughout this cycle, you MUST update `project-status.md`:
- **Cycle Start**: Update current phase to "Foundation Cycle 1.1 - Requirements Analysis"
- **Document Creation**: Add requirements.md to deliverables when completed
- **Research Completion**: Update progress on functional/technical requirements
- **Cycle Completion**: Mark phase as completed and set next phase to Architecture Decisions

## MANDATORY: TODO List Creation
**CRITICAL**: At the start of this cycle, create a TODO list using the process defined in `integrations/todo-integration.md`:

**Example TODO List Structure**:
```
Foundation Cycle 1.1 - Requirements Analysis
[ ] Extract functional requirements from user input
[ ] Research similar solutions and patterns  
[ ] Identify technical constraints and limitations
[ ] Define success criteria and acceptance criteria
[ ] Document requirements specification
[ ] Validate requirements with stakeholders
```

Use `/todos view` to track progress and `/todos resume` to continue work.

## Input Sources
- User input text and documents
- Problem descriptions and business context
- Industry standards and best practices research
- Similar problem patterns and solutions

## Purpose
Extract and analyze requirements using AI-powered research and context analysis to establish clear project scope and objectives.

## Overview
Transform user input into structured requirements through AI research, analysis, and decision-making. Focus on understanding the problem domain, identifying similar solutions, and establishing clear success criteria.

## Key Activities

### AI-Powered Requirements Extraction
- **FIRST**: Automatically capture and document the exact initial user request with timestamp from the very first interaction
- Analyze input text and documents for explicit requirements
- Identify implicit requirements and assumptions
- Extract functional and non-functional requirements
- Map requirements to user value and business objectives

### Context Research & Analysis
- **Decision Point**: Research similar problems and solutions
  - Use web_search tool for industry patterns and methodologies
  - Research existing solutions and approaches
  - Analyze competitor solutions and market standards
  - Identify proven patterns and anti-patterns
  - **Research formal methodologies**: User Stories, BDD, Use Cases, DDD, JTBD

## MANDATORY: Prerequisites
**CRITICAL**: Before starting requirements analysis, ensure:
- Requirements specification method has been selected via `cycles/0.1-requirements-method-decision.md`
- Decision has been logged in `decisions-log.md`
- Chosen method will be used for all requirements documentation

### Technology Feasibility Assessment
- **Decision Point**: Evaluate technical feasibility options
  - Research technology constraints and capabilities
  - Assess integration requirements and complexity
  - Evaluate performance and scalability needs
  - Consider security and compliance requirements

### Project Scope Definition
- **Decision Point**: Define project boundaries and priorities
  - Research scope definition patterns for similar problems
  - Prioritize features using value vs effort analysis
  - Define success criteria and acceptance criteria
  - Establish timeline and resource constraints

## Deliverables
- **Requirements Document** (`requirements.md`) - Structured documentation of all requirements
- **Context Research Summary** - Research findings and industry analysis  
- **Technology Feasibility Assessment** - Technical constraints and capabilities
- **Project Scope Definition** - Boundaries, priorities, and success criteria
- **Decision Log entries** - All research-based decisions with sources (name - URL)

## Requirements Documentation Process

### MANDATORY: Research Documentation Approach First
**Before creating any requirements document:**

1. **Verify method selection** - Ensure requirements specification method was chosen via `cycles/0.1-requirements-method-decision.md`
2. **Review decision log** - Check `decisions-log.md` for the selected method and rationale
3. **Apply chosen method** - Use the selected approach consistently throughout requirements gathering
4. **Create documentation** using the chosen method format
- "requirements gathering methodologies comparison"

**Research Focus Areas**:
- Current industry practices and trends
- Methodology pros/cons for different project types
- Tools and frameworks available
- Success stories and case studies
- Emerging approaches and innovations

**Present Research Results**: 
- 6-8 current methodologies found through research
- Include source URLs in "Reference Name - URL" format
- Provide context for when each method works best
- Let developer choose based on their specific project needs
```markdown
# Project Requirements

## Initial User Request
**Original Request**: "[Capture exact user input from first interaction]"
**Date**: [Timestamp of initial request]

## Project Overview
- **Problem Statement**: [Clear description of problem being solved]
- **Target Users**: [Who will use this solution]
- **Success Criteria**: [How success will be measured]

## Functional Requirements
### Core Features (from initial request)
1. [Feature 1 from user input] - [Description and acceptance criteria]
2. [Feature 2 from user input] - [Description and acceptance criteria]

### Additional Features (from research)
1. [Feature discovered through research] - [Description and rationale]

### User Stories
- As a [user type], I want [functionality] so that [benefit]

## Non-Functional Requirements
- **Performance**: [Response times, throughput requirements]
- **Security**: [Authentication, authorization, data protection]
- **Scalability**: [User load, data volume expectations]
- **Compatibility**: [Platform, browser, device requirements]

## Technical Constraints
- **Technology Stack**: [Decided technologies with rationale]
- **Integration Requirements**: [External systems, APIs, databases]
- **Deployment Environment**: [Cloud, on-premise, hybrid]

## Project Scope
### In Scope
- [Features and functionality included from initial request]
- [Additional features from research]

### Out of Scope  
- [Features explicitly excluded]

## Research Sources
- [Reference Name - URL]
- [Reference Name - URL]
```

### Documentation Decision Points
Use framework/decision-framework.md for ALL requirements decisions:

1. **Initial Requirements Capture**
   - Document exact user request from first interaction
   - Extract explicit and implicit requirements
   - No research needed - direct documentation

2. **Requirements Gathering Process**
   - **MANDATORY**: Use the requirements specification method selected in `cycles/0.1-requirements-method-decision.md`
   - Apply chosen method consistently (User Stories, BDD, Use Cases, etc.)
   - Document requirements using selected format and structure
   - Include research sources and validation criteria
   - Log requirements decisions in decisions-log.md with method rationale
   - **CRITICAL**: Always use dynamic research - never rely on predefined lists

3. **Problem Domain Research**
   - Research similar solutions and industry patterns
   - Document findings using chosen documentation method
   - Log decision in decisions-log.md

4. **User Requirements Prioritization**
   - Research user needs and market analysis
   - Present prioritization options with rationales
   - Document chosen priorities with research sources

5. **Technical Requirements Definition**
   - Research technical constraints and capabilities
   - Present feasibility options with trade-offs
   - Document technical decisions with source references

6. **Scope Boundary Decisions**
   - Research scope definition patterns
   - Present scope options with effort/value analysis
   - Document final scope with research justification

## AI Decision Assistant Usage

### Dynamic Research Tool Selection:
AI selects appropriate research tools based on problem context:
- **Industry Research**: Web search for standards, patterns, best practices
- **Cloud/AWS Requirements**: AWS documentation and tools
- **Solution Examples**: GitHub repository research and patterns
- **Technical Feasibility**: Framework and technology documentation

### Example Decision Points:
- **Problem Domain Research**: "What are the standard approaches for [problem type]?"
- **Technology Feasibility**: "What are the best technology options for [requirements]?"
- **Project Scope**: "What features should be included in initial release for [use case]?"
- **Success Metrics**: "What are standard success criteria for [solution type]?"

Each decision point follows the full AI Decision Assistant process:
1. Context research using appropriate tools
2. Generate 1-5 options with rationales and sources
3. Mark RECOMMENDED option with clear reasoning
4. Log developer decision in core/decision-log.md
