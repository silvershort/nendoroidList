import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';

class NendoAddMemoDialog extends StatefulWidget {
  const NendoAddMemoDialog({Key? key, required this.num}) : super(key: key);
  final String num;

  @override
  State<NendoAddMemoDialog> createState() => _NendoAddMemoDialogState();
}

class _NendoAddMemoDialogState extends State<NendoAddMemoDialog> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final NendoController nendoController = Get.find<NendoController>();

  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("메모 추가"),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "메모는 8글자 내외로 최대 4개 등록 가능합니다.",
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          const SizedBox(height: 3.0),
          const Text(
            "콤마를 이용하여 한번에 여러개 등록이 가능합니다.",
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          const SizedBox(height: 3.0),
          const Text(
            "ex) 박스없음,특전있음박,첫넨도",
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          const SizedBox(height: 15.0),
          TextField(
            autofocus: true,
            focusNode: focusNode,
            controller: controller,
            textAlign: TextAlign.end,
            keyboardType: TextInputType.text,
            maxLines: 5,
            minLines: 1,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(10.0),
              labelText: '메모입력',
              labelStyle: TextStyle(
                fontSize: 14.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
            onSubmitted: (text) {
              memoValidation(text);
            },
          ),
          const SizedBox(height: 5.0),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              errorMessage,
              style: const TextStyle(
                color: Colors.deepOrange,
                fontSize: 12.0,
              ),
            ),
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("취소"),
        ),
        TextButton(
          onPressed: () {
            memoValidation(controller.text);
          },
          child: const Text("확인"),
        ),
      ],
    );
  }

  void memoValidation(String text) {
    int memoCount = nendoController.getNendoData(widget.num).memo?.length ?? 0;
    // 전체공백 제거 + 콤마로 파싱 + 파싱된것중 빈문자열 제거
    List<String> memoList = text.replaceAll('\n', '').replaceAll(' ', '').split(",").where((element) => element != "").toList();
    if (memoList.length + memoCount > 4) {
      setState(() {
        errorMessage = "메모 개수가 4개가 넘습니다.";
      });
      return;
    }
    for (String memo in memoList) {
      if (memo.length > 8) {
        setState(() {
          errorMessage = "8글자를 넘는 메모가 있습니다.";
        });
        return;
      }
    }
    setState(() {
      errorMessage = "";
    });
    nendoController.setNendoMemo(widget.num, memoList);
    Get.back();
  }
}
