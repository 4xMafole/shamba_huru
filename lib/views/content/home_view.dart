import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shamba_huru/controllers/content/home_controller.dart';
import 'package:shamba_huru/custom_widgets/cards/promo_card.dart';
import 'package:shamba_huru/custom_widgets/scrollable_widget.dart';
import 'package:shamba_huru/custom_widgets/trailing_header.dart';
import 'package:shamba_huru/custom_widgets/cards/weather_card.dart';
import 'package:shamba_huru/models/crop.dart';
import 'package:shamba_huru/utils/app_colors.dart';

class HomeView extends StatelessWidget {
  ScrollController sController;
  HomeView(this.sController, {Key? key}) : super(key: key);

  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.deepGreen,
        ),
        backgroundColor: AppColor.deepGreen,
        elevation: 0,
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        controller: sController,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PromoCard(),
              SizedBox(
                height: 50,
              ),
              WeatherCard(
                icon: "02d",
                temp: "18.72",
                feeltemp: "17.8",
                description: "Clear Sky",
              ),
              SizedBox(
                height: 30,
              ),
              TrailingHeader(
                heading: "Latest Market Prices",
              ),
              SizedBox(
                height: 30,
              ),
              _controller.cropData.value.crops.isEmpty
                  ? Center(
                      child: SizedBox(
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/price_chart.png",
                              width: 60,
                              height: 60,
                            ),
                            Text(
                              'No recent market activities',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : _sortableTable(context),
            ],
          ),
        ),
      ),
    );
  }

  _sortableTable(BuildContext context) {
    return ScrollableWidget(
      child: buildDataTable(context),
    );
  }

  Widget buildDataTable(BuildContext context) {
    return SizedBox(
      height: (MediaQuery.of(context).size.height) / 3,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Obx(
          () => DataTable(
            columnSpacing: 46,
            headingTextStyle: TextStyle(
              color: AppColor.pullmanBrown,
              fontWeight: FontWeight.bold,
            ),
            dataTextStyle: TextStyle(
              color: AppColor.pullmanBrown,
            ),
            sortAscending: _controller.isAscending.value,
            sortColumnIndex: _controller.sortColumnIndex!.value,
            columns: getColumns(_controller.columns),
            rows: getRows(_controller.cropData.value.crops),
          ),
        ),
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<Crop> crops) => (crops.map((Crop crop) {
        final cells = [
          crop.name,
          crop.location,
          _controller.priceFormatter(crop.priceLast),
          crop.pricePercentage().toPrecision(2),
        ];

        return DataRow(
          cells: getCells(cells, crop.pricePercentage()),
        );
      }).toList());

  List<DataCell> getCells(List<dynamic> cells, double pricePercentage) {
    if (pricePercentage < 0) {
      return cells.map((data) {
        return DataCell(
          Text(
            '$data',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        );
      }).toList();
    }
    return cells.map((data) {
      return DataCell(
        Text(
          '$data',
          style: TextStyle(
            color: Colors.green,
          ),
        ),
      );
    }).toList();
  }

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      _controller.cropData.value.crops.sort(
          (crop1, crop2) => compareString(ascending, crop1.name, crop2.name));
    } else if (columnIndex == 1) {
      _controller.cropData.value.crops.sort((crop1, crop2) =>
          compareString(ascending, crop1.location, crop2.location));
    } else if (columnIndex == 2) {
      _controller.cropData.value.crops.sort((crop1, crop2) => compareString(
          ascending, '${(crop1.priceLast)}', '${crop2.priceLast}'));
    } else if (columnIndex == 3) {
      _controller.cropData.value.crops.sort((crop1, crop2) => compareString(
          ascending,
          '${crop1.pricePercentage()}',
          '${crop2.pricePercentage()}'));
    }

    _controller.updateIndices(columnIndex, ascending);
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
