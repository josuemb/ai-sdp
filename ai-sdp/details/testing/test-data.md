# Test Data and Scenarios

## Sample Project Configurations

### Simple Web App
```json
{
  "projectName": "simple-blog",
  "requirements": "Create a personal blog with posts, comments, and user authentication",
  "techStack": "React, Node.js, MongoDB",
  "complexity": "low",
  "estimatedDuration": "2-3 weeks"
}
```

### Enterprise API
```json
{
  "projectName": "inventory-api",
  "requirements": "Build scalable inventory management API with real-time updates, reporting, and multi-tenant support",
  "techStack": "Java Spring Boot, PostgreSQL, Redis, AWS",
  "complexity": "high",
  "estimatedDuration": "8-12 weeks"
}
```

### Mobile App
```json
{
  "projectName": "fitness-tracker",
  "requirements": "Cross-platform mobile app for fitness tracking with offline sync and social features",
  "techStack": "React Native, Firebase, GraphQL",
  "complexity": "medium",
  "estimatedDuration": "6-8 weeks"
}
```

## Test State Files

### Valid Initial State
```json
{
  "currentCycle": "1.1",
  "currentSubCycle": "requirements-analysis",
  "status": "active",
  "timestamp": "2025-12-03T17:59:00Z",
  "projectName": "test-project",
  "history": [],
  "decisions": []
}
```

### Mid-Foundation State
```json
{
  "currentCycle": "1.2",
  "currentSubCycle": "architecture-decisions",
  "status": "active",
  "timestamp": "2025-12-03T19:30:00Z",
  "projectName": "test-project",
  "history": [
    {
      "cycle": "1.1",
      "completed": "2025-12-03T19:00:00Z",
      "duration": "1.5h"
    }
  ],
  "decisions": [
    {
      "id": "req-001",
      "timestamp": "2025-12-03T18:30:00Z",
      "context": "User authentication method",
      "decision": "JWT with refresh tokens"
    }
  ]
}
```

### Feature Cycle State
```json
{
  "currentCycle": "2.3",
  "currentSubCycle": "testing-qa",
  "status": "active",
  "timestamp": "2025-12-05T14:20:00Z",
  "projectName": "test-project",
  "history": [
    {
      "cycle": "1.1",
      "completed": "2025-12-03T19:00:00Z",
      "duration": "1.5h"
    },
    {
      "cycle": "1.2",
      "completed": "2025-12-03T21:30:00Z",
      "duration": "2.5h"
    },
    {
      "cycle": "1.3",
      "completed": "2025-12-04T10:00:00Z",
      "duration": "1h"
    },
    {
      "cycle": "2.1",
      "completed": "2025-12-04T16:00:00Z",
      "duration": "3h"
    },
    {
      "cycle": "2.2",
      "completed": "2025-12-05T12:00:00Z",
      "duration": "4h"
    }
  ],
  "decisions": [
    {
      "id": "req-001",
      "timestamp": "2025-12-03T18:30:00Z",
      "context": "User authentication method",
      "decision": "JWT with refresh tokens"
    },
    {
      "id": "arch-001",
      "timestamp": "2025-12-03T20:15:00Z",
      "context": "Database selection",
      "decision": "PostgreSQL with Redis cache"
    }
  ]
}
```

## Mock Tool Responses

### AWS Documentation Search
```json
{
  "results": [
    {
      "title": "AWS Lambda Developer Guide",
      "url": "https://docs.aws.amazon.com/lambda/latest/dg/",
      "context": "Complete guide for developing Lambda functions",
      "rank_order": 1
    },
    {
      "title": "Lambda Best Practices",
      "url": "https://docs.aws.amazon.com/lambda/latest/dg/best-practices.html",
      "context": "Performance and security best practices",
      "rank_order": 2
    }
  ]
}
```

### Web Search Results
```json
{
  "results": [
    {
      "title": "React Best Practices 2025",
      "url": "https://example.com/react-best-practices",
      "snippet": "Modern React development patterns and practices",
      "publishedDate": "2025-11-15T10:00:00Z",
      "domain": "example.com"
    }
  ]
}
```

## Error Scenarios

### Corrupted State File
```json
{
  "currentCycle": "1.2",
  "status": "active",
  // Missing required fields: timestamp, projectName
  "invalidField": "should not exist"
}
```

### Invalid Cycle Transition
```json
{
  "currentCycle": "1.1",
  "requestedTransition": "2.1", // Invalid: skipping foundation cycles
  "expectedError": "Cannot skip to feature cycle without completing foundation"
}
```

### Tool Failure Simulation
```json
{
  "toolName": "aws_knowledge_search",
  "errorType": "timeout",
  "errorMessage": "Request timed out after 30 seconds",
  "fallbackAction": "use_web_search"
}
```

## Test Scenarios

### Happy Path Scenarios
1. **Complete Foundation Cycle**: Start → 1.1 → 1.2 → 1.3 → 2.1
2. **Feature Development**: 2.1 → 2.2 → 2.3 → 2.4 → 3.1
3. **Decision Making**: Research → Options → Recommendation → Choice → Log

### Edge Case Scenarios
1. **Empty Requirements**: Handle minimal or missing requirements
2. **Large Project**: Test with complex, multi-component projects
3. **Rapid Transitions**: Quick succession of state changes
4. **Long Pauses**: Resume after extended inactivity

### Error Recovery Scenarios
1. **State Corruption**: Recover from invalid state file
2. **Missing Files**: Handle missing cycle or decision files
3. **Tool Failures**: Graceful degradation when tools unavailable
4. **Network Issues**: Handle connectivity problems

## Performance Test Data

### Load Test Parameters
- **Concurrent Operations**: 1, 5, 10, 20
- **File Sizes**: 1KB, 100KB, 1MB, 10MB
- **Decision Complexity**: Simple (2 options), Complex (5+ options)
- **Research Depth**: Quick (1 tool), Thorough (3+ tools)

### Stress Test Scenarios
- **Rapid State Changes**: 100 transitions in 1 minute
- **Large Decision Logs**: 1000+ decisions
- **Memory Pressure**: Large file operations
- **Extended Sessions**: 8+ hour continuous operation

## Validation Criteria

### Functional Validation
- All required fields present
- Valid data types and formats
- Correct state transitions
- Proper error handling

### Performance Validation
- Response times within thresholds
- Memory usage within limits
- No resource leaks
- Graceful degradation

### Quality Validation
- Decision logs complete and accurate
- Metrics collection working
- Backup creation successful
- Recovery procedures effective
