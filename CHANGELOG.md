## 0.7.0

- **Feature**: Extended `RocketChatMessage` model with:
  - `type` (`t`): System message type identifier (e.g. `uj` for user joined, `ul` for user left).
  - `mentions`: List of mentioned users (`List<RocketChatUser>`) in the message.
  - `roomName` and `roomType`: Resolved room name and type metadata received from realtime events.
- **Feature**: Extended `ChannelRoom` model with `lastMessage` (`RocketChatMessage`) to support channel previews and unread indicators.
- **Realtime API Enhancements**:
  - Added `subscriptionEventStream` on `RocketChatRealtimeApi` emitting `SubscriptionChangeEvent` for `stream-notify-user` rooms/subscriptions changed events.
  - Parsed extra metadata (`args[1]`) from `stream-room-messages` to enrich incoming realtime messages with `roomName` and `roomType`.
  - Added race-condition protection against duplicate WebSocket connections (`_isConnecting` flag).
  - Ensured previous WebSocket subscriptions and channel sinks are thoroughly cancelled before establishing reconnects.
  - Cleaned up subscription flags upon disconnects and auto-reconnects to ensure streams reliably resubscribe.

## 0.6.0

- **Feature**: Added `client.dm.create` (`POST /api/v1/dm.create` with fallback to `api/v1/im.create`) to create or open direct message (DM) rooms by username.
- **Feature**: Added `client.dm.sendMediaMessage` (`POST /api/v1/rooms.media/{roomId}` + `rooms.mediaConfirm/{roomId}/{fileId}` with fallback to `rooms.upload/{roomId}`) with `onSendProgress` callback and automatic MIME type inference for uploading image and video files.
- **Feature**: Extended `RocketChatMessage` model with `attachments`, `file`, and `files` fields and added `RocketChatMessageMediaExtension` (`imageUrls`, `videoUrls`, `hasImage`, `hasVideo`, `attachmentDescription`) for media attachment parsing.
- **Enhancement**: Updated `client.users.info` to support looking up user details by either `userId` or `username`.

## 0.5.0

- **Feature**: Added Push API support (`client.push.registerToken`) for Firebase Cloud Messaging integration.
- **Feature**: Implemented Rocket.Chat Realtime Presence support.
- **Fix**: Resolved `Realtime Message Parsing Error` (`type 'Null' is not a subtype of type 'String' in type cast`) during realtime room message processing.

## 0.4.0

- **Fix**: Included missing generated files (`.freezed.dart`, `.g.dart`) that were omitted in the `0.3.0` release.

## 0.3.0
- **Realtime API & WebSocket**: Improved WebSocket stream handling, message streaming, and presence status subscription support.
- **State Management Integration**: Optimized client interface for easier integration with state management patterns (e.g., BLoC) by exposing clean streams.
- **Pagination & Loading**: Enhanced support for message history pagination and lazy loading user profiles.
  

## 0.2.0

- **Subscriptions API Support**: Added `client.subscriptions.get` and `client.subscriptions.read` for fetching active room subscriptions and marking subscriptions as read.
- **Direct Message API Enhancements**: Added support for sending messages to DM rooms via `client.dm.sendMessage`.
- **User Avatar Support**: Added `client.users.getAvatar` API to retrieve user avatar URLs, resolving redirects automatically and substituting localhost/127.0.0.1 with the configured client base URL.
- **Client Traffic Logging**: Introduced logging capabilities via `enableLogging` and `logPrinter` options in `RocketChatClient` initialization.
- **Test Environment Support**: Updated tests to run dynamically using environment variables or a `.env` file configuration.

## 0.1.0

- Initial release of a fully modular, strictly-typed Rocket.Chat REST API SDK.
- Support for Auth API (`client.auth.login`, `client.auth.logout`, `client.auth.me`) with dynamic header management.
- Support for DM API (`client.dm.list`, `client.dm.messages`) for direct message chats.
- Support for Channels API (`client.channels.list`, `client.channels.create`, `client.channels.join`, `client.channels.leave`, `client.channels.history`, `client.channels.info`).
- Support for Users API (`client.users.list`, `client.users.info`, `client.users.create`, `client.users.delete`).
- Built-in type safety with immutable Freezed models.
- Fully validated under strict Very Good Analysis guidelines.
