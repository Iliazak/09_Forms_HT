import 'package:json_annotation/json_annotation.dart';

part 'hotel.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelPreview {
  final String uuid;
  final String name;
  final String poster;

  HotelPreview({required this.uuid, required this.name, required this.poster});

  factory HotelPreview.fromJson(Map<String, dynamic> json) =>
      _$HotelPreviewFromJson(json);
  Map<String, dynamic> toJson() => _$HotelPreviewToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ItemDetail {
  final String uuid;
  final String name;
  final String poster;
  final ItemAdress address;
  final String price;
  final String rating;
  final ItemServices services;
  final List<String> photos;

  ItemDetail(
      {required this.uuid,
      required this.name,
      required this.poster,
      required this.address,
      required this.price,
      required this.rating,
      required this.services,
      required this.photos});

  factory ItemDetail.fromJson(Map<String, dynamic> json) =>
      _$ItemDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ItemDetailToJson(this);
}

@JsonSerializable()
class ItemAdress {
  final String country;
  final String street;
  final String city;
  final int zip_code;
  final ItemCoords coords;

  ItemAdress(
      {required this.country,
      required this.street,
      required this.city,
      required this.zip_code,
      required this.coords});

  factory ItemAdress.fromJson(Map<String, dynamic> json) =>
      _$ItemAdressFromJson(json);
  Map<String, dynamic> toJson() => _$ItemAdressToJson(this);
}

@JsonSerializable()
class ItemCoords {
  final double lat;
  final double lan;

  ItemCoords({required this.lan, required this.lat});

  factory ItemCoords.fromJson(Map<String, dynamic> json) =>
      _$ItemCoordsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemCoordsToJson(this);
}

@JsonSerializable()
class ItemServices {
  final List<String> free;
  final List<String> paid;
  ItemServices({
    required this.free,
    required this.paid,
  });
  factory ItemServices.fromJson(Map<String, dynamic> json) =>
      _$ItemServicesFromJson(json);
  Map<String, dynamic> toJson() => _$ItemServicesToJson(this);
}
