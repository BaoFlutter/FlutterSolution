class Cart {
  int? id;
  int? idCategoryProduct;
  String? name;
  String? type;
  String? urlPhoto;
  String? color;
  String? size;
  int? price;
  int? amount;

  Cart({this.id,this.idCategoryProduct, this.name, this.type, this.urlPhoto,this.color,this.size, this.price, this.amount});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idCategoryProduct = json['id_category_product'];
    name = json['name'];
    type = json['type'];
    urlPhoto = json['url_photo'];
    color = json['color'];
    size = json['size'];
    price = json['price'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_category_product'] = this.idCategoryProduct;
    data['name'] = this.name;
    data['type'] = this.type;
    data['url_photo'] = this.urlPhoto;
    data['color'] = this.color;
    data['size'] = this.size;
    data['price'] = this.price;
    data['amount'] = this.amount;
    return data;
  }
}