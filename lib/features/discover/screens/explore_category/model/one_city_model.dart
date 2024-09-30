class OneCity {
    City? city;
    Landmark? landmark;
    Restaurant? restaurant;
    Hotel? hotel;
    dynamic cityreview;

    OneCity({
        this.city,
        this.landmark,
        this.restaurant,
        this.hotel,
        this.cityreview,
    });

    factory OneCity.fromJson(Map<String, dynamic> json) => OneCity(
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        landmark: json["landmark"] == null ? null : Landmark.fromJson(json["landmark"]),
        restaurant: json["restaurant"] == null ? null : Restaurant.fromJson(json["restaurant"]),
        hotel: json["hotel"] == null ? null : Hotel.fromJson(json["hotel"]),
        cityreview: json["cityreview"],
    );

    Map<String, dynamic> toJson() => {
        "city": city?.toJson(),
        "landmark": landmark?.toJson(),
        "restaurant": restaurant?.toJson(),
        "hotel": hotel?.toJson(),
        "cityreview": cityreview,
    };
}

class City {
    int? id;
    String? cityName;
    String? description;
    String? image;
    DateTime? createdAt;
    DateTime? updatedAt;

    City({
        this.id,
        this.cityName,
        this.description,
        this.image,
        this.createdAt,
        this.updatedAt,
    });

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        cityName: json["city_name"],
        description: json["description"],
        image: json["image"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "city_name": cityName,
        "description": description,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class Hotel {
    int? id;
    String? city;
    String? image1;
    String? image2;
    String? image3;
    String? hotelName;
    String? rating;
    String? urlGoogleMap;
    String? website;
    int? cityId;
    dynamic description;
    DateTime? createdAt;
    DateTime? updatedAt;

    Hotel({
        this.id,
        this.city,
        this.image1,
        this.image2,
        this.image3,
        this.hotelName,
        this.rating,
        this.urlGoogleMap,
        this.website,
        this.cityId,
        this.description,
        this.createdAt,
        this.updatedAt,
    });

    factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        id: json["id"],
        city: json["city"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        hotelName: json["hotel_name"],
        rating: json["rating"],
        urlGoogleMap: json["url_google_map"],
        website: json["website"],
        cityId: json["city_id"],
        description: json["description"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "city": city,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "hotel_name": hotelName,
        "rating": rating,
        "url_google_map": urlGoogleMap,
        "website": website,
        "city_id": cityId,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class Landmark {
    int? id;
    String? image;
    String? landmarkName;
    String? description;
    String? address;
    String? city;
    int? cityId;
    DateTime? createdAt;
    DateTime? updatedAt;

    Landmark({
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

    factory Landmark.fromJson(Map<String, dynamic> json) => Landmark(
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

    Restaurant({
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

    factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
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
