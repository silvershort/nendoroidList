import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'subscribe_data.freezed.dart';

part 'subscribe_data.g.dart';

@freezed
class SubscribeData with _$SubscribeData {
  @HiveType(typeId: 4, adapterName: "SubscribeDataAdapter")
  const factory SubscribeData({
    @HiveField(0)
    @Default(TwitterSubscribe())
    TwitterSubscribe twitterSubscribe,
    @HiveField(1)
    @Default(DcinsideSubscribe())
    DcinsideSubscribe dcinsideSubscribe,
    @HiveField(2)
    @Default(RuliwebSubscribe())
    RuliwebSubscribe ruliwebSubscribe,
  }) = _SubscribeData;
}

@freezed
class TwitterSubscribe with _$TwitterSubscribe {
  @HiveType(typeId: 5, adapterName: "TwitterSubscribeAdapter")
  const factory TwitterSubscribe({
    @HiveField(0)
    @Default(false)
    bool goodSmileJP,
    @HiveField(1)
    @Default(false)
    bool goodSmileUS,
    @HiveField(2)
    @Default(true)
    bool goodSmileKR,
    @HiveField(3)
    @Default(true)
    bool ninimal,
    @HiveField(4)
    @Default(true)
    bool figureInfo,
  }) = _TwitterSubscribe;
}

@freezed
class DcinsideSubscribe with _$DcinsideSubscribe {
  @HiveType(typeId: 6, adapterName: "DcinsideSubscribeAdapter")
  const factory DcinsideSubscribe({
    @HiveField(0)
    @Default(true)
    bool information,
    @HiveField(1)
    @Default(true)
    bool review,
  }) = _DcinsideSubscribe;
}

@freezed
class RuliwebSubscribe with _$RuliwebSubscribe {
  @HiveType(typeId: 7, adapterName: "RuliwebSubscribeAdapter")
  const factory RuliwebSubscribe({
    @HiveField(0)
    @Default(true)
    bool information,
    @HiveField(1)
    @Default(true)
    bool review,
  }) = _RuliwebSubscribe;
}
