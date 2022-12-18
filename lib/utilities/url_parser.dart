import 'package:nendoroid_db/models/nendo_data.dart';

String? parseNendoUrl(NendoData nendoData) {
  if (nendoData.name.en == null) {
    return null;
  } else {
    // url 생성시 영문명에서 특수문자를 제외하고 공백을 +로 바꿔준다.
    String nendoName = nendoData.name.en!
        .replaceAll(":", "")
        .replaceAll(".", "")
        .replaceAll(" ", "+")
        .replaceAll("/", "")
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll("[", "")
        .replaceAll("]", "");
    String url = "https://www.goodsmile.info/en/product/${nendoData.gscProductNum}/Nendoroid+$nendoName.html";
    return url;
  }
}