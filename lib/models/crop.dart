import 'dart:convert';

class Crop {
  String name;
  String location;
  String date;
  double priceEarly;
  double priceLast;

  Crop({
    required this.name,
    required this.location,
    required this.date,
    required this.priceEarly,
    required this.priceLast,
  });

  Crop copyWith({
    String? name,
    String? location,
    String? date,
    double? priceEarly,
    double? priceLast,
  }) {
    return Crop(
      name: name ?? this.name,
      location: location ?? this.location,
      date: date ?? this.date,
      priceEarly: priceEarly ?? this.priceEarly,
      priceLast: priceLast ?? this.priceLast,
    );
  }

  Crop merge(Crop model) {
    return Crop(
      name: model.name,
      location: model.location,
      date: model.date,
      priceEarly: model.priceEarly,
      priceLast: model.priceLast,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'date': date,
      'priceEarly': priceEarly,
      'priceLast': priceLast,
    };
  }

  factory Crop.fromMap(Map<String, dynamic> map) {
    return Crop(
      name: map['name'],
      location: map['location'],
      date: map['date'],
      priceEarly: map['priceEarly'],
      priceLast: map['priceLast'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Crop.fromJson(String source) => Crop.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Crop(name: $name, location: $location, date: $date, priceEarly: $priceEarly, priceLast: $priceLast)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Crop &&
        o.name == name &&
        o.location == location &&
        o.date == date &&
        o.priceEarly == priceEarly &&
        o.priceLast == priceLast;
  }

  double pricePercentage() {
    if (priceEarly != 0.0) {
      return ((priceLast - priceEarly) / priceEarly) * 100;
    } else {
      return (priceLast / 1) * 100;
    }
  }

  @override
  int get hashCode {
    return name.hashCode ^
        location.hashCode ^
        date.hashCode ^
        priceEarly.hashCode ^
        priceLast.hashCode;
  }
}
