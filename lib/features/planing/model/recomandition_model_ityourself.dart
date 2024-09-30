
class YourRecommendation {
  Hotel? hotel;

  YourRecommendation({
    this.hotel,
  });

  factory YourRecommendation.fromJson(Map<String, dynamic> json) => YourRecommendation(
    hotel: json["hotel"] == null ? null : Hotel.fromJson(json["hotel"]),
  );

  Map<String, dynamic> toJson() => {
    "hotel": hotel?.toJson(),
  };
}

class Hotel {
  List<Datum>? data;

  Hotel({
    this.data,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? hotelName;
  String? plan;
  Restaurant? restaurant;
  LandMark? landMark;

  Datum({
    this.hotelName,
    this.plan,
    this.restaurant,
    this.landMark,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    hotelName: json["hotel_name"],
    plan: json["plan"],
    restaurant: json["restaurant"] == null ? null : Restaurant.fromJson(json["restaurant"]),
    landMark: json["land_mark"] == null ? null : LandMark.fromJson(json["land_mark"]),
  );

  Map<String, dynamic> toJson() => {
    "hotel_name": hotelName,
    "plan": plan,
    "restaurant": restaurant?.toJson(),
    "land_mark": landMark?.toJson(),
  };
}

class LandMark {
  Landmarkdata? landmarkdata;

  LandMark({
    this.landmarkdata,
  });

  factory LandMark.fromJson(Map<String, dynamic> json) => LandMark(
    landmarkdata: json["landmarkdata"] == null ? null : Landmarkdata.fromJson(json["landmarkdata"]),
  );

  Map<String, dynamic> toJson() => {
    "landmarkdata": landmarkdata?.toJson(),
  };
}

class Landmarkdata {
  int? id;
  String? image;
  String? landmarkName;
  String? description;
  String? address;
  String? city;
  int? cityId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Landmarkdata({
    this.id,
    this.image,
    this.landmarkName,
    this.description,
    this.address,
    this.city,
    this.cityId,
    this.createdAt,
    this.updatedAt,
  });

  factory Landmarkdata.fromJson(Map<String, dynamic> json) => Landmarkdata(
    id: json["id"],
    image: json["image"],
    landmarkName: json["landmark_name"],
    description: json["description"],
    address: json["address"],
    city: json["city"],
    cityId: json["city_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "landmark_name": landmarkName,
    "description": description,
    "address": address,
    "city": city,
    "city_id": cityId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Restaurant {
  Restaurantdata? restaurantdata;

  Restaurant({
    this.restaurantdata,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    restaurantdata: json["restaurantdata"] == null ? null : Restaurantdata.fromJson(json["restaurantdata"]),
  );

  Map<String, dynamic> toJson() => {
    "restaurantdata": restaurantdata?.toJson(),
  };
}

class Restaurantdata {
  int? id;
  String? address;
  String? city;
  String? description;
  String? image;
  String? resturantName;
  String? rating;
  String? website;
  int? cityId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Restaurantdata({
    this.id,
    this.address,
    this.city,
    this.description,
    this.image,
    this.resturantName,
    this.rating,
    this.website,
    this.cityId,
    this.createdAt,
    this.updatedAt,
  });

  factory Restaurantdata.fromJson(Map<String, dynamic> json) => Restaurantdata(
    id: json["id"],
    address: json["address"],
    city: json["city"],
    description: json["description"],
    image: json["image"],
    resturantName: json["resturant_name"],
    rating: json["rating"],
    website: json["website"],
    cityId: json["city_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "address": address,
    "city": city,
    "description": description,
    "image": image,
    "resturant_name": resturantName,
    "rating": rating,
    "website": website,
    "city_id": cityId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
