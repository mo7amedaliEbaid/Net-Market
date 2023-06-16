class Branch {
 // String id;
  String name;
  String description;
 dynamic? imageUrl;
//  double latitude;
//  double longitude;
 // Address address;

  Branch({
  //  required this.id,
    required this.name,
    required this.description,
    this.imageUrl,
   // required this.latitude,
  //  required this.longitude,
 //   required this.address,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    //id: json["Id"],
    name: json["Name"],
    description: json["Description"],
   imageUrl: json["ImageURL"]??null,
   // latitude: json["Latitude"]?.toDouble(),
   // longitude: json["Longitude"]?.toDouble(),
   // address: Address.fromJson(json["Address"]),
  );
  static List<Branch> branchesFromSnapshot(List branchesSnapshot) {
    return branchesSnapshot.map((json) {
      return Branch.fromJson(json);
    }).toList();
  }

}

/*
class Address {
  String id;
  dynamic firstName;
  dynamic lastName;
  dynamic email;
  dynamic company;
  String countryId;
  String stateProvinceId;
  String areaId;
  dynamic blockId;
  dynamic streetId;
  dynamic city;
  String phoneNumber;
  dynamic latitude;
  dynamic longitude;

  Address({
    required this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.company,
    required this.countryId,
    required this.stateProvinceId,
    required this.areaId,
    this.blockId,
    this.streetId,
    this.city,
    required this.phoneNumber,
    this.latitude,
    this.longitude,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["Id"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    email: json["Email"],
    company: json["Company"],
    countryId: json["CountryId"],
    stateProvinceId: json["StateProvinceId"],
    areaId: json["AreaId"],
    blockId: json["BlockId"],
    streetId: json["StreetId"],
    city: json["City"],
    phoneNumber: json["PhoneNumber"],
    latitude: json["Latitude"],
    longitude: json["Longitude"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "FirstName": firstName,
    "LastName": lastName,
    "Email": email,
    "Company": company,
    "CountryId": countryId,
    "StateProvinceId": stateProvinceId,
    "AreaId": areaId,
    "BlockId": blockId,
    "StreetId": streetId,
    "City": city,
    "PhoneNumber": phoneNumber,
    "Latitude": latitude,
    "Longitude": longitude,
  };
}*/
