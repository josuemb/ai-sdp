# TODO List Integration

## Overview

AI-SDP automatically creates TODO lists for each cycle and sub-cycle to break down complex development work into actionable tasks.

## Automatic TODO Creation

### When TODO Lists Are Created
- **Cycle Start**: When beginning any new cycle (Foundation or Feature)
- **Sub-cycle Transition**: When moving between sub-cycles
- **Complex Tasks**: When decisions involve multiple implementation steps
- **User Request**: When explicitly asked to create task breakdowns

### TODO List Structure
```
Foundation Cycle 1.1 - Requirements Analysis
[ ] Extract functional requirements from user input
[ ] Research similar solutions and patterns
[ ] Identify technical constraints and limitations
[ ] Define success criteria and acceptance criteria
[ ] Document requirements specification
[ ] Validate requirements with stakeholders
```

## User Commands

### View TODO Lists
```bash
/todos view
```
- Shows all available TODO lists
- Displays completion status
- Interactive selection interface

### Resume TODO Lists
```bash
/todos resume
```
- Load existing TODO list back into conversation
- Continue where you left off
- Maintains context and progress

### Manage TODO Lists
```bash
/todos clear-finished  # Remove completed lists
/todos delete          # Delete specific lists
```

## Integration with AI-SDP Workflow

### Decision Framework Integration
TODO lists are created as part of the AI Decision Assistant process defined in `framework/decision-framework.md`:
- **Step 6**: TODO List Creation automatically generates task breakdowns
- Tasks align with decision outcomes and implementation requirements
- Progress tracking integrates with cycle state management

### Foundation Cycle Integration
1. **Cycle 1.1**: Requirements analysis tasks
2. **Cycle 1.2**: Architecture decision tasks
3. **Cycle 1.3**: Development setup tasks

### Feature Cycle Integration
1. **Cycle N.1**: Feature planning tasks
2. **Cycle N.2**: Development implementation tasks
3. **Cycle N.3**: Testing and QA tasks
4. **Cycle N.4**: Deployment and feedback tasks

### State Management Integration
- TODO lists linked to cycle state
- Progress tracked in `.ai-sdp-state.json`
- Task completion updates cycle status
- Seamless transition between cycles

## Task Types

### Research Tasks
- [ ] Research technology options for [specific need]
- [ ] Analyze competitor solutions and patterns
- [ ] Review industry best practices and standards
- [ ] Investigate integration requirements

### Decision Tasks
- [ ] Evaluate [technology/pattern] options
- [ ] Compare pros/cons of different approaches
- [ ] Make final decision on [specific choice]
- [ ] Document decision rationale

### Implementation Tasks
- [ ] Set up development environment
- [ ] Create project structure and organization
- [ ] Implement [specific feature/component]
- [ ] Write tests for [functionality]
- [ ] Deploy to [environment]

### Documentation Tasks
- [ ] Update decision log with [decision]
- [ ] Document architecture decisions
- [ ] Create setup instructions
- [ ] Write user documentation

## Best Practices

### For AI
1. **Be Specific**: Create concrete, actionable tasks
2. **Right-Size**: Tasks should be completable in 1-2 hours
3. **Sequential**: Order tasks logically
4. **Context**: Include enough detail for clarity
5. **Trackable**: Make progress measurable

### For Users
1. **Regular Updates**: Mark tasks complete as you finish them
2. **Resume Sessions**: Use `/todos resume` to continue work
3. **Clean Up**: Use `/todos clear-finished` to remove completed lists
4. **Stay Organized**: One TODO list per cycle/sub-cycle

## Storage and Persistence

### Local Storage
- TODO lists stored in `.kiro/cli-todo-lists/`
- JSON format with task details and status
- Persistent across chat sessions
- Project-specific (not global)

### Integration with State File
- TODO list IDs referenced in `.ai-sdp-state.json`
- Progress tracking linked to cycle status
- Automatic cleanup when cycles complete

## Example Workflow

```
User: "Start Foundation Cycle 1.1 for a blog application"

AI: Creating TODO list for Requirements Analysis...

📋 TODO: Foundation Cycle 1.1 - Requirements Analysis
[ ] Extract functional requirements (posts, comments, users)
[ ] Research existing blog platforms and features
[ ] Identify technical constraints (performance, scalability)
[ ] Define success criteria and acceptance criteria
[ ] Document requirements specification
[ ] Validate requirements scope and priorities

Use `/todos view` to see all lists or `/todos resume` to continue later.
```

## Benefits

- **Clear Progress**: Visual task completion tracking
- **Session Continuity**: Resume work across multiple sessions
- **Structured Approach**: Break complex cycles into manageable tasks
- **Accountability**: Clear deliverables and checkpoints
- **Flexibility**: Modify tasks as requirements evolve
