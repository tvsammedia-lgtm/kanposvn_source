import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../tracking_config.dart';
import '../tracking_models.dart';

/// Widget bản đồ OSM dùng chung — §38/§39.
///
/// Vẽ tile OpenStreetMap, polyline đường đi (đã đi), marker vị trí hiện tại
/// (xoay theo heading) và vòng tròn "giao điểm bán kính" mặc định. Dùng chung
/// cho mọi module; UI điều khiển (start/pause/stop) ở tầng trên.
class KanPosTrackMap extends StatefulWidget {
  final List<TrackPoint> points;
  final TrackPoint? current;
  final Color accentColor;
  final double? followZoom;

  /// Tâm ban đầu khi chưa có điểm nào.
  final LatLng initialCenter;

  /// Bán kính vẽ vòng tròn "bán kính giới hạn" (radius default = config).
  final double? geofenceRadius;

  const KanPosTrackMap({
    super.key,
    required this.points,
    this.current,
    this.accentColor = Colors.blue,
    this.followZoom = 16,
    this.initialCenter = const LatLng(10.762622, 106.660172),
    this.geofenceRadius,
  });

  @override
  State<KanPosTrackMap> createState() => _KanPosTrackMapState();
}

class _KanPosTrackMapState extends State<KanPosTrackMap> {
  final MapController _mapController = MapController();
  bool _ready = false;

  LatLng? get _currentLatLng => widget.current == null
      ? null
      : LatLng(widget.current!.latitude, widget.current!.longitude);

  @override
  void didUpdateWidget(KanPosTrackMap old) {
    super.didUpdateWidget(old);
    // Bám theo điểm hiện tại khi nó di chuyển (chỉ khi đang running & đã sẵn sàng).
    if (_ready && _currentLatLng != null) {
      final last = old.current;
      if (last == null ||
          widget.current!.latitude != last.latitude ||
          widget.current!.longitude != last.longitude) {
        _mapController.move(_currentLatLng!, widget.followZoom ?? 16);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final latLngs =
        widget.points.map((p) => LatLng(p.latitude, p.longitude)).toList();

    // Marker đầu: vòng tròn xanh lá.
    // Marker hiện tại: mũi tên/xe xoay theo heading.
    final markers = <Marker>[];

    if (widget.current == null && latLngs.isNotEmpty) {
      markers.add(Marker(
        key: const ValueKey('track-end'),
        point: latLngs.last,
        width: 34,
        height: 34,
        child: Icon(Icons.place, color: widget.accentColor, size: 34),
      ));
    }

    final current = _currentLatLng;
    if (current != null) {
      markers.add(Marker(
        key: const ValueKey('current'),
        point: current,
        width: 40,
        height: 40,
        child: Transform.rotate(
          angle: (widget.current?.heading ?? 0) * 3.141592653589793 / 180,
          child: Icon(Icons.navigation,
              color: widget.accentColor, size: 40),
        ),
      ));
    }

    final radius = widget.geofenceRadius ?? TrackingConfig.defaultGeofenceRadius;
    final centerForRadius =
        widget.current != null ? current! : (latLngs.isNotEmpty ? latLngs.first : null);

    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: centerForRadius ?? widget.initialCenter,
        initialZoom: 14,
        minZoom: 3,
        maxZoom: 19,
        backgroundColor: const Color(0xFFE5E7EB),
        onMapReady: () {
          _ready = true;
          final c = centerForRadius;
          if (c != null) {
            _mapController.move(c, 15);
          }
        },
      ),
      children: [
        TileLayer(
          urlTemplate: TrackingConfig.osmTileUrl,
          userAgentPackageName: 'com.kanposvn.tracking',
          maxNativeZoom: 19,
          maxZoom: 19,
        ),
        if (centerForRadius != null)
          CircleLayer<int>(circles: [
            CircleMarker<int>(
              point: centerForRadius,
              radius: radius,
              useRadiusInMeter: true,
              color: widget.accentColor.withValues(alpha: 0.12),
              borderColor: widget.accentColor.withValues(alpha: 0.5),
              borderStrokeWidth: 2,
            ),
          ]),
        if (latLngs.isNotEmpty)
          PolylineLayer(polylines: [
            Polyline(
              points: latLngs,
              strokeWidth: 4,
              color: widget.accentColor,
              borderStrokeWidth: 1,
              borderColor: Colors.black26,
            ),
          ]),
        MarkerLayer(markers: markers),
        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              TrackingConfig.osmAttribution,
              onTap: null, // tắt link mở ngoài (offline-friendly)
            ),
          ],
        ),
      ],
    );
  }
}