class HomeCardResponse {
  String? displayImage;
  String? cardName;
  String? cardDistance;
  String? cardDate;
  String? cardPrice;
  String? cardrating;

  HomeCardResponse({this.displayImage, this.cardName, this.cardDistance, this.cardDate, this.cardPrice, this.cardrating});

  HomeCardResponse.fromJson(Map<String, dynamic> json) {
    displayImage = json['displayImage'];
    cardName = json['cardName'];
    cardDistance = json['cardDistance'];
    cardDate = json['cardDate'];
    cardPrice = json['cardPrice'];
    cardrating = json['cardrating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['displayImage'] = displayImage;
    data['cardName'] = cardName;
    data['cardDistance'] = cardDistance;
    data['cardDate'] = cardDate;
    data['cardPrice'] = cardPrice;
    data['cardrating'] = cardrating;
    return data;
  }
}
