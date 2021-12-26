class ResGoogleSignInModel {
  String? displayName;
  String? email;
  String? photoUrl;
  String? id;
  String? token;

  ResGoogleSignInModel({
    required this.displayName,
    required this.email,
    required this.photoUrl,
    required this.id,
    required this.token,
  });

  ResGoogleSignInModel.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['email'] = this.email;
    data['photoUrl'] = this.photoUrl;
    data['id'] = this.id;
    data['token'] = this.token;
    return data;
  }
}
