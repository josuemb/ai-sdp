# AI-SDP State Management

## State File Template (.ai-sdp-state.json)

```json
{
  "project_name": "",
  "initial_prompt": "",
  "initial_prompt_timestamp": "",
  "current_phase": "initialization",
  "foundation_cycles": {
    "0.1": { "name": "Requirements Method Decision", "status": "pending", "completed_at": null },
    "1.1": { "name": "Requirements Analysis", "status": "pending", "completed_at": null },
    "1.2": { "name": "Architecture Decisions", "status": "pending", "completed_at": null },
    "1.3": { "name": "Development Setup", "status": "pending", "completed_at": null },
    "1.3.1": { "name": "Testing Framework Decision", "status": "pending", "completed_at": null },
    "1.3.2": { "name": "Code Quality Decisions", "status": "pending", "completed_at": null },
    "1.3.3": { "name": "Security Best Practices Decision", "status": "pending", "completed_at": null }
  },
  "created_at": "",
  "last_updated": ""
}
```

## State Management Rules

1. **Initial Prompt Storage**: Always capture the user's first request in `initial_prompt` field
2. **Phase Tracking**: Update `current_phase` as cycles complete
3. **Cycle Status**: Mark cycles as "pending", "in_progress", or "completed"
4. **Timestamps**: Track when cycles are completed
5. **State Updates**: Update `last_updated` on every state change

## State Detection Logic

1. Check if `.ai-sdp-state.json` exists
2. If exists: Read current phase and continue workflow
3. If not exists: New project - execute initialization sequence
4. Always validate state consistency before proceeding
