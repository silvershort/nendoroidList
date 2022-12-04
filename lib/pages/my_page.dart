import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/my_controller.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/models/gender_rate.dart';
import 'package:nendoroid_db/models/most_series.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/pages/nendo_web_page.dart';
import 'package:nendoroid_db/utilities/intl_util.dart';
import 'package:nendoroid_db/widgets/dialog/price_info_dialog.dart';
import 'package:nendoroid_db/widgets/my/my_collection_view.dart';
import 'package:nendoroid_db/widgets/my/my_complete_set_view.dart';
import 'package:nendoroid_db/widgets/my/my_gender_rate_view.dart';
import 'package:nendoroid_db/widgets/my/my_most_nendo_view.dart';
import 'package:nendoroid_db/widgets/my/my_most_series_view.dart';
import 'package:nendoroid_db/widgets/my/my_release_have_view.dart';
import 'package:nendoroid_db/widgets/my/my_release_wish_view.dart';
import 'package:nendoroid_db/widgets/my/my_total_price_view.dart';
import 'package:nendoroid_db/widgets/my/my_collection_painter.dart';

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
