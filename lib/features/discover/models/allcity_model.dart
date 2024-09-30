
class Citys {
  int? id;
  String? cityName;
  String? description;
  String? image;
 

  Citys({
    this.id,
    this.cityName,
    this.description,
    this.image,
    
  });

  factory Citys.fromJson(Map<String, dynamic> json) => Citys(
    id: json["id"],
    cityName: json["city_name"],
    description: json["description"],
    image: json["image"],
  
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "city_name": cityName,
    "description": description,
    "image": image,
    
  };
}
