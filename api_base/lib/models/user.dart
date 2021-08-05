class User {
  Name? name;
  Picture? picture;
  String? email;
  String? phone;

  User({this.name, this.picture, this.email, this.phone});

  User.fromJson(Map<String, dynamic> json)
      : this.name = new Name.fromJson(json['name']),
        this.picture = new Picture.fromJson(json['picture']),
        this.email = json['email'],
        this.phone = json['phone'];
}

class Name {
  String? last;
  String? first;

  Name({this.last, this.first});

  Name.fromJson(Map<String, dynamic> json)
      : this.last = json['last'],
        this.first = json['first'];
}

class Picture {
  String? medium;

  Picture({this.medium});

  Picture.fromJson(Map<String, dynamic> json) : medium = json['large'];
}






