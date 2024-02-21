class Room {
  final String roomId;
  final String displayImage;
  final String cardName;
  final String cardDistance;
  final String cardDate;
  final String cardPrice;
  final String cardRating;

  Room({
    required this.roomId,
    required this.displayImage,
    required this.cardName,
    required this.cardDistance,
    required this.cardDate,
    required this.cardPrice,
    required this.cardRating,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      roomId: json["roomId"] ?? '',
      displayImage: json['displayImage'] ?? '',
      cardName: json['cardName'] ?? '',
      cardDistance: json['cardDistance'] ?? '',
      cardDate: json['cardDate'] ?? '',
      cardPrice: json['cardPrice'] ?? '',
      cardRating: json['cardRating'] ?? '',
    );
  }
}
