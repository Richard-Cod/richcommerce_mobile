class User {
  int id;
  String email;
  String username;
  List<String> roles;
  String password;
  String firstname;
  String lastname;

  User(
      {this.id,
        this.email,
        this.username,
        this.roles,
        this.password,
        this.firstname,
        this.lastname});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    roles = json['roles'].cast<String>();
    password = json['password'];
    firstname = json['firstname'];
    lastname = json['lastname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['username'] = this.username;
    data['roles'] = this.roles;
    data['password'] = this.password;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    return data;
  }
}
