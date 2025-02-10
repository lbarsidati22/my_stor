class SoftagiResponse {
  bool? status;
  String? message;
  Data? data;

  SoftagiResponse({
    this.status,
    this.message,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory SoftagiResponse.fromMap(Map<String, dynamic> map) {
    return SoftagiResponse(
      status: map['status'],
      message: map['message'],
      data: map['data'] != null ? Data.fromMap(map['data']) : null,
    );
  }
}

class Data {
  List<Banners>? banners;
  List<Products>? products;
  String? ad;

  Data({this.banners, this.products, this.ad});

  Map<String, dynamic> toMap() {
    return {
      'banners': banners?.map((x) => x?.toMap())?.toList(),
      'products': products?.map((x) => x?.toMap())?.toList(),
      'ad': ad,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      banners: map['banners'] != null
          ? List<Banners>.from(map['banners']?.map((x) => Banners.fromMap(x)))
          : null,
      products: map['products'] != null
          ? List<Products>.from(
              map['products']?.map((x) => Products.fromMap(x)))
          : null,
      ad: map['ad'],
    );
  }
}

class Banners {
  int? id;
  String? image;
  Category? category;

  Banners({
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

  factory Banners.fromMap(Map<String, dynamic> map) {
    return Banners(
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

class Products {
  int? id;
  double? price;
  double? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  Products(
      {this.id,
      this.price,
      this.oldPrice,
      this.discount,
      this.image,
      this.name,
      this.description,
      this.images,
      this.inFavorites,
      this.inCart});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'oldPrice': oldPrice,
      'discount': discount,
      'image': image,
      'name': name,
      'description': description,
      'images': images,
      'inFavorites': inFavorites,
      'inCart': inCart,
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      id: map['id']?.toInt(),
      price: map['price']?.toDouble(),
      oldPrice: map['old_price']?.toDouble(),
      discount: map['discount']?.toInt(),
      image: map['image'],
      name: map['name'],
      description: map['description'],
      images: List<String>.from(map['images']),
      inFavorites: map['in_favorites'],
      inCart: map['in_cart'],
    );
  }
}
