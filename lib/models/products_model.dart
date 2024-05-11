class ProductModel {
  String? productName;
  int? productPrice;
  String? productImage;

  ProductModel({this.productName, this.productPrice, this.productImage});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['productName'],
      productPrice: json['productPrice'],
      productImage: json['productImage'],
    );
  }

  Map<String, dynamic> toJson() { 
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = productName;
    data['productPrice'] = productPrice;
    data['productImage'] = productImage;
    return data;
  }
}
