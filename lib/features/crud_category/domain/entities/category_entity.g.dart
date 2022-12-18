// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Category _$$_CategoryFromJson(Map<String, dynamic> json) => _$_Category(
      id: json['id'] as int?,
      name_cat: json['name_cat'] as String,
      isDeleted: json['isDeleted'] as bool,
      version: json['version'] as int,
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'name_cat': instance.name_cat,
      'isDeleted': instance.isDeleted,
      'version': instance.version,
    };
