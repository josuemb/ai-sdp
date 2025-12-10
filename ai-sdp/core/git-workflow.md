# Git Workflow Management

## Repository Initialization

**CRITICAL**: Every AI-SDP project must start with git repository initialization:

```bash
# Check if git repository exists
git status

# If not initialized, create repository
git init

# Configure git if needed (optional)
git config user.name "Developer Name"
git config user.email "developer@example.com"
```

## Conventional Commit Standards

**MANDATORY**: All commits must follow conventional commit format:

### Commit Message Format
```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

### Commit Types
- **feat**: New feature implementation
- **fix**: Bug fixes
- **docs**: Documentation changes
- **style**: Code style changes (formatting, missing semicolons, etc.)
- **refactor**: Code refactoring without functionality changes
- **test**: Adding or updating tests
- **chore**: Maintenance tasks, build changes, dependency updates

### AI-SDP Specific Scopes
- **requirements**: Requirements analysis and documentation
- **architecture**: System architecture and design decisions
- **setup**: Development environment and tooling setup
- **feature**: Feature development cycles
- **docs**: Project documentation updates
- **config**: Configuration file changes

### Commit Examples for AI-SDP Cycles

#### Foundation Cycle Commits
```bash
# Initial project setup
git commit -m "init: Initialize AI-SDP project structure"

# Requirements analysis completion
git commit -m "feat(requirements): complete user requirements analysis"

# Architecture decisions
git commit -m "docs(architecture): define system architecture and technology stack"

# Development setup
git commit -m "chore(setup): configure development environment and tooling"
```

#### Feature Cycle Commits
```bash
# Feature planning
git commit -m "docs(feature): plan user authentication feature"

# Feature implementation
git commit -m "feat(auth): implement user login and registration"

# Feature testing
git commit -m "test(auth): add authentication integration tests"

# Feature documentation
git commit -m "docs(auth): document authentication API endpoints"
```

## Commit Timing Rules

**MANDATORY**: Create commits at these specific points:

1. **Project Initialization**: After creating initial AI-SDP structure
2. **Cycle Completion**: After each foundation or feature cycle
3. **Major Decisions**: After implementing architecture or technology decisions
4. **Documentation Updates**: After creating or updating major documentation
5. **Configuration Changes**: After environment or tooling setup

## Git Workflow Integration

### Pre-Commit Checklist
1. **Web Research**: Research current conventional commit best practices
2. **Stage Changes**: Add all relevant files to staging area
3. **Verify Message**: Ensure commit message follows conventional format
4. **Character Limit**: Keep subject line under 50 characters
5. **Imperative Mood**: Use imperative mood ("add" not "added")

### Post-Commit Actions
1. **Update State**: Reflect commit in .ai-sdp-state.json
2. **Log Decision**: Update decisions-log.md if applicable
3. **Status Update**: Update project-status.md with progress

## Git Commands for AI-SDP

### Essential Commands
```bash
# Initialize repository
git init

# Check repository status
git status

# Stage all changes
git add .

# Stage specific files
git add filename.md

# Create commit with conventional message
git commit -m "feat(scope): description"

# View commit history
git log --oneline

# View recent commits
git log -5 --pretty=format:"%h %s"
```

### Branch Management (Optional)
```bash
# Create feature branch
git checkout -b feature/user-auth

# Switch back to main
git checkout main

# Merge feature branch
git merge feature/user-auth
```

## Error Handling

### Common Git Issues
1. **Not a git repository**: Run `git init` first
2. **Nothing to commit**: Ensure files are staged with `git add`
3. **Commit message format**: Follow conventional commit standards
4. **Large files**: Use .gitignore for build artifacts and dependencies

### Recovery Commands
```bash
# Undo last commit (keep changes)
git reset --soft HEAD~1

# Undo last commit (discard changes)
git reset --hard HEAD~1

# Amend last commit message
git commit --amend -m "new message"
```

## Integration with AI-SDP State

The git workflow must integrate with AI-SDP state management:

1. **State Updates**: Each commit should trigger state file updates
2. **Decision Tracking**: Link commits to decision log entries
3. **Progress Monitoring**: Reflect git commits in project status dashboard
4. **Session Resume**: Use git history to understand project progression
