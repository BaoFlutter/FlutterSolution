class ResponseProduct {
  String? code;
  String? msg;
  List<Product>? list;

  ResponseProduct({this.code, this.msg, this.list});

  ResponseProduct.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? id;
  String? nameCategoryProduct;
  int? idCategoryProduct;
  String? urlPhoto;
  String? name;
  String? price;
  String? description;
  String? type;
  List<String>? size;
  List<OthersImage>? othersImage;

  Product(
      {this.id,
        this.nameCategoryProduct,
        this.idCategoryProduct,
        this.urlPhoto,
        this.name,
        this.price,
        this.description,
        this.type,
        this.size,
        this.othersImage});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameCategoryProduct = json['name_category_product'];
    idCategoryProduct = json['id_category_product'];
    urlPhoto = json['url_photo'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    type = json['type'];
    size = json['size'].cast<String>();
    if (json['othersImage'] != null) {
      othersImage = [];
      json['othersImage'].forEach((v) {
        othersImage!.add(new OthersImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_category_product'] = this.nameCategoryProduct;
    data['id_category_product'] = this.idCategoryProduct;
    data['url_photo'] = this.urlPhoto;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['type'] = this.type;
    data['size'] = this.size;
    if (this.othersImage != null) {
      data['othersImage'] = this.othersImage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OthersImage {
  String? color;
  List<String>? urlPhoto;

  OthersImage({this.color, this.urlPhoto});

  OthersImage.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    urlPhoto = json['url_photo'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['url_photo'] = this.urlPhoto;
    return data;
  }
}