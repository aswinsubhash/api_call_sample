import 'package:json_annotation/json_annotation.dart';

part 'collect_data.g.dart';

@JsonSerializable()
class CollectData {

  @JsonKey(name: 'text')
  String? text;

  @JsonKey(name: 'number')
  int? number;

  @JsonKey(name: 'found')
  bool? found;
  
  @JsonKey(name: 'type')
  String? type;

  CollectData({
    this.text,
    this.number,
    this.found,
    this.type,
  });

  factory CollectData.fromJson(Map<String, dynamic> json) {
    return _$CollectDataFromJson(json);
  }
}
