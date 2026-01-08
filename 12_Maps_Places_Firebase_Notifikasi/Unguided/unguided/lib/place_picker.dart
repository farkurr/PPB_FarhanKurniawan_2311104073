import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';

class PlacePickerScreen extends StatefulWidget {
  const PlacePickerScreen({super.key});

  @override
  State<PlacePickerScreen> createState() => _PlacePickerScreenState();
}

class _PlacePickerScreenState extends State<PlacePickerScreen> {
  static final LatLng _defaultLocation = const LatLng(
    -7.421825325207339,
    109.24125221012827,
  );
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Place Picker')),
      body: PlacePicker(
        apiKey: "AIzaSyAhLKzV0RnTmIyg1LM3Gbo62tucGfuZTn8",
        initialLocation: _defaultLocation,
        onPlacePicked: (LocationResult result) {
          Navigator.pop(context, result);
        },
        enableNearbyPlaces: true,
      ),
    );
  }
}
