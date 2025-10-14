class Sliderr {
  String? image;

  Sliderr({this.image});

  factory Sliderr.fromJson(Map<String, dynamic> json) {
    return Sliderr(image: json['image'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {'image': image};
  }
}
