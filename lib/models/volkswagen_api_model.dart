

class VolksWagenModel {
    VolksWagenModel({
       required this.year,
       required this.id,
       required this.horsepower,
       required this.make,
       required this.model,
       required this.price,
       required this.imgUrl,
    });

    int year;
    int id;
    int horsepower;
    String make;
    String model;
    int price;
    String imgUrl;

    factory VolksWagenModel.fromJson(Map<String, dynamic> json) => VolksWagenModel(
        year: json["year"],
        id: json["id"],
        horsepower: json["horsepower"],
        make: json["make"],
        model: json["model"],
        price: json["price"],
        imgUrl: json["img_url"],
    );
}
