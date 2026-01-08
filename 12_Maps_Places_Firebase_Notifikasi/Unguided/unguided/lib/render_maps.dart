import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';
import 'place_picker.dart';

class RenderMaps extends StatefulWidget {
  const RenderMaps({super.key});

  @override
  State<RenderMaps> createState() => _RenderMapsState();
}

class _RenderMapsState extends State<RenderMaps> {
  static final LatLng _defaultLocation = const LatLng(
    -7.421825325207339,
    109.24125221012827,
  );
  static final CameraPosition _cameraPosition = CameraPosition(
    target: _defaultLocation,
    zoom: 14,
  );

  LocationResult? _picked;
  final Set<Marker> _markers = {};

  void _openPlacePicker() async {
    final LocationResult? result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const PlacePickerScreen()),
    );
    if (result != null) {
      setState(() {
        _picked = result;
        final LatLng? pos = result.latLng;
        _markers.clear();
        if (pos != null) {
          _markers.add(
            Marker(markerId: const MarkerId('picked'), position: pos),
          );
        }
      });
    }
  }

  Widget _buildInfoCard() {
    if (_picked == null) return const SizedBox.shrink();
    final LatLng? pos = _picked!.latLng;
    final String title =
        _picked!.name ?? _picked!.formattedAddress ?? 'Lokasi Terpilih';
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          if (_picked!.formattedAddress != null)
            Text(_picked!.formattedAddress!),
          if (pos != null) ...[
            const SizedBox(height: 8),
            Text(
              'Koordinat: ${pos.latitude.toStringAsFixed(6)}, '
              '${pos.longitude.toStringAsFixed(6)}',
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Render Maps & Place Picker')),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _cameraPosition,
            markers: _markers,
            myLocationButtonEnabled: true,
          ),
          Positioned(left: 0, right: 0, bottom: 0, child: _buildInfoCard()),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openPlacePicker,
        icon: const Icon(Icons.place),
        label: const Text('Pilih Lokasi'),
      ),
    );
  }
}
