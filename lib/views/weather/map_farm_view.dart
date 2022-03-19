import 'dart:async';
import 'dart:collection';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shamba_huru/custom_widgets/app_loading_indicator.dart';

import 'package:shamba_huru/utils/app_colors.dart';
import 'package:shamba_huru/views/weather/map_farm_controller.dart';

class MapFarmView extends StatelessWidget {
  MapFarmView({Key? key}) : super(key: key);

  final MapFarmController _controller = Get.put(MapFarmController());
  final Completer<GoogleMapController> _googleController = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.deepGreen,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Plot My Farm",
        ),
        leading: Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.white,
        ),
      ),
      body: GetX<MapFarmController>(
          init: _controller,
          builder: (context) {
            if (!_controller.isLoading.value) {
              return FadeIn(
                child: GoogleMap(
                  zoomControlsEnabled: false,
                  padding: const EdgeInsets.all(0),
                  trafficEnabled: true,
                  polygons: _controller.polygons.value.toSet(),
                  mapType: MapType.hybrid,
                  initialCameraPosition: CameraPosition(
                    target:
                        LatLng(_controller.lat.value, _controller.lon.value),
                    zoom: 17.151926040649414,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _googleController.complete(controller);
                  },
                  onTap: (point) {
                    if (_controller.isPolygon.value) {
                      _controller.polygonLatLon?.add(point);
                      _controller.polygonLatLon
                          ?.removeWhere((element) => element == LatLng(0, 0));
                      _controller.setPolygon();
                    }
                  },
                ),
              );
            } else {
              return const AppLoadingIndicator(
                color: Colors.white,
              );
            }
          }),
    );
  }
}