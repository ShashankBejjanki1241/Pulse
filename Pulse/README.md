# Pulse

**Pulse = real-time iOS ops chat & incident feed**

A modern iOS application for real-time operations chat and incident management, built with SwiftUI and following clean architecture principles.

## Tech Stack

- **Platform**: iOS 18.5+
- **Language**: Swift 5.0
- **UI Framework**: SwiftUI
- **Data Persistence**: SwiftData
- **Architecture**: MVVM + Dependency Injection
- **Development**: Xcode 16.4+

## Project Structure

```
Pulse/
├── App/                    # App entry point and DI container
├── Core/                   # Core functionality and shared components
├── Networking/             # Network layer and API communication
├── Storage/                # Data persistence and storage management
├── Security/               # Security-related functionality and encryption
├── Observability/          # Logging, analytics, and monitoring
├── Utilities/              # Common utilities and helper functions
├── Features/               # Feature modules
│   ├── Auth/              # Authentication and user management
│   ├── Chat/              # Real-time messaging and communication
│   ├── Incidents/         # Incident management and reporting
│   └── Presence/          # User presence and status management
├── DesignSystem/           # Reusable UI components and design tokens
├── Tools/                  # Development tools and scripts
│   ├── MockServer/        # Development mock server
│   └── scripts/           # Build and development scripts
└── Tests/                  # Test suites
    ├── Unit/              # Unit tests
    └── UI/                # UI and integration tests
```

## Quick Start

### Prerequisites

- Xcode 16.4 or later
- iOS 18.5+ deployment target
- Swift 5.0+

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd Pulse
   ```

2. Open the project in Xcode:
   ```bash
   open Pulse.xcodeproj
   ```

3. Build and run the project:
   - Select your target device or simulator
   - Press `Cmd + R` to build and run

### Development Setup

1. The project uses SwiftData for data persistence
2. Dependency injection is handled through the `DIContainer` in the App folder
3. Follow the established folder structure for new features
4. Add unit tests for new functionality in the appropriate test folders

## Contributing

1. Follow the established project structure
2. Write unit tests for new features
3. Use SwiftUI for UI components
4. Follow MVVM architecture patterns
5. Update documentation as needed

## License

[Add your license information here]
