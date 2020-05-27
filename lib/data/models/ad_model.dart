class Ad {
  int id;
  String title;
  String body;
  String image;
  String created_at;

  Ad({this.id, this.title, this.body, this.image, this.created_at});

  @override
  String toString() {
    return "{emmy  lol \n id: ${this.id},\ntitle: ${this.title},\nbody: ${this.body},\nimage: ${this.image},\ncreated_at: ${this.created_at}\n}";
  }
}
