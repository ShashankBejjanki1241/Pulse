# Core/Storage

Core Data models and storage-related functionality for the Pulse app.

## Core Data Model

The `PulseModel.xcdatamodeld` contains the data model definition with the following entities:

### User
- `id: String` (Primary Key) - Unique user identifier
- `name: String` - User's display name
- `avatarURL: String` - URL to user's avatar image
- `presence: String` - User's current presence status

### Channel
- `id: String` (Primary Key) - Unique channel identifier
- `name: String` - Channel display name
- `lastMessageAt: Date` - Timestamp of the last message
- `unreadCount: Int16` - Number of unread messages

### Message
- `id: String` (Primary Key) - Unique message identifier
- `localId: String` - Local message identifier for offline support
- `channelId: String` - ID of the channel this message belongs to
- `authorId: String` - ID of the user who sent the message
- `text: String` - Message content
- `createdAt: Date` - Message creation timestamp
- `deliveredAt: Date` - Message delivery timestamp
- `status: String` - Message delivery status

### Incident
- `id: String` (Primary Key) - Unique incident identifier
- `title: String` - Incident title
- `severity: String` - Incident severity level
- `status: String` - Current incident status
- `assigneeId: String` - ID of the assigned user
- `updatedAt: Date` - Last update timestamp

### Outbox
- `id: UUID` (Primary Key) - Unique outbox entry identifier
- `kind: String` - Type of operation (message, incident, etc.)
- `payloadJSON: String` - JSON payload for the operation
- `createdAt: Date` - Creation timestamp
- `retryCount: Int16` - Number of retry attempts

## Structure
- **PulseModel.xcdatamodeld** - Core Data model definition
- **Models** - Core Data entity classes (auto-generated)
- **Services** - Data persistence services
- **Extensions** - Core Data extensions and utilities
