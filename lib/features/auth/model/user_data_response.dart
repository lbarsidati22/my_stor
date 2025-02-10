class UserDataResponse {
  bool? status;
  String? message;
  UserData? data;

  UserDataResponse({this.status, this.message, this.data});

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory UserDataResponse.fromMap(Map<String, dynamic> map) {
    return UserDataResponse(
      status: map['status'],
      message: map['message'],
      data: map['data'] != null ? UserData.fromMap(map['data']) : null,
    );
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  UserData(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.image,
      this.points,
      this.credit,
      this.token});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'points': points,
      'credit': credit,
      'token': token,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      points: json['points'],
      credit: (json['credit']),
      token: json['token'],
    );
  }
}
