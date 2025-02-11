class CategoryResponse {
  bool? status;
  String? message;
  Data? data;

  CategoryResponse({this.status, this.message, this.data});

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory CategoryResponse.fromMap(Map<String, dynamic> map) {
    return CategoryResponse(
      status: map['status'],
      message: map['message'],
      data: map['data'] != null ? Data.fromMap(map['data']) : null,
    );
  }
}

class Data {
  int? currentPage;
  List<CategoryData>? data;

  Data({
    this.currentPage,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'currentPage': currentPage,
      'data': data?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      currentPage: map['currentPage']?.toInt(),
      data: map['data'] != null
          ? List<CategoryData>.from(
              map['data']?.map((x) => CategoryData.fromMap(x)))
          : null,
    );
  }
}

class CategoryData {
  int? id;
  String? name;
  String? image;

  CategoryData({this.id, this.name, this.image});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory CategoryData.fromMap(Map<String, dynamic> map) {
    return CategoryData(
      id: map['id']?.toInt(),
      name: map['name'],
      image: map['image'],
    );
  }
}
