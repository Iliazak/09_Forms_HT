import 'package:json_annotation/json_annotation.dart';

part 'hotel.g.dart';

@JsonSerializable()
class HotelPreview {
  final String? uuid;
  final String? name;
  final String? poster;

  HotelPreview({this.uuid, this.name, this.poster});

  factory HotelPreview.fromJson(Map<String, dynamic> json) =>
      _$HotelPreviewFromJson(json);
  Map<String, dynamic> toJson() => _$HotelPreviewToJson(this);
}

@JsonSerializable()
class ItemDetail {
  final String? uuid;
  final String? name;
  final String? poster;
  final ItemAdress? address;
  final String? price;
  final String? rating;
  final ItemServices? services;
  final List<String>? photos;

  ItemDetail(
      {this.uuid,
      this.name,
      this.poster,
      this.address,
      this.price,
      this.rating,
      this.services,
      this.photos});

  factory ItemDetail.fromJson(Map<String, dynamic> json) =>
      _$ItemDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ItemDetailToJson(this);
}

@JsonSerializable()
class ItemAdress {
  final String? country;
  final String? street;
  final String? city;
  final int? zipCode;
  final ItemCoords? coords;

  ItemAdress({this.country, this.street, this.city, this.zipCode, this.coords});

  factory ItemAdress.fromJson(Map<String, dynamic> json) =>
      _$ItemAdressFromJson(json);
  Map<String, dynamic> toJson() => _$ItemAdressToJson(this);
}

@JsonSerializable()
class ItemCoords {
  final double? lat;
  final double? lan;

  ItemCoords({this.lan, this.lat});

  factory ItemCoords.fromJson(Map<String, dynamic> json) =>
      _$ItemCoordsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemCoordsToJson(this);
}

@JsonSerializable()
class ItemServices {
  final List<String>? free;
  final List<String>? paid;
  ItemServices({
    this.free,
    this.paid,
  });
  factory ItemServices.fromJson(Map<String, dynamic> json) =>
      _$ItemServicesFromJson(json);
  Map<String, dynamic> toJson() => _$ItemServicesToJson(this);
}
