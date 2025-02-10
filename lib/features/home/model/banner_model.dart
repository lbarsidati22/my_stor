class BannerResponse {
  bool? status;
  String? message;
  List<BannerData>? data;

  BannerResponse({this.status, this.message, this.data});

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory BannerResponse.fromMap(Map<String, dynamic> map) {
    return BannerResponse(
      status: map['status'],
      message: map['message'],
      data: map['data'] != null
          ? List<BannerData>.from(
              map['data']?.map((x) => BannerData.fromMap(x)))
          : null,
    );
  }
}

class BannerData {
  int? id;
  String? image;
  Category? category;

  BannerData({
    this.id,
    this.image,
    this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'category': category?.toMap(),
    };
  }

  factory BannerData.fromMap(Map<String, dynamic> map) {
    return BannerData(
      id: map['id']?.toInt(),
      image: map['image'],
      category:
          map['category'] != null ? Category.fromMap(map['category']) : null,
    );
  }
}

class Category {
  int? id;
  String? image;
  String? name;

  Category({this.id, this.image, this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id']?.toInt(),
      image: map['image'],
      name: map['name'],
    );
  }
}
