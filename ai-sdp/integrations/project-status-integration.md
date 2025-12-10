# Project Status Integration

## Purpose
Maintain a visual `project-status.md` file that provides real-time overview of project progress, current phase, completed deliverables, and next steps.

## MANDATORY: Status File Management

**CRITICAL**: Throughout ALL cycles and phases, you MUST maintain `project-status.md`:

### Status Update Triggers
Update `project-status.md` at these key points:
- **Cycle Start**: When beginning any new cycle or phase
- **Major Deliverable**: After creating key documents (requirements.md, architecture.md, etc.)
- **Decision Points**: After major technical decisions
- **Phase Completion**: When finishing any cycle or sub-phase
- **TODO Updates**: When significant TODO items are completed

### Required Status Document Structure

```markdown
# Project Status Dashboard

## 📊 Current Status
- **Project**: [Project Name]
- **Current Phase**: [Current Cycle/Phase]
- **Status**: [In Progress/Completed/Blocked]
- **Last Updated**: [Timestamp]

## 🎯 Progress Overview
### Foundation Cycle
- [ ] 0.1 Requirements Method Decision
- [ ] 1.1 Requirements Analysis  
- [ ] 1.2 Architecture Decisions
- [ ] 1.3 Development Setup

### Development Cycles
- [ ] Feature Cycle 1: [Feature Name]
- [ ] Feature Cycle 2: [Feature Name]
- [ ] [Additional cycles as needed]

### Integration & Deployment
- [ ] Integration Testing
- [ ] Deployment Setup
- [ ] Production Readiness

## 📋 Current Phase Details
**Phase**: [Current Phase Name]
**Objectives**: 
- [Key objective 1]
- [Key objective 2]

**Active TODOs**: [Link to current TODO list or summary]

**Next Steps**:
- [Immediate next action]
- [Following action]

## 📁 Deliverables Status
### Completed ✅
- [Document/deliverable] - [Date completed]
- [Document/deliverable] - [Date completed]

### In Progress 🔄
- [Document/deliverable] - [Current status]

### Pending ⏳
- [Document/deliverable] - [Expected timeline]

## 🔧 Technology Stack
**Selected**: [Technologies chosen so far]
**Under Evaluation**: [Technologies being researched]

## 🚧 Blockers & Issues
- [Any current blockers]
- [Issues requiring attention]

## 📈 Key Metrics
- **Total Cycles Completed**: X/Y
- **Documents Created**: X
- **Decisions Made**: X
- **Features Implemented**: X/Y

## 🎯 Next Milestone
**Target**: [Next major milestone]
**Timeline**: [Expected completion]
**Requirements**: [What needs to be done]
```

## Implementation Guidelines

### Status Update Process
1. **Read Current Status**: Always check existing project-status.md first
2. **Update Relevant Sections**: Modify only sections that changed
3. **Maintain History**: Keep completed items visible with timestamps
4. **Update Metrics**: Refresh progress counters and percentages
5. **Set Next Steps**: Always provide clear next actions

### Visual Indicators
Use consistent emoji and formatting:
- ✅ Completed items
- 🔄 In progress items  
- ⏳ Pending items
- 🚧 Blocked items
- 📊 Status sections
- 🎯 Goals and targets
- 📁 Deliverables
- 🔧 Technical information

### Integration with Other Systems
- **TODO Lists**: Reference active TODO lists and completion status
- **Decision Log**: Link to major decisions made
- **State Management**: Sync with .ai-sdp-state.json information
- **Document Status**: Track all created documents and their completion

## Automation Rules

### Automatic Updates Required
- **Phase Transitions**: Update current phase and progress bars
- **Document Creation**: Add to deliverables section with timestamp
- **Decision Completion**: Update technology stack and decision count
- **TODO Completion**: Refresh current phase details and next steps
- **Blocker Resolution**: Remove from blockers section and note resolution

### Status Consistency
- Keep status aligned with .ai-sdp-state.json
- Ensure progress percentages are accurate
- Maintain chronological order in completed items
- Update timestamps in ISO format with timezone
