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
