class AddressModel {
  int? addressesId;
  int? addressesUsersID;
  String? addressesCity;
  String? addressesStreet;
  double? addressesLat;
  double? addressesLong;
  String? addressesPhone;
  String? createdAt;
  String? updatedAt;
  String? addressesName;

  AddressModel({
    this.addressesId,
    this.addressesUsersID,
    this.addressesCity,
    this.addressesStreet,
    this.addressesLat,
    this.addressesLong,
    this.addressesPhone,
    this.createdAt,
    this.updatedAt,
    this.addressesName,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressesId = json['addresses_id'];
    addressesUsersID = json['addresses_usersID'];
    addressesCity = json['addresses_city'];
    addressesStreet = json['addresses_street'];
    addressesLat = json['addresses_lat'];
    addressesLong = json['addresses_long'];
    addressesPhone = json['addresses_phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    addressesName = json['addresses_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addresses_id'] = this.addressesId;
    data['addresses_usersID'] = this.addressesUsersID;
    data['addresses_city'] = this.addressesCity;
    data['addresses_street'] = this.addressesStreet;
    data['addresses_lat'] = this.addressesLat;
    data['addresses_long'] = this.addressesLong;
    data['addresses_phone'] = this.addressesPhone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['addresses_name'] = this.addressesName;
    return data;
  }
}

// {
//     "addresses_id": 3,
//     "addresses_usersID": 2,
//     "addresses_city": "baha",
//     "addresses_street": "jasem",
//     "addresses_lat": 19.8274996,
//     "addresses_long": 41.7097686,
//     "addresses_phone": "0569700683",
//     "created_at": "2026-01-28T05:59:08.000000Z",
//     "updated_at": "2026-01-28T05:59:08.000000Z",
//     "addresses_name": "hatem"
// }
