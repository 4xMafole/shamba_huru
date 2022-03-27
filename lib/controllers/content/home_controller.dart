import 'package:get/get.dart';
import 'package:shamba_huru/models/crop.dart';
import 'package:money_formatter/money_formatter.dart';

class HomeController extends GetxController {
  List<Crop> crops = [
    Crop(
      name: "Beans",
      location: "Iringa",
      date: "21/03/2021",
      priceEarly: 11.0,
      priceLast: 10.0,
    ),
    Crop(
      name: "Maize",
      location: "Mbeya",
      date: "21/03/2021",
      priceEarly: 5600.0,
      priceLast: 7000.1,
    ),
    Crop(
      name: "Carrots",
      location: "Njombe",
      date: "21/03/2021",
      priceEarly: 40000.0,
      priceLast: 23000.0,
    ),
    Crop(
      name: "Grapes",
      location: "Dodoma",
      date: "21/03/2021",
      priceEarly: 78.0,
      priceLast: 90.0,
    ),
    Crop(
      name: "Beans",
      location: "Iringa",
      date: "21/03/2021",
      priceEarly: 23.1,
      priceLast: 54.0,
    ),
  ].obs;
  RxInt? sortColumnIndex = 0.obs;
  RxBool isAscending = false.obs;
  final columns = ['Crop', 'Region', 'Tshs', '%'];

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
