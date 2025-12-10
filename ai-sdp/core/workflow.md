# AI-SDP Workflow: AI-Assisted Development Cycles

## MANDATORY: State Detection (EXECUTE FIRST)

**CRITICAL**: Before ANY response, check for AI-SDP project state:

1. **Check for `.ai-sdp-state.json`**: If exists, read current phase and continue from there
2. **Check for `decisions-log.md`**: If exists, review previous decisions
3. **Check for `project-status.md`**: If exists, review current status
4. **If NO state files exist**: This is a NEW PROJECT - execute complete initialization sequence

**NEW PROJECT DETECTION**: If no AI-SDP files exist, user is requesting a new project. MUST follow initialization sequence.

## MANDATORY: Complete Project Initialization Sequence

**STEP 1 - GIT REPOSITORY INITIALIZATION:**
1. **Check Repository**: Run `git status` to check if git repository exists
2. **Initialize if Needed**: Run `git init` if not a git repository
3. **Configure Git**: Optionally set user.name and user.email

**STEP 2 - PROJECT STRUCTURE CREATION:**
1. **Capture Initial Prompt**: Store the user's original request with timestamp for use in requirements.md
2. **Create State File**: Create `.ai-sdp-state.json` using template from `core/state-management.md`
3. **Create Decision Log**: Create `decisions-log.md` with header "# Project Decisions"
4. **Create Status Dashboard**: Create `project-status.md` using template from `integrations/project-status-integration.md`
5. **Initialize Values**: Set project name, current phase, and timestamps

**STEP 3 - INITIAL GIT COMMIT:**
1. **Stage All Files**: Add all created files to git staging area
2. **Create Initial Commit**: Use message "init: Initialize AI-SDP project structure"
3. **Verify Commit**: Confirm commit was created successfully

**STEP 4 - STATE VERIFICATION:**
1. **Check Existing State**: If state file exists, read current phase and resume from there
2. **Update Progress**: Mark initialization complete in state file
3. **Begin Workflow**: Start appropriate cycle based on project state

**This complete sequence must happen before any development work begins.**

## MANDATORY: Continuous Status Monitoring

**CRITICAL**: Throughout ALL development cycles, maintain `project-status.md`:
- Update at cycle starts, major deliverables, and phase completions
- Keep progress indicators current and accurate
- Provide clear next steps and current objectives
- Track all deliverables and decisions with timestamps

## Rapid Value Delivery Through AI-Assisted Cycles

AI-SDP uses AI-assisted development cycles where AI researches options, provides recommendations, and assists decision-making for faster value delivery. Cycle duration is determined dynamically by AI based on complexity and scope.

```
Cycle 1: Foundation → Cycle 2-N: Feature Cycles → Continuous Value
```

## Cycle Structure

### Cycle 1: Foundation
**Goal**: Establish technical foundation for development

**Sub-Cycles**:
- **1.1** Requirements Analysis & Context Research
- **1.2** Architecture & Technology Stack Decisions
- **1.3** Development Setup & Project Structure

### Cycle 2-N: Feature Cycles
**Goal**: Deliver specific features with user value

**Sub-Cycles**:
- **N.1** Feature Planning & Research
- **N.2** Development & Implementation
- **N.3** Testing & Quality Assurance
- **N.4** Deployment & Feedback Integration

## AI Decision Assistant Process

**For Each Decision Point:** Follow the complete process defined in `framework/decision-framework.md` with these tool integrations:

- **Context Research**: Search knowledge base for similar past decisions and patterns
- **Generate Options**: Use thinking tool for complex decisions to analyze trade-offs  
- **Recommendation**: Use thinking tool to show reasoning for complex recommendations
- **Decision Logging**: Store decision patterns in knowledge base for future reference
- **TODO List Creation**: Create actionable TODO lists for each cycle/sub-cycle

## AI-Calculated Duration Pattern

**Foundation Cycle**: AI analyzes project complexity and provides duration estimate
**Feature Cycles**: AI evaluates each feature's scope and complexity for timeline

### Duration Calculation Process:
1. **Complexity Analysis**: AI assesses technical and business complexity
2. **Scope Evaluation**: AI breaks down deliverables and dependencies
3. **Resource Assessment**: AI considers team capabilities and constraints
4. **Timeline Recommendation**: AI provides duration with confidence level
5. **Decision Logging**: Duration rationale recorded in core/decision-log.md

## Cycle Characteristics

