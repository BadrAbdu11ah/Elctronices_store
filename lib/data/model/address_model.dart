class AddressModel {
  final int? addressesId;
  final int? addressesUsersID;
  final String? addressesCity;
  final String? addressesStreet;
  final double? addressesLat;
  final double? addressesLong;
  final String? addressesPhone;
  final String? createdAt;
  final String? updatedAt;
  final String? addressesName;

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

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      addressesId: json['addresses_id'],
      addressesUsersID: json['addresses_usersID'],
      addressesCity: json['addresses_city'],
      addressesStreet: json['addresses_street'],
      addressesLat: json['addresses_lat']?.toDouble(),
      addressesLong: json['addresses_long']?.toDouble(),
      addressesPhone: json['addresses_phone'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      addressesName: json['addresses_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addresses_id': addressesId,
      'addresses_usersID': addressesUsersID,
      'addresses_city': addressesCity,
      'addresses_street': addressesStreet,
      'addresses_lat': addressesLat,
      'addresses_long': addressesLong,
      'addresses_phone': addressesPhone,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'addresses_name': addressesName,
    };
  }

  AddressModel copyWith({
    int? addressesId,
    int? addressesUsersID,
    String? addressesCity,
    String? addressesStreet,
    double? addressesLat,
    double? addressesLong,
    String? addressesPhone,
    String? createdAt,
    String? updatedAt,
    String? addressesName,
  }) {
    return AddressModel(
      addressesId: addressesId ?? this.addressesId,
      addressesUsersID: addressesUsersID ?? this.addressesUsersID,
      addressesCity: addressesCity ?? this.addressesCity,
      addressesStreet: addressesStreet ?? this.addressesStreet,
      addressesLat: addressesLat ?? this.addressesLat,
      addressesLong: addressesLong ?? this.addressesLong,
      addressesPhone: addressesPhone ?? this.addressesPhone,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      addressesName: addressesName ?? this.addressesName,
    );
  }
}
