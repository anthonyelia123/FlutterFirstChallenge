class ImageModel {
  String? image;
  ImageModel({this.image});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      image: json['small'],
    );
  }
}
