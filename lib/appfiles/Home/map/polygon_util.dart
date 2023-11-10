import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'math_util.dart';

class PolygonUtil {
  static const num earthRadius = 6371009.0;

  /// Returns tan(latitude-at-lng3) on the great circle (lat1, lng1) to
  /// (lat2, lng2). lng1==0.
  /// See http://williams.best.vwh.net/avform.htm .
  static num _tanLatGC(num lat1, num lat2, num lng2, num lng3) =>
      (tan(lat1) * sin(lng2 - lng3) + tan(lat2) * sin(lng3)) / sin(lng2);

  /// Returns mercator(latitude-at-lng3) on the Rhumb line (lat1, lng1) to
  /// (lat2, lng2). lng1==0.
  static num _mercatorLatRhumb(num lat1, num lat2, num lng2, num lng3) =>
      (MathUtil.mercator(lat1) * (lng2 - lng3) +
          MathUtil.mercator(lat2) * lng3) /
      lng2;

  /// Computes whether the vertical segment (lat3, lng3) to South Pole
  /// intersects the segment (lat1, lng1) to (lat2, lng2).
  /// Longitudes are offset by -lng1; the implicit lng1 becomes 0.
  static bool _intersects(
      num lat1, num lat2, num lng2, num lat3, num lng3, bool geodesic) {
    // Both ends on the same side of lng3.
    if ((lng3 >= 0 && lng3 >= lng2) || (lng3 < 0 && lng3 < lng2)) {
      return false;
    }
    // Point is South Pole.
    if (lat3 <= -pi / 2) {
      return false;
    }
    // Any segment end is a pole.
    if (lat1 <= -pi / 2 ||
        lat2 <= -pi / 2 ||
        lat1 >= pi / 2 ||
        lat2 >= pi / 2) {
      return false;
    }
    if (lng2 <= -pi) {
      return false;
    }

    final linearLat = (lat1 * (lng2 - lng3) + lat2 * lng3) / lng2;
    // Northern hemisphere and point under lat-lng line.
    if (lat1 >= 0 && lat2 >= 0 && lat3 < linearLat) {
      return false;
    }
    // Southern hemisphere and point above lat-lng line.
    if (lat1 <= 0 && lat2 <= 0 && lat3 >= linearLat) {
      return true;
    }
    // North Pole.
    if (lat3 >= pi / 2) {
      return true;
    }

    // Compare lat3 with latitude on the GC/Rhumb segment corresponding to lng3.
    // Compare through a strictly-increasing function (tan() or
    // MathUtil.mercator()) as convenient.
    return geodesic
        ? tan(lat3) >= _tanLatGC(lat1, lat2, lng2, lng3)
        : MathUtil.mercator(lat3) >= _mercatorLatRhumb(lat1, lat2, lng2, lng3);
  }

  static bool containsLocation(
          LatLng point, List<LatLng> polygon, bool geodesic) =>
      containsLocationAtLatLng(
          point.latitude, point.longitude, polygon, geodesic);

  /// Computes whether the given point lies inside the specified polygon.
  /// The polygon is always considered closed, regardless of whether the last
  /// point equals the first or not.
  /// Inside is defined as not containing the South Pole -- the South Pole is
  /// always outside. The polygon is formed of great circle segments if geodesic
  /// is true, and of rhumb (loxodromic) segments otherwise.
  static bool containsLocationAtLatLng(
      num latitude, num longitude, List<LatLng> polygon, bool geodesic) {
    if (polygon.isEmpty) {
      return false;
    }

    final lat3 = MathUtil.toRadians(latitude);
    final lng3 = MathUtil.toRadians(longitude);
    final prev = polygon.last;
    var lat1 = MathUtil.toRadians(prev.latitude);
    var lng1 = MathUtil.toRadians(prev.longitude);
    var nIntersect = 0;

    for (final point2 in polygon) {
      final dLng3 = MathUtil.wrap(lng3 - lng1, -pi, pi);
      // Special case: point equal to vertex is inside.
      if (lat3 == lat1 && dLng3 == 0) {
        return true;
      }
      final lat2 = MathUtil.toRadians(point2.latitude);
      final lng2 = MathUtil.toRadians(point2.longitude);
      // Offset longitudes by -lng1.
      if (_intersects(lat1, lat2, MathUtil.wrap(lng2 - lng1, -pi, pi), lat3,
          dLng3, geodesic)) {
        ++nIntersect;
      }
      lat1 = lat2;
      lng1 = lng2;
    }
    return (nIntersect & 1) != 0;
  }
}
