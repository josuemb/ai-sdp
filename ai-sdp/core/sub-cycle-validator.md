# Sub-Cycle Validation Logic

## MANDATORY: Sub-Cycle Enforcement Validation

**CRITICAL**: The AI agent MUST use this validation logic before proceeding to Feature Cycles.

## Validation Process

### Step 1: State File Validation
```javascript
// Read .ai-sdp-state.json
const state = JSON.parse(fs.readFileSync('.ai-sdp-state.json'));

// Check if in Development Setup phase
if (state.project.phase === "foundation" && 
    state.project.cycle === "1.3-development-setup") {
    
    // Validate all sub-cycles are completed
    const subCycles = state.foundation.setup.sub_cycles;
    
    const allCompleted = 
        subCycles["1.3.1_testing"].completed &&
        subCycles["1.3.2_quality"].completed &&
        subCycles["1.3.3_security"].completed;
    
    if (!allCompleted) {
        // Find next pending sub-cycle
        if (!subCycles["1.3.1_testing"].completed) {
            return "EXECUTE: cycles/1.3.1-testing-framework-decision.md";
        } else if (!subCycles["1.3.2_quality"].completed) {
            return "EXECUTE: cycles/1.3.2-code-quality-decisions.md";
        } else if (!subCycles["1.3.3_security"].completed) {
            return "EXECUTE: cycles/1.3.3-security-best-practices-decision.md";
        }
    } else {
        return "COMPLETE: All sub-cycles finished, proceed to Feature Cycles";
    }
}
```

### Step 2: File Existence Validation
```bash
# Check if required decision files exist
REQUIRED_FILES=(
    "1.3.1-testing-framework-decision.md"
    "1.3.2-code-quality-decisions.md" 
    "1.3.3-security-best-practices-decision.md"
)

for file in "${REQUIRED_FILES[@]}"; do
    if [ ! -f "$file" ]; then
        echo "ERROR: Missing required decision file: $file"
        exit 1
    fi
done
```

### Step 3: Git Commit Validation
```bash
# Check if required commits exist
REQUIRED_COMMITS=(
    "chore(testing): select testing framework"
    "chore(quality): configure code quality tools"
    "feat(security): implement security best practices"
)

for commit_msg in "${REQUIRED_COMMITS[@]}"; do
    if ! git log --oneline | grep -q "$commit_msg"; then
        echo "ERROR: Missing required commit: $commit_msg"
        exit 1
    fi
done
```

## Agent Enforcement Rules

### Before Feature Cycles
**CRITICAL**: The agent MUST check:
1. All three sub-cycles are marked as completed in state file
2. All required decision documents exist
3. All required git commits are present
4. No sub-cycle can be skipped

### Error Handling
If validation fails:
1. Display clear error message about missing sub-cycle
2. Execute the next pending sub-cycle
3. Do NOT proceed to Feature Cycles
4. Update state file after each sub-cycle completion

### Success Criteria
All sub-cycles completed when:
- State file shows all completed: true
- All decision documents exist
- All git commits are present
- Development setup is fully configured
