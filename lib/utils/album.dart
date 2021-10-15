class Album {
  final String cnt;
  final bool isBot;

  Album({
    required this.cnt,
    this.isBot = true,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      cnt: json['cnt'],
    );
  }
}
