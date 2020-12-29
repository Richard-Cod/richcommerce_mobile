class Address {
  int id;
  String name;
  String firstname;
  String lastname;
  String compagny;
  String address;
  String postal;
  String city;
  String country;
  String phone;

  Address(
      {this.id,
        this.name,
        this.firstname,
        this.lastname,
        this.compagny,
        this.address,
        this.postal,
        this.city,
        this.country,
        this.phone});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    compagny = json['compagny'];
    address = json['address'];
    postal = json['postal'];
    city = json['city'];
    country = json['country'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['compagny'] = this.compagny;
    data['address'] = this.address;
    data['postal'] = this.postal;
    data['city'] = this.city;
    data['country'] = this.country;
    data['phone'] = this.phone;
    return data;
  }

  @override
  String toString() {
    return 'Address{id: $id, name: $name, firstname: $firstname, lastname: $lastname, compagny: $compagny, address: $address, postal: $postal, city: $city, country: $country, phone: $phone}';
  }
}
