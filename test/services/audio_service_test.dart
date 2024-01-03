/*

  Created by: Bakhromjon Polat
  Created on: Jan 03 2024 05:39:56
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/
import 'package:flutter_test/flutter_test.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mockito/mockito.dart';
import 'package:yaaseen/services/services.dart';

class MockAudioPlayer extends Mock implements AudioPlayer {}

void main() {
  late AppAudioService audioService;
  late MockAudioPlayer mockAudioPlayer;

  setUp(() {
    mockAudioPlayer = MockAudioPlayer();
    audioService = AppAudioService(mockAudioPlayer);
  });

  group('AppAudioService Tests', () {
    test('Initialization Test', () async {
      // Arrange
      // when(mockAudioPlayer.setAudioSource(any))
      //     .thenAnswer((_) => Future.value());

      // Act
      await audioService.init();

      // Assert
      // verify(mockAudioPlayer.setAudioSource(any)).called(1);
    });

    test('Play Test', () async {
      // Arrange
      when(mockAudioPlayer.play()).thenAnswer((_) => Future.value());

      // Act
      await audioService.play();

      // Assert
      verify(mockAudioPlayer.play()).called(1);
    });

    test('Pause Test', () async {
      // Arrange
      when(mockAudioPlayer.pause()).thenAnswer((_) => Future.value());

      // Act
      await audioService.pause();

      // Assert
      verify(mockAudioPlayer.pause()).called(1);
    });

    test('Stop Test', () async {
      // Arrange
      when(mockAudioPlayer.stop()).thenAnswer((_) => Future.value());

      // Act
      await audioService.stop();

      // Assert
      verify(mockAudioPlayer.stop()).called(1);
    });

    test('Seek To Index Test', () async {
      // Arrange
      when(mockAudioPlayer.seek(any, index: anyNamed('index')))
          .thenAnswer((_) => Future.value());

      // Act
      await audioService.seekToIndex(1);

      // Assert
      verify(mockAudioPlayer.seek(any, index: 1)).called(1);
    });

    test('Seek To Next Test', () async {
      // Arrange
      when(mockAudioPlayer.seekToNext()).thenAnswer((_) => Future.value());

      // Act
      await audioService.seekToNext();

      // Assert
      verify(mockAudioPlayer.seekToNext()).called(1);
    });

    test('Seek To Previous Test', () async {
      // Arrange
      when(mockAudioPlayer.seekToPrevious()).thenAnswer((_) => Future.value());

      // Act
      await audioService.seekToPrevious();

      // Assert
      verify(mockAudioPlayer.seekToPrevious()).called(1);
    });

    // You can add more tests as needed
  });
}
