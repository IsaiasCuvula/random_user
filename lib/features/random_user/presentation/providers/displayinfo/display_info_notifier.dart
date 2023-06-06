import 'package:flutter_riverpod/flutter_riverpod.dart';

class DisplayInfoNotifier extends StateNotifier<String> {
  DisplayInfoNotifier(String name) : super(name);

  void updateInfo(String? info) {
    state = info.toString();
  }
}
