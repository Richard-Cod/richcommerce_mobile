class Product {
  int id;
  String name;
  String slug;
  String illustration;
  String subtitle;
  String description;
  int price;

  Product(
      {this.id,
        this.name,
        this.slug,
        this.illustration,
        this.subtitle,
        this.description,
        this.price});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    illustration = json['illustration'];
    subtitle = json['subtitle'];
    description = json['description'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['illustration'] = this.illustration;
    data['subtitle'] = this.subtitle;
    data['description'] = this.description;
    data['price'] = this.price;
    return data;
  }
}
