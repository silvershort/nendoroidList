import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/my_controller.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/views/my/widget/my_collection_view.dart';
import 'package:nendoroid_db/views/my/widget/my_complete_set_view.dart';
import 'package:nendoroid_db/views/my/widget/my_gender_rate_view.dart';
import 'package:nendoroid_db/views/my/widget/my_most_nendo_view.dart';
import 'package:nendoroid_db/views/my/widget/my_most_series_view.dart';
import 'package:nendoroid_db/views/my/widget/my_release_have_view.dart';
import 'package:nendoroid_db/views/my/widget/my_release_wish_view.dart';
import 'package:nendoroid_db/views/my/widget/my_total_price_view.dart';

class MyPage extends StatelessWidget {
  MyPage({Key? key}) : super(key: key);
  final NendoController nendoController = Get.find<NendoController>();
  final MyController myController = Get.find<MyController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: const [
            MyCollectionView(),
            SizedBox(height: 20.0),
            MyTotalPriceView(),
            MyCompleteSetView(),
            MyGenderRateView(),
            MyMostNendoView(),
            MyMostSeriesView(),
            MyReleaseHaveView(),
            MyReleaseWishView(),
          ],
        ),
      ),
    );
  }
}
