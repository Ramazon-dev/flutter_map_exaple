import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_example/size_config.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
// import "package:latlong2/latlong.dart" as latLng;

class FlutterMapsPage extends StatefulWidget {
  const FlutterMapsPage({super.key});

  @override
  State<FlutterMapsPage> createState() => _FlutterMapsPageState();
}

class _FlutterMapsPageState extends State<FlutterMapsPage> {
  MapController controller = MapController();
  List<LatLng> listOfMarkers = [
    LatLng(41.3494548, 69.2171245),
    LatLng(41.574368, 64.183319),
    LatLng(41.311081, 69.240562),
    LatLng(41.311081, 69.240562),
    LatLng(40.08444, 65.37917),
    LatLng(40.7833302, 72.333332),
    LatLng(40.9983, 71.67257),
    LatLng(42.45306, 59.61028),
    LatLng(41.270858, 69.187466),
    LatLng(41.31319414345056, 69.19151488615174),
    LatLng(41.3491048, 69.2175245),
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Map"),
      ),
      body: SlidingUpPanel(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        maxHeight: 320,
        minHeight: 100,
        panel: Container(
          alignment: Alignment.center,
          child: const Text("Panel"),
        ),
        body: FlutterMap(
          mapController: controller,
          options: MapOptions(
            minZoom: 10.0,
            center: LatLng(41.3494548, 69.2171245),
          ),
          layers: [
            TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions(
              markers: List.generate(
                listOfMarkers.length,
                (index) => Marker(
                  width: 80.0,
                  height: 80.0,
                  point: listOfMarkers[index],
                  builder: (ctx) => InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container();
                          },
                        );
                      },
                      child: Image.asset("assets/images/location.png")),
                ),
              ),
            ),
          ],
          children: [
            Container(
              height: 300,
              width: 300,
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
