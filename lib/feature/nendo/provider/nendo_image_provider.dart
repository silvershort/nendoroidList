import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nendoroid_db/feature/_common/model/api_result.dart';
import 'package:nendoroid_db/feature/nendo/model/nendo_data.dart';
import 'package:nendoroid_db/feature/scraping/data/service/scraping_serivce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nendo_image_provider.freezed.dart';
part 'nendo_image_provider.g.dart';

@riverpod
class NendoImage extends _$NendoImage {
  @override
  FutureOr<NendoImageState> build(NendoData nendoData) async {
    return fetchImage(nendoData);
  }

  Future<NendoImageState> fetchImage(NendoData nendoData) async {
    // 온라인샵에서 이미지를 가져오는 방식
    if (nendoData.image.contains('www.goodsmile.com')) {
      final result = await ref.read(scrapingServiceProvider).getOnlineStoreThumbnailList(nendoData.gscProductNum.toString());

      return result.when(
        success: (value) {
          return NendoImageState(
            imageList: value,
            thumbnailList: value,
          );
        },
        error: (error, stackTrace) {
          return Future.error(error, stackTrace);
        },
      );
    } // 기존 info에서 이미지를 가져오는 방식
    else {
      final result = await ref.read(scrapingServiceProvider).getGoodSmileImage(gscProductNum: nendoData.gscProductNum.toString());

      return result.when(
        success: (value) {
          return NendoImageState(
            imageList: value.imageList,
            thumbnailList: value.thumbnailList,
          );
        },
        error: (error, stackTrace) {
          return Future.error(error, stackTrace);
        },
      );
    }
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(() => fetchImage(nendoData));
  }
}

@freezed
abstract class NendoImageState with _$NendoImageState {
  const factory NendoImageState({
    required List<String> imageList,
    required List<String> thumbnailList,
  }) = _NendoImageState;
}
