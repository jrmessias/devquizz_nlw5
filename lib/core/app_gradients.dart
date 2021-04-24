import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class AppGradients {
  static final linear = LinearGradient(colors: [
    Color(0xFFdce35b),
    Color(0xFF45b649), //.fromRGBO(130, 87, 229, 0.695),
  ], stops: [
    0.0,
    0.695
  ], transform: GradientRotation(pi * 2));
}
