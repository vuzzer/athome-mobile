import 'package:book_medial_mobile/models/property.dart';

class Booking {
  int id;
  String startDate;
  String endDate;
  Null memo;
  int userId;
  Null serialNumber;
  String createdAt;
  String updatedAt;
  String status;
  String typeSejour;
  String startTime;
  String endTime;
  Property property;
  Purchase purchase;

  Booking({
    this.id,
    this.startDate,
    this.endDate,
    this.memo,
    this.userId,
    this.serialNumber,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.typeSejour,
    this.startTime,
    this.endTime,
    this.property,
    this.purchase,
  });

  Booking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    memo = json['memo'];
    userId = json['user_id'];
    serialNumber = json['serial_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    typeSejour = json['type_sejour'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    if (json['property'] != null) {
      property = Property.fromJson(json['property'][0]);
    }
    purchase = json['purchase'] != null
        ? new Purchase.fromJson(json['purchase'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['memo'] = this.memo;
    data['user_id'] = this.userId;
    data['serial_number'] = this.serialNumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['type_sejour'] = this.typeSejour;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    if (this.property != null) {
      data['property'] = this.property;
    }
    if (this.purchase != null) {
      data['purchase'] = this.purchase.toJson();
    }
    return data;
  }
}

class Purchase {
  int id;
  int price;
  int bookingId;
  String date;
  String transId;
  String signature;
  String status;
  String createdAt;
  String updatedAt;
  int state;

  Purchase({
    this.id,
    this.price,
    this.bookingId,
    this.date,
    this.transId,
    this.signature,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.state,
  });

  Purchase.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    bookingId = json['booking_id'];
    date = json['date'];
    transId = json['trans_id'];
    signature = json['signature'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['booking_id'] = this.bookingId;
    data['date'] = this.date;
    data['trans_id'] = this.transId;
    data['signature'] = this.signature;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['state'] = this.state;
    return data;
  }
}
