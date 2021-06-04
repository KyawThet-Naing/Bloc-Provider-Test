class JsonOb {
  int? id, userId;
  String? title, body;

  JsonOb.fromJson(Map<String, dynamic> data) {
    this.id = data['id'];
    this.userId = data['userId'];
    this.title = data['title'];
    this.body = data['body'];
  }
}
