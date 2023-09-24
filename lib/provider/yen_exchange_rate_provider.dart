import 'package:nendoroid_db/networks/services/scraping_serivce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'yen_exchange_rate_provider.g.dart';

@Riverpod(keepAlive: true)
class YenExchangeRate extends _$YenExchangeRate {
  @override
  int build() {
    // 앱 시작 후 최초 한번만 API를 호출하여 값을 저장해둔다.
    fetchYenExchangeRate();
    return 1000;
  }

  Future<void> fetchYenExchangeRate() async {
    final result = await ref.watch(scrapingServiceProvider).getExchangeRate();
    result.when(
      success: (value) => state = value,
      error: (error, stackTrace) => state = 1000,
    );
  }
}