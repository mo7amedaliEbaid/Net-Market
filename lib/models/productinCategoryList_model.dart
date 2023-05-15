class ProductbyCategory {
 String id;
  String name;
  /*dynamic shortDescription;
  dynamic fullDescription;*/
  double price;
  double oldPrice;
  List<ProductPicture> productPictures;
 // List<ProductAttribute> productAttribute;

  ProductbyCategory({
    required this.id,
    required this.name,
   // this.shortDescription,
  //  this.fullDescription,
    required this.price,
    required this.oldPrice,
    required this.productPictures,
    //required this.productAttribute,
  });

  factory ProductbyCategory.fromJson(Map<String, dynamic> json) => ProductbyCategory(
   id: json["Id"],
    name: json["Name"],
  // shortDescription: json["ShortDescription"],
   // fullDescription: json["FullDescription"],
   price: json["Price"],
   oldPrice: json["OldPrice"],
   productPictures: List<ProductPicture>.from(json["ProductPictures"].map((x) => ProductPicture.fromJson(x))),
   // productAttribute: List<ProductAttribute>.from(json["ProductAttribute"].map((x) => ProductAttribute.fromJson(x))),
  );

  static List<ProductbyCategory> productsbyCatFromSnapshot(List productsByCatSnapshot) {
    return productsByCatSnapshot.map((json) {
      return ProductbyCategory.fromJson(json);
    }).toList();
  }
}

class ProductAttribute {
  ProductAttributeId productAttributeId;
  dynamic textPrompt;
  bool isRequired;
 // double displayOrder;
  dynamic validationMinLength;
  dynamic validationMaxLength;
  dynamic validationFileAllowedExtensions;
  dynamic validationFileMaximumSize;
  dynamic defaultValue;
  dynamic conditionAttributeXml;
 // double attributeControlTypeId;
  List<ProductAttributeValue> productAttributeValues;
  String id;

  ProductAttribute({
    required this.productAttributeId,
    this.textPrompt,
    required this.isRequired,
   // required this.displayOrder,
    this.validationMinLength,
    this.validationMaxLength,
    this.validationFileAllowedExtensions,
    this.validationFileMaximumSize,
    this.defaultValue,
    this.conditionAttributeXml,
   // required this.attributeControlTypeId,
    required this.productAttributeValues,
    required this.id,
  });

  factory ProductAttribute.fromJson(Map<String, dynamic> json) => ProductAttribute(
    productAttributeId: productAttributeIdValues.map[json["ProductAttributeId"]]!,
    textPrompt: json["TextPrompt"],
    isRequired: json["IsRequired"],
  //  displayOrder: json["DisplayOrder"],
    validationMinLength: json["ValidationMinLength"],
    validationMaxLength: json["ValidationMaxLength"],
    validationFileAllowedExtensions: json["ValidationFileAllowedExtensions"],
    validationFileMaximumSize: json["ValidationFileMaximumSize"],
    defaultValue: json["DefaultValue"],
    conditionAttributeXml: json["ConditionAttributeXml"],
   // attributeControlTypeId: json["AttributeControlTypeId"],
    productAttributeValues: List<ProductAttributeValue>.from(json["ProductAttributeValues"].map((x) => ProductAttributeValue.fromJson(x))),
    id: json["Id"],
  );

}

enum ProductAttributeId { THE_62_B6_BF3_CBC4_EA696_A35_EC261 }

final productAttributeIdValues = EnumValues({
  "62b6bf3cbc4ea696a35ec261": ProductAttributeId.THE_62_B6_BF3_CBC4_EA696_A35_EC261
});

class ProductAttributeValue {
  dynamic associatedProductId;
  Name name;
  dynamic colorSquaresRgb;
  dynamic imageSquaresPictureId;
 /* double priceAdjustment;
  double weightAdjustment;
  double cost;
  double quantity;
  bool isPreSelected;
  double displayOrder;*/
  dynamic pictureId;
 // double attributeValueTypeId;
  String id;

  ProductAttributeValue({
    this.associatedProductId,
    required this.name,
    this.colorSquaresRgb,
    this.imageSquaresPictureId,
   /* required this.priceAdjustment,
    required this.weightAdjustment,
    required this.cost,
    required this.quantity,
    required this.isPreSelected,*/
   // required this.displayOrder,
    this.pictureId,
   // required this.attributeValueTypeId,
    required this.id,
  });

  factory ProductAttributeValue.fromJson(Map<String, dynamic> json) => ProductAttributeValue(
    associatedProductId: json["AssociatedProductId"],
    name: nameValues.map[json["Name"]]!,
    colorSquaresRgb: json["ColorSquaresRgb"],
    imageSquaresPictureId: json["ImageSquaresPictureId"],
    /*priceAdjustment: json["PriceAdjustment"]?.toDouble(),
    weightAdjustment: json["WeightAdjustment"],
    cost: json["Cost"],
    quantity: json["Quantity"],
    isPreSelected: json["IsPreSelected"],
    displayOrder: json["DisplayOrder"],*/
    pictureId: json["PictureId"],
    //attributeValueTypeId: json["AttributeValueTypeId"],
    id: json["Id"],
  );

}

enum Name { THE_1_KG, THE_750_GR, THE_500_GR, THE_250_GR, THE_1_PCS }

final nameValues = EnumValues({
  "1 kg ": Name.THE_1_KG,
  "1 pcs": Name.THE_1_PCS,
  "250 gr ": Name.THE_250_GR,
  "500 gr": Name.THE_500_GR,
  "750 gr ": Name.THE_750_GR
});

class ProductPicture {
  String pictureId;
  String pictureUrl;
  //int displayOrder;

  ProductPicture({
    required this.pictureId,
    required this.pictureUrl,
   // required this.displayOrder,
  });

  factory ProductPicture.fromJson(Map<String, dynamic> json) => ProductPicture(
    pictureId: json["PictureId"],
    pictureUrl: json["PictureURL"],
  //  displayOrder: json["DisplayOrder"],
  );

}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}



