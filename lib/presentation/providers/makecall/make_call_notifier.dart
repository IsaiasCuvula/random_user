import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/domain/usecases/makecall/makecall.dart';

class MakeCallNotifier extends StateNotifier<String> {
  MakeCallNotifier(this._makeCallUseCase) : super('');

  final MakeCallUseCase _makeCallUseCase;

  Future<void> makeCall(String phoneNumber) async {
    await _makeCallUseCase.execute(phoneNumber);
  }
}
