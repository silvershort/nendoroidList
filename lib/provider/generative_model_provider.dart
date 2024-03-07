import 'package:nendoroid_db/env/env.dart';
import 'package:nendoroid_db/models/nendo_data.dart';
import 'package:nendoroid_db/utilities/constant.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

part 'generative_model_provider.g.dart';

@riverpod
class GenerativeModelNotifier extends _$GenerativeModelNotifier {
  @override
  GenerativeModel build() {
    return GenerativeModel(model: Constant.gemini, apiKey: Env.googleApiKey);
  }

  Future<GenerateContentResponse> generateContentWithNendoData(NendoData nendoData) async {
    final content = [
      Content.text('넨도로이드 ${nendoData.num}번에 대해서 알려줘'),
    ];
    return await state.generateContent(content);
  }

  Future<GenerateContentResponse> generateContent(String prompt) async {
    final content = [Content.text(prompt)];
    return await state.generateContent(content);
  }
}
