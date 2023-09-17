import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/provider/nendo_provider.dart';
import 'package:nendoroid_db/ui/stats/widget/stats_collection_view.dart';
import 'package:nendoroid_db/ui/stats/widget/stats_complete_set_view.dart';
import 'package:nendoroid_db/ui/stats/widget/stats_gender_rate_view.dart';
import 'package:nendoroid_db/ui/stats/widget/stats_most_nendo_view.dart';
import 'package:nendoroid_db/ui/stats/widget/stats_most_series_view.dart';
import 'package:nendoroid_db/ui/stats/widget/stats_release_have_view.dart';
import 'package:nendoroid_db/ui/stats/widget/stats_release_wish_view.dart';
import 'package:nendoroid_db/ui/stats/widget/stats_total_price_view.dart';

class StatsScreen extends ConsumerWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(nendoProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("통계"),
      ),
      body: state.when(
        data: (data) {
          final List<NendoData> nendoList = data.nendoList;

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  StatsCollectionView(nendoList: nendoList),
                  const SizedBox(height: 24.0),
                  StatsTotalPriceView(nendoList: nendoList),
                  StatsCompleteSetView(
                    nendoList: nendoList,
                    setList: data.setList,
                  ),
                  StatsGenderRateView(nendoList: nendoList),
                  StatsMostNendoView(nendoList: nendoList),
                  StatsMostSeriesView(nendoList: nendoList),
                  StatsReleaseHaveView(nendoList: nendoList),
                  StatsReleaseWishView(nendoList: nendoList),
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("데이터를 받아오는 중 오류가 발생했습니다."),
                IconButton(
                  onPressed: () {
                    ref.read(nendoProvider.notifier).fetchData();
                  },
                  icon: Icon(
                    Icons.refresh,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
