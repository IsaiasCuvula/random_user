// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      gender: json['gender'] as String,
      name: Username.fromJson(json['name'] as Map<String, dynamic>),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      postcode: json['postcode'] as int,
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      timezone: Timezone.fromJson(json['timezone'] as Map<String, dynamic>),
      email: json['email'] as String,
      phone: json['phone'] as String,
      picture: Picture.fromJson(json['picture'] as Map<String, dynamic>),
      nat: json['nat'] as String,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'name': instance.name,
      'location': instance.location,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'postcode': instance.postcode,
      'coordinates': instance.coordinates,
      'timezone': instance.timezone,
      'email': instance.email,
      'phone': instance.phone,
      'picture': instance.picture,
      'nat': instance.nat,
    };

_$_Username _$$_UsernameFromJson(Map<String, dynamic> json) => _$_Username(
      title: json['title'] as String,
      first: json['first'] as String,
      last: json['last'] as String,
    );

Map<String, dynamic> _$$_UsernameToJson(_$_Username instance) =>
    <String, dynamic>{
      'title': instance.title,
      'first': instance.first,
      'last': instance.last,
    };

_$_Picture _$$_PictureFromJson(Map<String, dynamic> json) => _$_Picture(
      large: json['large'] as String,
      medium: json['medium'] as String,
      thumbnail: json['thumbnail'] as String,
    );

Map<String, dynamic> _$$_PictureToJson(_$_Picture instance) =>
    <String, dynamic>{
      'large': instance.large,
      'medium': instance.medium,
      'thumbnail': instance.thumbnail,
    };

_$_Timezone _$$_TimezoneFromJson(Map<String, dynamic> json) => _$_Timezone(
      offset: json['offset'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_TimezoneToJson(_$_Timezone instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'description': instance.description,
    };

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      street: Street.fromJson(json['street'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'street': instance.street,
    };

_$_Street _$$_StreetFromJson(Map<String, dynamic> json) => _$_Street(
      number: json['number'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_StreetToJson(_$_Street instance) => <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
    };

_$_Coordinates _$$_CoordinatesFromJson(Map<String, dynamic> json) =>
    _$_Coordinates(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$_CoordinatesToJson(_$_Coordinates instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
