class LoginModel {
  late String status;
  late List<AuthToken> data;

  LoginModel({required this.status, required this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? '';
    data = (json['data'] as List<dynamic>?)
        ?.map((item) => AuthToken.fromJson(item))
        .toList() ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['data'] = this.data.map((item) => item.toJson()).toList();
    return data;
  }
}

class AuthToken {
  late String token;

  AuthToken({required this.token});

  AuthToken.fromJson(Map<String, dynamic> json) {
    token = json['token'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = token;
    return data;
  }
}
