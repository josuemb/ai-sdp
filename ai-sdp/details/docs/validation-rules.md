# Validation Rules

## Input Validation

### Project Name
- Length: 3-50 characters
- Format: Alphanumeric + hyphens only
- No spaces or special characters
- Must start with letter or number

### Requirements
- Minimum: 10 words
- Maximum: 1000 words
- Must contain actionable items
- No empty or placeholder text

### File Paths
- Must be within project scope
- Relative paths preferred (./src/, ../docs/)
- Absolute paths only for user directories (~/)

## File Validation

### Allowed Extensions
- Documentation: .md, .txt, .rst
- Configuration: .json, .yaml, .yml, .toml
- Code: .js, .ts, .py, .java, .go, .rs
- Web: .html, .css, .scss
- Data: .csv, .xml

### Blocked Extensions
- Executables: .exe, .bin, .app
- System files: .sys, .dll, .so
- Archives: .zip, .tar, .gz (unless specifically requested)

### Path Restrictions
- **Allowed**: ./project/, ../workspace/, ~/projects/
- **Blocked**: /system/, /usr/, /etc/, /var/, /root/
- **Special**: /tmp/ (read-only access)

## State Validation

### Required Fields
- currentCycle: Must be valid cycle number (1.1, 1.2, 2.1, etc.)
- status: One of [active, paused, completed, error, planning]
- timestamp: ISO 8601 format
- projectName: Non-empty string

### Valid State Transitions
- planning → active
- active → paused → active
- active → completed
- any → error → active (after resolution)

### Cycle Progression Rules
- Foundation: 1.1 → 1.2 → 1.3 (sequential)
- Feature: 2.1 → 2.2 → 2.3 → 2.4, then 3.1 → 3.2 → 3.3 → 3.4 (sequential)
- Cannot skip sub-cycles
- Cannot go backwards without explicit reset

## Decision Validation

### Required Decision Fields
- timestamp: When decision was made
- context: What was being decided
- options: At least 2 options considered
- recommendation: AI's recommended choice
- decision: Final decision made
- rationale: Why decision was made

### Decision Quality Checks
- All options have pros/cons listed
- Sources cited for recommendations
- Clear rationale for final choice
- Consistent with project constraints

## Error Handling

### Validation Failures
- Provide specific error messages
- Suggest corrections when possible
- Allow user override with confirmation
- Log validation failures for analysis

### Recovery Actions
- Invalid state: Offer state reset options
- Bad file paths: Suggest valid alternatives
- Missing fields: Prompt for required information
- Format errors: Provide format examples
