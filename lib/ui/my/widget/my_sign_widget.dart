import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:nendoroid_db/provider/auth_provider.dart';
import 'package:nendoroid_db/provider/hive_provider.dart';
import 'package:nendoroid_db/provider/nendo_provider.dart';
import 'package:nendoroid_db/router/route_path.dart';
import 'package:nendoroid_db/ui/_common_widget/bottom_sheet/terms_agree_bottom_sheet.dart';
import 'package:nendoroid_db/ui/_common_widget/dialog/common_dialog.dart';
import 'package:nendoroid_db/ui/_common_widget/icon/help_icon.dart';
import 'package:nendoroid_db/utilities/hive_name.dart';

class MySignWidget extends ConsumerWidget {
  const MySignWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider);
    final Box<bool> termBox = ref.watch(hiveProvider).termsBox;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "로그인 정보",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(width: 5.0),
            if (state == null)
              HelpIcon(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const CommonDialog(
                        title: "로그인 안내",
                        content: "스마트폰 기기변경, 초기화 등의 이유로 데이터 백업이 필요할때 이메일 로그인 후 데이터를 백업할 수 있습니다.\n만일의 사태에 대비해서 데이터 백업을 주기적으로 해두는것을 권장합니다.",
                        contentStyle: TextStyle(height: 1.3),
                      );
                    },
                  );
                },
              ),
            const SizedBox(width: 5.0),
            Text(
              ":",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(width: 10.0),
            if (state == null)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextButton(
                    onPressed: () async {
                      if (termBox.get(HiveName.termsBoxName) ?? false) {
                        context.go(RoutePath.login);
                      } else {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const TermsAgreeBottomSheet();
                          },
                          isScrollControlled: true,
                        );
                      }
                    },
                    child: Text(
                      "로그인 & 회원가입",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                  ),
                ),
              )
            else
              Expanded(
                child: Text(
                  state.email ?? "이메일 주소를 불러오지 못했습니다.",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            if (state != null)
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CommonDialog(
                        content: "로그아웃 하시겠습니까?\n\n(이후 로그인을 위해서는 다시 메일인증을 해야합니다.)",
                        negativeText: "취소",
                        positiveText: "확인",
                        positiveOnClick: () {
                          ref.watch(authProvider.notifier).signOut();
                        },
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.clear,
                  size: 16,
                ),
              ),
          ],
        ),
        const SizedBox(height: 5.0),
        if (state != null)
          Column(
            children: [
              Row(
                children: [
                  const SizedBox(height: 5.0),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        child: const Text(
                          "데이터 복구",
                        ),
                        onPressed: () async {
                          if (ref.read(nendoProvider).hasValue) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return CommonDialog(
                                  content: "정말 데이터 복구를 진행하시겠습니까?\n\n(백업데이터와 현재데이터가 다를경우 백업데이터로 대체됩니다.)",
                                  positiveOnClick: () async {
                                    try {
                                      await ref.read(nendoProvider.notifier).restoreBackupList(state.uid);
                                    } catch (error) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return CommonDialog(
                                            content: '데이터 복구에 실패했습니다.\n\nError : ${error.toString()}',
                                          );
                                        },
                                      );
                                    }
                                  },
                                  negativeText: "취소",
                                );
                              },
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const CommonDialog(
                                  content: "넨도로이드 데이터를 먼저 받아주세요.",
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (state.email == null) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const CommonDialog(
                                  content: "이메일 정보가 없습니다.",
                                );
                              },
                            );
                          }
                          try {
                            await ref.read(nendoProvider.notifier).backupDataToFirestore(user: state);
                            if (context.mounted) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const CommonDialog(content: "데이터 백업에 성공하였습니다 !");
                                },
                              );
                            }
                          } catch (error) {
                            if (context.mounted) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return CommonDialog(content: "데이터 백업에 실패했습니다.\n\nError:${error.toString()}");
                                },
                              );
                            }
                          }
                        },
                        child: const Text(
                          "데이터 백업",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
            ],
          ),
      ],
    );
  }
}
