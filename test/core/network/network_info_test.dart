import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_user/core/core.dart';

class ConnectivityMock extends Mock implements Connectivity {}

void main() {
  late NetworkInfo networkInfo;
  late ConnectivityMock connectivityMock;

  setUp(() {
    connectivityMock = ConnectivityMock();
    networkInfo = NetworkInfoImpl(connectivityMock);
  });

  group('network info', () {
    test('Should return true if connected to mobile network', () async {
      //arrange
      when(() => connectivityMock.checkConnectivity()).thenAnswer(
        (_) async => ConnectivityResult.mobile,
      );

      //act
      final result = await networkInfo.isConnected;
      //assert

      verify((() => connectivityMock.checkConnectivity()));
      expect(result, true);
    });

    test('Should return true if connected to wifi network', () async {
      //arrange
      when(() => connectivityMock.checkConnectivity()).thenAnswer(
        (_) async => ConnectivityResult.wifi,
      );

      //act
      final result = await networkInfo.isConnected;
      //assert

      verify((() => connectivityMock.checkConnectivity()));
      expect(result, true);
    });

    test('Should return true if connected to ethernet network', () async {
      //arrange
      when(() => connectivityMock.checkConnectivity()).thenAnswer(
        (_) async => ConnectivityResult.ethernet,
      );

      //act
      final result = await networkInfo.isConnected;
      //assert

      verify((() => connectivityMock.checkConnectivity()));
      expect(result, true);
    });

    test('Should return false if not connected to any network', () async {
      //arrange
      when(() => connectivityMock.checkConnectivity()).thenAnswer(
        (_) async => ConnectivityResult.none,
      );

      //act
      final result = await networkInfo.isConnected;
      //assert

      verify((() => connectivityMock.checkConnectivity()));
      expect(result, false);
    });
  });
}
