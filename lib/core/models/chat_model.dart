class ChatModel{
  final String? imagePath;
  final String? name;
  final String? content;
  final int? unreadCount;
  final String? status;
  final bool? isRead;
  final DateTime? dateTime;

  ChatModel({
    this.imagePath,
    this.name,
    this.content,
    this.unreadCount,
    this.status,
    this.isRead=false,
    this.dateTime,
  });

}