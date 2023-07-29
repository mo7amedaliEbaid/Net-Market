class Store {
  String? name;
  String? url;
  bool? sslEnabled;
  String? secureUrl;
  Null? hosts;
  String? defaultLanguageId;
  Null? defaultWarehouseId;
  int? displayOrder;
  String? companyName;
  Null? companyAddress;
  String? companyPhoneNumber;
  String? companyRegNo;
  String? companyVat;
  String? bannar;
  String? picture;
  String? id;

  Store(
      {this.name,
        this.url,
        this.sslEnabled,
        this.secureUrl,
        this.hosts,
        this.defaultLanguageId,
        this.defaultWarehouseId,
        this.displayOrder,
        this.companyName,
        this.companyAddress,
        this.companyPhoneNumber,
        this.companyRegNo,
        this.companyVat,
        this.bannar,
        this.picture,
        this.id});

  Store.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    url = json['Url'];
    sslEnabled = json['SslEnabled'];
    secureUrl = json['SecureUrl'];
    hosts = json['Hosts'];
    defaultLanguageId = json['DefaultLanguageId'];
    defaultWarehouseId = json['DefaultWarehouseId'];
    displayOrder = json['DisplayOrder'];
    companyName = json['CompanyName'];
    companyAddress = json['CompanyAddress'];
    companyPhoneNumber = json['CompanyPhoneNumber'];
    companyRegNo = json['CompanyRegNo'];
    companyVat = json['CompanyVat'];
    bannar = json['Bannar'];
    picture = json['Picture'];
    id = json['Id'];
  }
}