class Image {
  String type;
  String url;
  bool isReviewed;
  bool isApproved;
  String externalId;
  String thumbnail;
  int width;
  int height;
  String secureUrl;
  double diskSize;
  String format;

  Image(
      {this.type,
      this.url,
      this.isReviewed,
      this.isApproved,
      this.externalId,
      this.thumbnail,
      this.width,
      this.height,
      this.secureUrl,
      this.diskSize,
      this.format});

  Image.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
    isReviewed = json['isReviewed'];
    isApproved = json['isApproved'];
    externalId = json['externalId'];
    thumbnail = json['thumbnail'];
    width = json['width'];
    height = json['height'];
    secureUrl = json['secureUrl'];
    diskSize = json['diskSize'];
    format = json['format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['url'] = this.url;
    data['isReviewed'] = this.isReviewed;
    data['isApproved'] = this.isApproved;
    data['externalId'] = this.externalId;
    data['thumbnail'] = this.thumbnail;
    data['width'] = this.width;
    data['height'] = this.height;
    data['secureUrl'] = this.secureUrl;
    data['diskSize'] = this.diskSize;
    data['format'] = this.format;
    return data;
  }
}
