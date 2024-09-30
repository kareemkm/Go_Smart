class Resturants {
    int? id;
    String? address;
    City? city;
    String? description;
    String? image;
    String? resturantName;
    String? rating;
    String? website;
    int? cityId;
    DateTime? createdAt;
    DateTime? updatedAt;

    Resturants({
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

    factory Resturants.fromJson(Map<String, dynamic> json) => Resturants(
        id: json["id"],
        address: json["address"],
        city: cityValues.map[json["city"]]!,
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
        "city": cityValues.reverse[city],
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

enum City {
    ALEXANDRIA,
    ASWAN,
    CAIRO,
    CITY_ASWAN,
    DAHAB,
    EL_GOUNA,
    GIZA,
    HURGHADA,
    LUXOR,
    MARSA_ALAM,
    MERSA_MATRUH,
    NABQ_BAY,
    PORT_SAID,
    SAFAGA,
    SHARM_EL_SHEIKH,
    SOMA_BAY
}

final cityValues = EnumValues({
    "Alexandria": City.ALEXANDRIA,
    "Aswan": City.ASWAN,
    "Cairo": City.CAIRO,
    "Aswan ": City.CITY_ASWAN,
    "Dahab": City.DAHAB,
    "El Gouna": City.EL_GOUNA,
    "Giza": City.GIZA,
    "Hurghada": City.HURGHADA,
    "Luxor": City.LUXOR,
    "Marsa Alam": City.MARSA_ALAM,
    "Mersa Matruh": City.MERSA_MATRUH,
    "Nabq Bay": City.NABQ_BAY,
    "Port Said": City.PORT_SAID,
    "Safaga": City.SAFAGA,
    "Sharm El Sheikh": City.SHARM_EL_SHEIKH,
    "Soma Bay": City.SOMA_BAY
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