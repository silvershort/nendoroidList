import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nendoroid_db/models/news_data.dart';
import 'package:nendoroid_db/models/subscribe_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_provider.freezed.dart';
part 'news_provider.g.dart';

@riverpod
class News extends _$News {
  // 페이지네이션을 위한 간격
  final Duration _period = const Duration(days: 3);

  // API 호출 변수
  late DateTime _startTime;
  late DateTime _endTime;

  @override
  FutureOr<NewsState> build() async {
    return const NewsState();
  }
}

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    @Default([]) List<NewsData> newsList,
    @Default(SubscribeData()) SubscribeData subscribeData,
}) = _NewsState;
}