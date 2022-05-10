import 'package:get/get.dart';
import 'package:shamba_huru/data/crops_data.dart';
import 'package:shamba_huru/models/crop.dart';
import 'package:money_formatter/money_formatter.dart';

class HomeController extends GetxController {
  Rx<CropData> cropData = CropData().obs;
  RxInt? sortColumnIndex = 0.obs;
  RxBool isAscending = false.obs;
  final columns = ['Crop', 'Region', 'Tshs', '%']; //columns to be updated

  @override
  void onInit() {
    super.onInit();
  }

  void updateIndices(int columnIndex, bool ascending) {
    sortColumnIndex!.value = columnIndex;
    isAscending.value = ascending;
  }

  String priceFormatter(double price) {
    return MoneyFormatter(
      amount: price,
    ).output.nonSymbol;
  }
}
