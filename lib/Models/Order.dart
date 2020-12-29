class Order {
  int id;
  String createdAt;
  String total;
  String carrierName;
  double carrierPrice;
  String adress;
  List<String> orderDetails;
  bool isPaid;
  String reference;

  Order(
      {this.id,
        this.createdAt,
        this.total,
        this.carrierName,
        this.carrierPrice,
        this.adress,
        this.orderDetails,
        this.isPaid,
        this.reference});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    total = json['total'];
    carrierName = json['carrierName'];
    carrierPrice = json['carrierPrice'];
    adress = json['adress'];
    orderDetails = json['orderDetails'].cast<String>();
    isPaid = json['isPaid'];
    reference = json['reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['total'] = this.total;
    data['carrierName'] = this.carrierName;
    data['carrierPrice'] = this.carrierPrice;
    data['adress'] = this.adress;
    data['orderDetails'] = this.orderDetails;
    data['isPaid'] = this.isPaid;
    data['reference'] = this.reference;
    return data;
  }

  @override
  String toString() {
    return 'Order{id: $id, createdAt: $createdAt, total: $total, carrierName: $carrierName, carrierPrice: $carrierPrice, adress: $adress, orderDetails: $orderDetails, isPaid: $isPaid, reference: $reference}';
  }
}
