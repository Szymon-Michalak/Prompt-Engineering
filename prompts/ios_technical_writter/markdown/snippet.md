```markdown
# Generic Analytics Service for Multiple Providers
Create a generic analytics service in Swift that supports multiple providers like Firebase, MixPanel, and Google Analytics.

<details>

**URL:** [Full Implementation](https://gist.github.com/aryamansharda/c0b5399de9fde061e9d46b61887be527)

**Source:** [Ace the iOS Interview](/docs/resourcesDocs/books/AceTheiOSInterview.md)

**Author:** `Aryaman Sharda`

**Tags:**  
`Analytics`, `iOS`, `Swift`, `Firebase`, `MixPanel`, `Google Analytics`

**Platforms Supported:** iOS

**Swift Version:** 5.0
</details>

## Overview
This snippet demonstrates how to create a loosely coupled analytics service using protocol-oriented programming and dependency injection to support multiple analytics providers.

## Code

```swift
protocol AnalyticsProvider {
    func sendAnalyticsEvent(named name: String, metadata: [String : Any]?)
}

// Firebase implementation
struct FirebaseAnalyticsProvider: AnalyticsProvider {
    func sendAnalyticsEvent(named name: String, metadata: [String : Any]?) {
        Analytics.logEvent(name, parameters: metadata)
    }
}

// Manager for handling different providers
class AnalyticsManager {
    private var provider: AnalyticsProvider?
    static var shared = AnalyticsManager()
    private init() {}
    
    func configure(provider: AnalyticsProvider) {
        self.provider = provider
    }
    
    func track(eventName: String, metadata: [String: Any]?) {
        guard let provider = provider else {
            print("Analytics provider not provided.")
            return
        }
        provider.sendAnalyticsEvent(named: eventName, metadata: metadata)
    }
}
```

```swift
// Configuration example in AppDelegate
AnalyticsManager.shared.configure(provider: FirebaseAnalyticsProvider())
```

## Usage
```swift
// Example of tracking an event
AnalyticsManager.shared.track(eventName: "user_clicked_forgot_password", metadata: ["userID": "exampleUserID"])
```

## Notes
- **Flexibility:** Easily switch between different analytics providers without code changes.
- **Scalability:** The service is designed to be scalable and maintainable.

## Related Snippets
- [Creating a Logger](#)
- [Networking and Basic Codables](#)

<LinkCard title="Read Full Snippet" href="https://gist.github.com/aryamansharda/c0b5399de9fde061e9d46b61887be527" />
``` 

### Template Use:
- **Overview:** Explain the snippet's purpose, use case, and how it improves code maintainability.
- **Code:** Provide the key code snippets that showcase the functionality.
- **Usage:** Show how to implement the snippet in a real-world scenario.
- **Notes:** Highlight important aspects or advantages of the implementation.
- **Related Snippets:** Link to other relevant code snippets.