- **AI-Accelerated**: AI handles research, code generation, testing
- **Decision-Driven**: Structured decision-making with rationales
- **Value-Focused**: Each cycle delivers working features
- **Feedback-Integrated**: Continuous user feedback incorporation
- **Audit-Tracked**: Complete decision history maintained

## Continuous Improvement

Each cycle builds on previous decisions and learnings, with AI adapting recommendations based on project context and developer preferences.
# AI-SDP State Management

## MANDATORY: Automatic State Detection and Initialization

**STEP 1 - AI MUST CHECK FOR EXISTING STATE FIRST:**
1. **Check for Existing State**: Always check if `.ai-sdp-state.json` exists in current working directory
2. **If State Exists**: Load existing state and resume from current cycle
3. **If No State**: Create new state file with template below
4. **Initialize Values**: Set project name, current phase, and timestamp
5. **Update Progress**: Mark initialization complete

**CRITICAL**: This must happen AUTOMATICALLY in the SAME interaction before any other work begins.

## Automatic State Detection Logic

**ALWAYS start every interaction with:**
```
1. Check if .ai-sdp-state.json exists
2. If EXISTS:
   - Read the file
   - Display: "Resuming AI-SDP project: [project_name]"
   - Display: "Current cycle: [current_cycle]" 
   - Continue from current cycle
3. If NOT EXISTS:
   - Create new state file
   - Display: "Initializing new AI-SDP project"
   - Start from requirements method decision
```

## State File Template

```json
{
  "project": {
    "name": "",
    "type": "",
    "phase": "foundation",
    "cycle": "requirements-analysis",
    "created": "",
    "last_updated": ""
  },
  "foundation": {
    "requirements": {
      "status": "pending",
      "decisions": [],
      "artifacts": []
    },
    "architecture": {
      "status": "pending", 
      "decisions": [],
      "artifacts": []
    },
    "setup": {
      "status": "pending",
      "sub_cycles": {
        "1.3.1_testing": {
          "status": "pending",
          "completed": false,
          "decisions": [],
          "artifacts": []
        },
        "1.3.2_quality": {
          "status": "pending", 
          "completed": false,
          "decisions": [],
          "artifacts": []
        },
        "1.3.3_security": {
          "status": "pending",
          "completed": false, 
          "decisions": [],
          "artifacts": []
        }
      },
      "decisions": [],
      "artifacts": []
    }
  },
  "implementation": {
    "status": "pending",
    "features": [],
    "current_feature": null,
    "files_created": [],
    "tests_created": []
  },
  "current_session": {
    "started": "",
    "focus": "",
    "next_steps": []
  }
}
```

## State Management Rules

### Mandatory Creation
- **Always create state file as first step** in any development request
- **Never skip state initialization** - it prevents restart issues
- **Update in same interaction** as work completion
- **Support session resumption** from any phase

### Sub-Cycle Enforcement Rules
- **Development Setup (1.3) Sub-Cycles**: MUST complete 1.3.1, 1.3.2, 1.3.3 in sequence
- **Cannot Skip Sub-Cycles**: Agent must check sub_cycles completion before proceeding
- **Sequential Execution**: 1.3.1 → 1.3.2 → 1.3.3 (no parallel execution)
- **State Validation**: Before moving to Feature Cycles, verify all sub-cycles are completed
- **Completion Tracking**: Mark each sub-cycle as completed: true in state file

### Update Requirements
- **Check existing state first**: Always read existing state file to resume from correct point
- **Immediate updates**: Update state file when completing work, creating files, or making decisions
- **Decision tracking**: Log all decisions with timestamps in both state and decisions-log.md
- **Progress tracking**: Mark completed steps, phases, and track created files
- **Sub-cycle tracking**: Update sub_cycles status and completed flags
- **Implementation tracking**: Update files_created array when creating source files
- **Session continuity**: Enable resuming from exact point by checking current phase and cycle

### Foundation Cycle Completion Logic
```
IF phase == "foundation" AND cycle == "1.3-development-setup":
  CHECK sub_cycles.1.3.1_testing.completed == true
  CHECK sub_cycles.1.3.2_quality.completed == true  
  CHECK sub_cycles.1.3.3_security.completed == true
  IF ALL sub-cycles completed:
    SET phase = "feature-development"
    SET cycle = "2.1-feature-planning"
  ELSE:
    CONTINUE with next pending sub-cycle
```

## File Location

- **Path**: `.ai-sdp-state.json` in project root
- **Scope**: Project-specific state management
- **Persistence**: Maintained across agent sessions
- **Integration**: Works with decision framework and TODO tracking
