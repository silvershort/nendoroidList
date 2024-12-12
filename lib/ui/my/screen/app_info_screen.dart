import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nendoroid_db/networks/repositories/firebase_repository.dart';
import 'package:nendoroid_db/provider/auth_provider.dart';
import 'package:nendoroid_db/router/route_path.dart';
import 'package:nendoroid_db/ui/_common_widget/bottom_sheet/terms_agree_bottom_sheet.dart';
import 'package:nendoroid_db/ui/_common_widget/dialog/common_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class AppInfoScreen extends ConsumerWidget {
  const AppInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("앱 상세정보"),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        children: [
          Text(
            "- DB제공",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 5.0),
          InkWell(
            onTap: () {
              final url = Uri.parse("https://github.com/KhoraLee/NendoroidDB");
              canLaunchUrl(url).then((value) => launchUrl(url, mode: LaunchMode.externalApplication));
            },
            child: Text(
              "https://github.com/KhoraLee/NendoroidDB",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.blue,
                  ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          _TitleAndButton(
            title: "오픈소스 라이센스 고지",
            buttonTitle: "오픈소스 라이센스 정보",
            onClick: () {
              context.push(RoutePath.license);
            },
          ),
          _TitleAndButton(
            title: "회원탈퇴",
            buttonTitle: "탈퇴 하기",
            onClick: () {
              User? user = ref.read(authProvider);
              if (user == null) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const CommonDialog(content: "로그인 정보가 없습니다.");
                  },
                );
              } else {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CommonDialog(
                      content: "정말로 회원 탈퇴하시겠습니까?\n\n(백업된 데이터는 자동으로 삭제됩니다.)",
                      negativeText: "취소",
                      positiveOnClick: () async {
                        try {
                          await ref.read(authProvider.notifier).withdrawal();
                          await ref.read(firebaseRepositoryProvider).deleteData();
                          if (context.mounted) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const CommonDialog(
                                  content: '회원탈퇴가 완료되었습니다.',
                                );
                              },
                            );
                          }
                        } catch (error, _) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const CommonDialog(
                                content: '회원탈퇴에 실패했습니다.\n회원탈퇴를 위해서는 로그아웃 후 메일인증을 통한 로그인을 한 이후에 회원탈퇴를 진행해주세요.',
                              );
                            },
                          );
                        }
                      },
                    );
                  },
                );
              }
            },
          ),
          _TitleAndButton(
            title: "이용약관",
            buttonTitle: "넨도로이드DB 이용약관",
            onClick: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return const TermsAgreeBottomSheet(agreeable: false);
                },
              );
            },
          ),
          _TitleAndButton(
            title: "버그 및 개선사항 문의",
            buttonTitle: "문의하기",
            onClick: () async {
              Uri url = Uri.parse("https://open.kakao.com/o/sbYY0yRe");
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
        ],
      ),
    );
  }
}

class _TitleAndButton extends StatelessWidget {
  const _TitleAndButton({
    Key? key,
    required this.title,
    required this.buttonTitle,
    required this.onClick,
  }) : super(key: key);

  final String title;
  final String buttonTitle;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10.0,
        ),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            "- $title",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        FractionallySizedBox(
          widthFactor: 0.7,
          child: ElevatedButton(
            onPressed: onClick,
            child: Text(
              buttonTitle,
            ),
          ),
        ),
      ],
    );
  }
}
