import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/news_controller.dart';

class NewsSubscribeDialog extends GetView<NewsController> {
  const NewsSubscribeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("구독 설정"),
      content: Obx(
        () => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SubscribeTitle(
                iconPath: "assets/logo/twitter_logo.png",
                text: "트위터",
              ),
              const SizedBox(height: 5.0),
              SubscribeCheckBox(
                isCheck: controller.subscribe.twitterSubscribe.goodSmileJP,
                onChanged: (bool? value) {
                  controller.updateSubscribe(controller.subscribe.copyWith(
                    twitterSubscribe: controller.subscribe.twitterSubscribe.copyWith(
                      goodSmileJP: !controller.subscribe.twitterSubscribe.goodSmileJP
                    )
                  ));
                },
                text: "@굿스마일 JP",
              ),
              SubscribeCheckBox(
                isCheck: controller.subscribe.twitterSubscribe.goodSmileUS,
                onChanged: (bool? value) {
                  controller.updateSubscribe(controller.subscribe.copyWith(
                      twitterSubscribe: controller.subscribe.twitterSubscribe.copyWith(
                          goodSmileUS: !controller.subscribe.twitterSubscribe.goodSmileUS
                      )
                  ));
                },
                text: "@굿스마일 US",
              ),
              SubscribeCheckBox(
                isCheck: controller.subscribe.twitterSubscribe.goodSmileKR,
                onChanged: (bool? value) {
                  controller.updateSubscribe(controller.subscribe.copyWith(
                      twitterSubscribe: controller.subscribe.twitterSubscribe.copyWith(
                          goodSmileKR: !controller.subscribe.twitterSubscribe.goodSmileKR
                      )
                  ));
                },
                text: "@굿스마일 KR",
              ),
              SubscribeCheckBox(
                isCheck: controller.subscribe.twitterSubscribe.ninimal,
                onChanged: (bool? value) {
                  controller.updateSubscribe(controller.subscribe.copyWith(
                      twitterSubscribe: controller.subscribe.twitterSubscribe.copyWith(
                          ninimal: !controller.subscribe.twitterSubscribe.ninimal
                      )
                  ));
                },
                text: "@니니멀",
              ),
              SubscribeCheckBox(
                isCheck: controller.subscribe.twitterSubscribe.figureInfo,
                onChanged: (bool? value) {
                  controller.updateSubscribe(controller.subscribe.copyWith(
                      twitterSubscribe: controller.subscribe.twitterSubscribe.copyWith(
                          figureInfo: !controller.subscribe.twitterSubscribe.figureInfo
                      )
                  ));
                },
                text: "@피규어 정보",
              ),
              const SizedBox(height: 5.0),
              const Divider(height: 0),
              const SizedBox(height: 10.0),
              const SubscribeTitle(
                iconPath: "assets/logo/ruliweb_logo.png",
                text: "루리웹",
              ),
              const SizedBox(height: 5.0),
              SubscribeCheckBox(
                isCheck: controller.subscribe.ruliwebSubscribe.information,
                onChanged: (bool? value) {
                  controller.updateSubscribe(controller.subscribe.copyWith(
                      ruliwebSubscribe: controller.subscribe.ruliwebSubscribe.copyWith(
                          information: !controller.subscribe.ruliwebSubscribe.information
                      )
                  ));
                },
                text: "피규어 정보",
              ),
              SubscribeCheckBox(
                isCheck: controller.subscribe.ruliwebSubscribe.review,
                onChanged: (bool? value) {
                  controller.updateSubscribe(controller.subscribe.copyWith(
                      ruliwebSubscribe: controller.subscribe.ruliwebSubscribe.copyWith(
                          review: !controller.subscribe.ruliwebSubscribe.review
                      )
                  ));
                },
                text: "피규어 갤러리",
              ),
              const SizedBox(height: 5.0),
              const Divider(height: 0),
              const SizedBox(height: 10.0),
              const SubscribeTitle(
                iconPath: "assets/logo/dc_logo.png",
                text: "디시인사이드",
              ),
              const SizedBox(height: 5.0),
              SubscribeCheckBox(
                isCheck: controller.subscribe.dcinsideSubscribe.information,
                onChanged: (bool? value) {
                  controller.updateSubscribe(controller.subscribe.copyWith(
                      dcinsideSubscribe: controller.subscribe.dcinsideSubscribe.copyWith(
                          information: !controller.subscribe.dcinsideSubscribe.information
                      )
                  ));
                },
                text: "넨도 정보",
              ),
              SubscribeCheckBox(
                isCheck: controller.subscribe.dcinsideSubscribe.review,
                onChanged: (bool? value) {
                  controller.updateSubscribe(controller.subscribe.copyWith(
                      dcinsideSubscribe: controller.subscribe.dcinsideSubscribe.copyWith(
                          review: !controller.subscribe.dcinsideSubscribe.review
                      )
                  ));
                },
                text: "넨도 리뷰",
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            controller.cancelSubscribe();
          },
          child: const Text("취소"),
        ),
        TextButton(
          onPressed: () async {
            Get.back();
            await controller.saveSubscribe();
            controller.initData();
          },
          child: const Text("확인"),
        ),
      ],
    );
  }
}

class SubscribeTitle extends StatelessWidget {
  const SubscribeTitle({
    Key? key,
    required this.iconPath,
    required this.text,
  }) : super(key: key);
  final String iconPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ExtendedImage.asset(
          iconPath,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
          width: 24,
          height: 24,
          fit: BoxFit.fill,
        ),
        const SizedBox(width: 10.0),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

class SubscribeCheckBox extends StatelessWidget {
  const SubscribeCheckBox({
    Key? key,
    required this.isCheck,
    required this.onChanged,
    required this.text,
  }) : super(key: key);
  final bool isCheck;
  final Function(bool?) onChanged;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged.call(!isCheck);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
        child: Row(
          children: [
            SizedBox(
              height: 32,
              width: 32,
              child: Checkbox(
                value: isCheck,
                onChanged: onChanged,
              ),
            ),
            Text(
              text,
            ),
          ],
        ),
      ),
    );
  }
}
