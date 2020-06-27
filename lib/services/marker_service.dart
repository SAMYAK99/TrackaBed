import 'dart:math';

import 'package:bedtracker/models/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerService {
  List<Marker> getMarkers(List<Place> places) {
    var markers = List<Marker>();

    places.forEach((place) {
      Marker marker = Marker(
          markerId: MarkerId(place.name),
          draggable: false,
          icon: place.icon,
          infoWindow: InfoWindow(
            title: place.name,
            //  snippet: place.vicinity,
            snippet: "Number of Beds Available : ${ran()} ",
          ),
          position:
              LatLng(place.geometry.location.lat, place.geometry.location.lng));

      markers.add(marker);
    });

    return markers;
  }

  int ran() {
    Random random = new Random();
    int randomNumber = random.nextInt(100);
    return randomNumber;
  }
}
