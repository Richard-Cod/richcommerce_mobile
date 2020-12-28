class OrderDetail {
  int id;
  String theOrder;
  String product;
  int quantity;
  int price;
  int total;

  OrderDetail(
      {this.id,
        this.theOrder,
        this.product,
        this.quantity,
        this.price,
        this.total});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    theOrder = json['theOrder'];
    product = json['product'];
    quantity = json['quantity'];
    price = json['price'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['theOrder'] = this.theOrder;
    data['product'] = this.product;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['total'] = this.total;
    return data;
  }
}
