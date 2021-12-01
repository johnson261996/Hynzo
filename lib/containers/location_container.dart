import 'package:flutter/material.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/utils/toast_util.dart';
import 'package:hynzo/widgets/location/location_widget.dart';
import 'package:geolocator/geolocator.dart';

class LocationContainer extends StatefulWidget {
  const LocationContainer({Key? key}) : super(key: key);

  @override
  State<LocationContainer> createState() => _LocationContainerState();
}

class _LocationContainerState extends State<LocationContainer> {
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  _navigateToSuggestScreen() {
    _determinePosition()
        .then(
          (value) => Navigator.pushReplacementNamed(context, Routes.suggetion),
        )
        .onError(
          (error, stackTrace) =>
              ToastUtil().showToast(error.toString()),
        );
  }

  @override
  Widget build(BuildContext context) {
    return LocationWidget(
      checkPosition: _navigateToSuggestScreen,
    );
  }
}
