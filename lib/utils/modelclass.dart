class MessageModel {
  String? message;
  String? sender;
  MessageModel(String message, String sender) {
    this.message = message;
    this.sender = sender;
  }
  String getMessage() {
    return message!;
  }

  void setMessage(String message) {
    this.message = message;
  }

  String getSender() {
    return sender!;
  }

  void setSender(String sender) {
    this.sender = sender;
  }
}
