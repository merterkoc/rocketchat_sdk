import 'package:freezed_annotation/freezed_annotation.dart';
import '../user/user.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
@immutable
abstract class RocketChatMessage with _$RocketChatMessage {
  factory RocketChatMessage({
    @JsonKey(name: '_id') required String id,
    required String rid,
    @Default('') String msg,
    required String ts,
    @JsonKey(name: 'u') required RocketChatUser sender,
    @JsonKey(name: 't') String? type,
    List<RocketChatUser>? mentions,
    Map<String, dynamic>? reactions,
    List<Map<String, dynamic>>? attachments,
    Map<String, dynamic>? file,
    List<Map<String, dynamic>>? files,
    String? roomName,
    String? roomType,
  }) = _RocketChatMessage;

  factory RocketChatMessage.fromJson(Map<String, dynamic> json) =>
      _$RocketChatMessageFromJson(json);
}

extension RocketChatMessageMediaExtension on RocketChatMessage {
  static bool _looksLikeImagePath(String value) {
    final lower = value.split('?').first.toLowerCase();
    return lower.endsWith('.jpg') ||
        lower.endsWith('.jpeg') ||
        lower.endsWith('.png') ||
        lower.endsWith('.gif') ||
        lower.endsWith('.webp') ||
        lower.endsWith('.heic') ||
        lower.endsWith('.bmp');
  }

  static bool _looksLikeVideoPath(String value) {
    final lower = value.split('?').first.toLowerCase();
    return lower.endsWith('.mp4') ||
        lower.endsWith('.mov') ||
        lower.endsWith('.m4v') ||
        lower.endsWith('.webm') ||
        lower.endsWith('.mkv') ||
        lower.endsWith('.avi') ||
        lower.endsWith('.3gp');
  }

  List<String> get imageUrls {
    final urls = <String>[];

    if (attachments != null) {
      for (final att in attachments!) {
        final imageUrl = att['image_url'] as String?;
        if (imageUrl != null && imageUrl.trim().isNotEmpty) {
          urls.add(imageUrl.trim());
          continue;
        }
        final titleLink = att['title_link'] as String?;
        final imageType = att['image_type'] as String?;
        final type = att['type'] as String?;
        if (titleLink != null &&
            titleLink.trim().isNotEmpty &&
            ((imageType != null && imageType.startsWith('image/')) ||
                (type != null && type.startsWith('image/')) ||
                _looksLikeImagePath(titleLink))) {
          urls.add(titleLink.trim());
        }
      }
    }

    if (urls.isEmpty && files != null) {
      for (final f in files!) {
        final fileId = f['_id'] as String?;
        final fileName = f['name'] as String? ?? 'image.jpg';
        final mimeType = f['type'] as String? ?? '';
        if (fileId != null &&
            fileId.isNotEmpty &&
            (mimeType.startsWith('image/') || _looksLikeImagePath(fileName))) {
          urls.add('/file-upload/$fileId/${Uri.encodeComponent(fileName)}');
        }
      }
    }

    if (urls.isEmpty && file != null) {
      final fileId = file!['_id'] as String?;
      final fileName = file!['name'] as String? ?? 'image.jpg';
      final mimeType = file!['type'] as String? ?? '';
      if (fileId != null &&
          fileId.isNotEmpty &&
          (mimeType.startsWith('image/') || _looksLikeImagePath(fileName))) {
        urls.add('/file-upload/$fileId/${Uri.encodeComponent(fileName)}');
      }
    }

    return urls;
  }

  bool get hasImage => imageUrls.isNotEmpty;

  List<String> get videoUrls {
    final urls = <String>[];

    if (attachments != null) {
      for (final att in attachments!) {
        final videoUrl = att['video_url'] as String?;
        if (videoUrl != null && videoUrl.trim().isNotEmpty) {
          urls.add(videoUrl.trim());
          continue;
        }
        final titleLink = att['title_link'] as String?;
        final videoType = att['video_type'] as String?;
        final type = att['type'] as String?;
        if (titleLink != null &&
            titleLink.trim().isNotEmpty &&
            ((videoType != null && videoType.startsWith('video/')) ||
                (type != null && type.startsWith('video/')) ||
                _looksLikeVideoPath(titleLink))) {
          urls.add(titleLink.trim());
        }
      }
    }

    if (urls.isEmpty && files != null) {
      for (final f in files!) {
        final fileId = f['_id'] as String?;
        final fileName = f['name'] as String? ?? 'video.mp4';
        final mimeType = f['type'] as String? ?? '';
        if (fileId != null &&
            fileId.isNotEmpty &&
            (mimeType.startsWith('video/') || _looksLikeVideoPath(fileName))) {
          urls.add('/file-upload/$fileId/${Uri.encodeComponent(fileName)}');
        }
      }
    }

    if (urls.isEmpty && file != null) {
      final fileId = file!['_id'] as String?;
      final fileName = file!['name'] as String? ?? 'video.mp4';
      final mimeType = file!['type'] as String? ?? '';
      if (fileId != null &&
          fileId.isNotEmpty &&
          (mimeType.startsWith('video/') || _looksLikeVideoPath(fileName))) {
        urls.add('/file-upload/$fileId/${Uri.encodeComponent(fileName)}');
      }
    }

    return urls;
  }

  bool get hasVideo => videoUrls.isNotEmpty;

  String get attachmentDescription {
    if (attachments == null) return '';
    for (final att in attachments!) {
      final desc = att['description'] as String?;
      if (desc != null && desc.trim().isNotEmpty) {
        return desc.trim();
      }
    }
    return '';
  }
}
