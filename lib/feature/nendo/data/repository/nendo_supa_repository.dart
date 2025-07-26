import 'package:flutter/cupertino.dart';
import 'package:nendoroid_db/app/constant/supabase_name.dart';
import 'package:nendoroid_db/feature/nendo/data/dto/nendo_dto.dart';
import 'package:nendoroid_db/feature/nendo/data/dto/release_date_dto.dart';
import 'package:nendoroid_db/feature/nendo/model/nendo_data.dart';
import 'package:nendoroid_db/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nendo_supa_repository.g.dart';

@riverpod
NendoSupaRepository nendoSupaRepository(NendoSupaRepositoryRef ref) {
  return NendoSupaRepository();
}

class NendoSupaRepository {
  // Future<void> createOrUpdateNendoList({required List<NendoData> nendoList}) async {
  //   try {
  //     try {
  //       final nendoResponse =
  //       await supabase.from(TableName.nendo).upsert(nendoList.map((e) => NendoDto.fromModel(e).toJson()));
  //
  //       List<ReleaseDateDto> releaseDtoList = [];
  //
  //       for (final nendo in nendoList) {
  //         releaseDtoList
  //             .addAll(nendo.releaseDateList.map((e) => ReleaseDateDto(nendoNum: nendo.nendo.num, releaseDate: e)));
  //       }
  //
  //       final releaseResponse =
  //       await supabase.from(TableName.nendoReleaseDate).upsert(releaseDtoList.map((e) => e.toJson()));
  //       return;
  //     } catch (error, stackTrace) {
  //       talker.error(error, stackTrace);
  //     }
  //   } catch (error, stackTrace) {
  //     debugPrint(error.toString());
  //     return Future.error(error, stackTrace);
  //   }
  // }
}
