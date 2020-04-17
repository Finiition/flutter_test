class CatDomain {
  String pathUrl;
  String name;

  CatDomain({this.pathUrl, this.name});

  factory CatDomain.fromJson(Map<String, dynamic> json) {
    return CatDomain(pathUrl: json['file'] ?? '');
  }
}
