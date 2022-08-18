// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelPreview _$HotelPreviewFromJson(Map<String, dynamic> json) {
  return HotelPreview(
    uuid: json['uuid'] as String?,
    name: json['name'] as String?,
    poster: json['poster'] as String?,
  );
}

Map<String, dynamic> _$HotelPreviewToJson(HotelPreview instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
    };

ItemDetail _$ItemDetailFromJson(Map<String, dynamic> json) {
  return ItemDetail(
    uuid: json['uuid'] as String?,
    name: json['name'] as String?,
    poster: json['poster'] as String?,
    address: json['address'] == null
        ? null
        : ItemAdress.fromJson(json['address'] as Map<String, dynamic>),
    price: json['price'] as String?,
    rating: json['rating'] as String?,
    services: json['services'] == null
        ? null
        : ItemServices.fromJson(json['services'] as Map<String, dynamic>),
    photos:
        (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ItemDetailToJson(ItemDetail instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
      'address': instance.address,
      'price': instance.price,
      'rating': instance.rating,
      'services': instance.services,
      'photos': instance.photos,
    };

ItemAdress _$ItemAdressFromJson(Map<String, dynamic> json) {
  return ItemAdress(
    country: json['country'] as String?,
    street: json['street'] as String?,
    city: json['city'] as String?,
    zipCode: json['zipCode'] as int?,
    coords: json['coords'] == null
        ? null
        : ItemCoords.fromJson(json['coords'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ItemAdressToJson(ItemAdress instance) =>
    <String, dynamic>{
      'country': instance.country,
      'street': instance.street,
      'city': instance.city,
      'zipCode': instance.zipCode,
      'coords': instance.coords,
    };

ItemCoords _$ItemCoordsFromJson(Map<String, dynamic> json) {
  return ItemCoords(
    lan: (json['lan'] as num?)?.toDouble(),
    lat: (json['lat'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$ItemCoordsToJson(ItemCoords instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lan': instance.lan,
    };

ItemServices _$ItemServicesFromJson(Map<String, dynamic> json) {
  return ItemServices(
    free: (json['free'] as List<dynamic>?)?.map((e) => e as String).toList(),
    paid: (json['paid'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ItemServicesToJson(ItemServices instance) =>
    <String, dynamic>{
      'free': instance.free,
      'paid': instance.paid,
    };
