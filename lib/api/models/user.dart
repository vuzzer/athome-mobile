class User {
  String name,
      email,
      type,
      image,
      phone,
      birthDate,
      nationality,
      gender,
      address,
      language,
      currency,
      title,
      updatedAt,
      createdAt,
      id;

  User.fromJson(Map<String, dynamic> json) {
    this.id = json['id'].toString();
    this.name = json["name"].toString();
    this.email = json["email"].toString();
    this.type = json["type"].toString();
    this.image = json["image"].toString();
    this.phone = json["phone"].toString();
    this.birthDate = json["birth_date"].toString();
    this.nationality = json["nationality"].toString();
    this.gender = json["gender"].toString();
    this.address = json["address"].toString();
    this.language = json["language"].toString();
    this.currency = json["currency"].toString();
    this.title = json["title"].toString();
    this.updatedAt = json["updated_at"].toString();
    this.createdAt = json["created_at"].toString();
  }

  User();

  //
}
