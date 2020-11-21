class ToDo {
  String title;
  String subtitle;
  String id;
  ToDo({this.title, this.subtitle});

  //Método para convertir lista en string
  ToDo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
  }

  // ignore: missing_return
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['title'] = title;
    json['subtitle'] = subtitle;
  }
}
