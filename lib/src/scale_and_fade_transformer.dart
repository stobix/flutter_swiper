// @dart = 2.17

import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:flutter/material.dart';

class ScaleAndFadeTransformer extends PageTransformer {
  final double? _scale;
  final double? _fade;

  ScaleAndFadeTransformer({double? fade: 0.3, double? scale: 0.8})
      : _fade = fade,
        _scale = scale;

  @override
  Widget transform(Widget item, TransformInfo info) {
    double? position = info.position;
    Widget child = item;
    if (_scale != null && position != null) {
      double scaleFactor = (1 - position.abs()) * (1 - _scale!);
      double scale = _scale! + scaleFactor;

      child = new Transform.scale(
        scale: scale,
        child: item,
      );
    }

    if (_fade != null && position != null) {
      double fadeFactor = (1 - position.abs()) * (1 - _fade!);
      double opacity = _fade! + fadeFactor;
      child = new Opacity(
        opacity: opacity,
        child: child,
      );
    }

    return child;
  }
}
