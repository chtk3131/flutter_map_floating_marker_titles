import 'package:flutter/widgets.dart';
import 'package:flutter_floating_map_marker_titles_core/controller/fmto_controller.dart';
import 'package:flutter_floating_map_marker_titles_core/controller/map_view_interface/abstract_map_view_interface.dart';
import 'package:flutter_floating_map_marker_titles_core/model/floating_marker_title_info.dart';
import 'package:flutter_floating_map_marker_titles_core/view/floating_marker_titles_overlay.dart';

abstract class AbstractMapViewWrapper<T extends AbstractMapViewInterface> extends StatelessWidget {
  final T _mapViewInterface;
  final List<FloatingMarkerTitleInfo> _floatingTitles;
  final FMTOOptions _fmtoOptions;

  const AbstractMapViewWrapper(
    this._mapViewInterface,
    this._floatingTitles,
    this._fmtoOptions, {
    Key? key,
  }) : super(key: key);

  Widget buildMapView(final BuildContext context, final T mapViewInterface);

  @override
  Widget build(final BuildContext context) {
    return Stack(
      children: [
        buildMapView(context, _mapViewInterface),
        FlutterMapFloatingMarkerTitlesOverlay(
          _mapViewInterface,
          _floatingTitles,
          _fmtoOptions,
        ),
      ],
    );
  }
}
