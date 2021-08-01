class Property {
  int id, dayPrice, nightPrice;
  String name,
      description,
      address,
      country,
      contactName,
      contactNumber,
      street,
      city;
  List<String> facilities = [], beds = [];

  Property();

  Property.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json["name"].toString();
    this.description = json["description"].toString();
    this.address = json["address"].toString();
    this.country = json["country"].toString();
    this.contactName = json["contact_name"].toString();
    this.contactNumber = json["contact_number"].toString();
    this.street = json["street"].toString();
    this.city = json["city"].toString();
    this.dayPrice = json["price_per_day"];
    this.nightPrice = json["price_per_night"];

    if (json['facilities'] != null && json['facilities'].isNotEmpty) {
      json['facilities'].forEach((facility) {
        facilities.add(facility['name'].split(' ')[0]);
        // print(facility['name'].split(' ')[0]);
      });
    }

    if (json['bed_room'] != null && json['bed_room'].isNotEmpty) {
      json['bed_room'].forEach((bedrooms) {
        bedrooms['beds'].forEach((bed) {
          // print(bed['type']);
          this.beds.add(bed['type']);
        });
      });
    }
    //
  }

  //
}
