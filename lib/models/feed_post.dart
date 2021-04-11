import 'package:food_insta/models/product.dart';

class FeedPost {
  Product product;
  String createdAt;
  String postStaticId;
  int numOfRequests;
  bool isRequested = false;

  FeedPost({this.product});

  FeedPost.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    createdAt = json['created_at'];
    postStaticId = json['static_id'];
    numOfRequests = json['num_of_requests'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    data['created_at'] = this.createdAt;
    data['static_id'] = this.postStaticId;
    data['num_of_requests'] = this.numOfRequests;
    return data;
  }
}
