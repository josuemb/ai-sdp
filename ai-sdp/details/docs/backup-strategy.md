# Backup Strategy

## Overview

Comprehensive backup system to protect project state, decisions, and configuration from loss or corruption.

## Automatic Backup Schedule

### State File Backups
- **Frequency**: After every state change
- **Location**: `ai-sdp/backups/state/`
- **Naming**: `state-YYYY-MM-DD-HH-MM-SS.json`
- **Retention**: 24 hours of hourly backups, 7 days of daily backups

### Decision Log Backups
- **Frequency**: After each decision logged
- **Location**: `ai-sdp/backups/decisions/`
- **Naming**: `decisions-YYYY-MM-DD.md`
- **Retention**: 30 days of daily backups, 12 months of monthly backups

### Configuration Backups
- **Frequency**: Before any configuration changes
- **Location**: `ai-sdp/backups/config/`
- **Naming**: `config-YYYY-MM-DD-HH-MM-SS.json`
- **Retention**: 10 most recent versions

### Metrics Backups
- **Frequency**: Daily at midnight
- **Location**: `ai-sdp/backups/metrics/`
- **Naming**: `metrics-YYYY-MM-DD.json`
- **Retention**: 90 days of daily backups

## Backup Locations

### Primary Backup (Local)
```
ai-sdp/backups/
├── state/
│   ├── state-2025-12-03-17-59-00.json
│   ├── state-2025-12-03-16-30-15.json
│   └── ...
├── decisions/
│   ├── decisions-2025-12-03.md
│   ├── decisions-2025-12-02.md
│   └── ...
├── config/
│   ├── config-2025-12-03-17-59-00.json
│   └── ...
└── metrics/
    ├── metrics-2025-12-03.json
    └── ...
```

### Secondary Backup (Optional)
- Cloud storage integration (AWS S3, Google Drive, etc.)
- External drive synchronization
- Git repository with backup branches

## Retention Policies

### Tiered Retention
- **Hourly**: Last 24 hours (state files only)
- **Daily**: Last 30 days (all file types)
- **Weekly**: Last 12 weeks (compressed archives)
- **Monthly**: Last 12 months (essential files only)

### Automatic Cleanup
- Remove expired backups automatically
- Compress older backups to save space
- Maintain index of available backups
- Alert before cleanup of important milestones

## Recovery Procedures

### State File Recovery
```markdown
## Scenario: Corrupted .ai-sdp-state.json

1. **Detect Issue**: State file unreadable or invalid
2. **Find Latest Backup**: Check ai-sdp/backups/state/ for recent valid backup
3. **Verify Backup**: Validate backup file integrity
4. **Restore State**: Copy backup to .ai-sdp-state.json
5. **Resume Operation**: Continue from restored state
6. **Log Recovery**: Document recovery in decision log
```

### Decision Log Recovery
```markdown
## Scenario: Lost core/decision-log.md

1. **Check Backups**: Look in ai-sdp/backups/decisions/
2. **Merge Recent**: Combine daily backups if needed
3. **Restore File**: Copy merged content to core/decision-log.md
4. **Verify Completeness**: Check for missing recent decisions
5. **Update Index**: Rebuild decision index if needed
```

### Complete Project Recovery
```markdown
## Scenario: Complete ai-sdp directory loss

1. **Initialize Structure**: Recreate ai-sdp/ directory
2. **Restore Configuration**: Copy latest config backup
3. **Restore State**: Copy latest state backup
4. **Restore Decisions**: Copy latest decision log backup
5. **Restore Metrics**: Copy recent metrics backups
6. **Verify Integrity**: Check all restored files
7. **Resume Operation**: Continue from restored state
```

## Backup Validation

### Integrity Checks
- **File Size**: Ensure backups aren't empty or truncated
- **JSON Validation**: Verify JSON files parse correctly
- **Content Validation**: Check required fields present
- **Timestamp Verification**: Ensure backup timestamps are logical

### Recovery Testing
- **Monthly Tests**: Attempt recovery from random backup
- **Scenario Testing**: Test different failure scenarios
- **Performance Testing**: Measure recovery time
- **Documentation Updates**: Keep procedures current

## Backup Monitoring

### Health Checks
- **Daily**: Verify backups were created
- **Weekly**: Check backup file integrity
- **Monthly**: Validate retention policy compliance
- **Quarterly**: Test full recovery procedures

### Alerts
- **Missing Backup**: Alert if scheduled backup fails
- **Corruption Detected**: Alert if backup validation fails
- **Storage Full**: Alert if backup storage approaching limits
- **Recovery Needed**: Alert if automatic recovery triggered

## Implementation Guidelines

### Backup Creation
```bash
# Create state backup
cp .ai-sdp-state.json ai-sdp/backups/state/state-$(date +%Y-%m-%d-%H-%M-%S).json

# Create decision backup
cp core/decision-log.md ai-sdp/backups/decisions/decisions-$(date +%Y-%m-%d).md

# Cleanup old backups
find ai-sdp/backups/state/ -name "*.json" -mtime +1 -delete
```

### Backup Restoration
```bash
# Restore latest state
latest_state=$(ls -t ai-sdp/backups/state/*.json | head -1)
cp "$latest_state" .ai-sdp-state.json

# Restore latest decisions
latest_decisions=$(ls -t ai-sdp/backups/decisions/*.md | head -1)
cp "$latest_decisions" core/decision-log.md
```

### Backup Verification
```bash
# Verify JSON integrity
for file in ai-sdp/backups/state/*.json; do
    jq empty "$file" || echo "Corrupted: $file"
done

# Check backup completeness
required_fields=("currentCycle" "status" "timestamp")
for field in "${required_fields[@]}"; do
    jq -e ".$field" .ai-sdp-state.json > /dev/null || echo "Missing: $field"
done
```

## Benefits

- **Data Protection**: Never lose project progress or decisions
- **Quick Recovery**: Minimal downtime from failures
- **Historical Access**: Review past states and decisions
- **Confidence**: Work knowing data is protected
- **Compliance**: Maintain audit trail of all changes
