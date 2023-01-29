 class Address {
  String? name;
  String? street;
  String? isoCountryCode;
  String? country;
  String? postalCode;
  String? administrativeArea;
  String? subadministrativeArea;
  String? locality;
  String? sublocality;
  String? thoroughfare;
  String? subthoroughfare;

  Address(
      {this.name,
      this.street,
      this.isoCountryCode,
      this.country,
      this.postalCode,
      this.administrativeArea,
      this.subadministrativeArea,
      this.locality,
      this.sublocality,
      this.thoroughfare,
      this.subthoroughfare});

  Address.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    street = json['street'];
    isoCountryCode = json['isoCountryCode'];
    country = json['country'];
    postalCode = json['postalCode'];
    administrativeArea = json['administrativeArea'];
    subadministrativeArea = json['subadministrativeArea'];
    locality = json['locality'];
    sublocality = json['sublocality'];
    thoroughfare = json['thoroughfare'];
    subthoroughfare = json['subthoroughfare'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['street'] = street;
    data['isoCountryCode'] = isoCountryCode;
    data['country'] = country;
    data['postalCode'] = postalCode;
    data['administrativeArea'] = administrativeArea;
    data['subadministrativeArea'] = subadministrativeArea;
    data['locality'] = locality;
    data['sublocality'] = sublocality;
    data['thoroughfare'] = thoroughfare;
    data['subthoroughfare'] = subthoroughfare;
    return data;
  }
}
