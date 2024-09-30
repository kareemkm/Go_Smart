class AllDriver {
  String? version;
  List<Datum>? data;

  AllDriver({
    this.version,
    this.data,
  });

  factory AllDriver.fromJson(Map<String, dynamic> json) => AllDriver(
    version: json["version"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "version": version,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? image;
  String? name;
  String? city;
  String? phoneNo;
  Gender? gender;
  String? yearOfBirth;
  String? contactLink;
  String? carType;
  String? language;
  String? description;

  Datum({
    this.id,
    this.image,
    this.name,
    this.city,
    this.phoneNo,
    this.gender,
    this.yearOfBirth,
    this.contactLink,
    this.carType,
    this.language,
    this.description,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    image: json["image"],
    name: json["name"],
    city: json["city"],
    phoneNo: json["phoneNo"],
    gender: genderValues.map[json["gender"]]!,
    yearOfBirth: json["year_of_birth"],
    contactLink: json["contact_link"],
    carType: json["car_type"],
    language: json["language"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "name": name,
    "phoneNo": phoneNo,
    "gender": genderValues.reverse[gender],
    "year_of_birth": yearOfBirth,
    "contact_link": contactLink,
    "car_type": carType,
    "language": language,
    "description": description,
  };
}

enum Gender {
  FEMALE,
  MALE
}

final genderValues = EnumValues({
  "female": Gender.FEMALE,
  "male": Gender.MALE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
