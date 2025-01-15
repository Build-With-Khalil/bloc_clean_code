/// postId : 1
/// id : 1
/// name : "id labore ex et quam laborum"
/// email : "Eliseo@gardner.biz"
/// body : "laudantium enim quasi est quidem magnam voluptate ipsam eos\temporary quo necessitates\dolorous quam after quasi\cisgendered et nam sapient accusation"
library;

class PostsApiModel {
  PostsApiModel({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) {
    _postId = postId;
    _id = id;
    _name = name;
    _email = email;
    _body = body;
  }

  PostsApiModel.fromJson(dynamic json) {
    _postId = json['postId'];
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _body = json['body'];
  }

  int? _postId;
  int? _id;
  String? _name;
  String? _email;
  String? _body;

  int? get postId => _postId;

  int? get id => _id;

  String? get name => _name;

  String? get email => _email;

  String? get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['postId'] = _postId;
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['body'] = _body;
    return map;
  }
}
