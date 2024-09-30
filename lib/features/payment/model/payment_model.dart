class Payment {
  String? url;
  String? message;

  Payment({
    this.url,
    this.message,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    url: json["url"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "message": message,
  };
}
