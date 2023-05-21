import 'package:just_audio/just_audio.dart';
import 'package:yaaseen/core/core.dart';

class AppAudioService {
  static late AudioHandler _handler;
  static AudioHandler get handler => _handler;
  static Future init() async {
    _handler = await AudioService.init(
      builder: () => AudioPlayerHandler(),
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.ryanheise.myapp.channel.audio',
        androidNotificationChannelName: 'Audio playback',
        androidNotificationOngoing: true,
      ),
    );
  }

  static Future<void> play() async {
    _handler.play();
  }
}

/// An [AudioHandler] for playing a single item.
class AudioPlayerHandler extends BaseAudioHandler with SeekHandler {
  final _player = AudioPlayer();

  final source = ConcatenatingAudioSource(
    children: List.generate(
      83,
      (index) {
        int verse = index + 1;
        final id = 'asset:///assets/audio/$verse.mp3';
        return AudioSource.uri(
          Uri.parse(id),
          tag: MediaItem(
            id: id,
            title: 'Yosin sursi $verse-oyat',
            displayTitle: 'Yosin sursi $verse-oyat',
            displaySubtitle: 'Mishary bin al-Afasy',
            album: "Qur'oni Karim",
            artist: 'Mishary bin al-Afasy',
            artUri: Uri.parse(
                'https://images.unsplash.com/photo-1609599006353-e629aaabfeae?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cXVyYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80'),
          ),
        );
      },
    ),
  );
  AudioPlayerHandler() {
    _player.playbackEventStream.map(_transformEvent).pipe(playbackState);
    const id = 'asset:///assets/audio/0.mp3';

    _player.setAudioSource(AudioSource.uri(
      Uri.parse(id),
      tag: MediaItem(
        id: id,
        title: 'Yosin sursi -oyat',
        displayTitle: 'Yosin sursi 7===-oyat',
        displaySubtitle: 'Mishary bin al-Afasy',
        album: "Qur'oni Karim",
        artist: 'Mishary bin al-Afasy',
        artUri: Uri.parse(
            'https://images.unsplash.com/photo-1609599006353-e629aaabfeae?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cXVyYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80'),
      ),
    ));
    // _player.setAudioSource(AudioSource.uri(Uri.parse(_item.id)));
  }

  // In this simple example, we handle only 4 actions: play, pause, seek and
  // stop. Any button press from the Flutter UI, notification, lock screen or
  // headset will be routed through to these 4 methods so that you can handle
  // your audio playback logic in one place.

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> stop() => _player.stop();

  /// Transform a just_audio event into an audio_service state.
  ///
  /// This method is used from the constructor. Every event received from the
  /// just_audio player will be transformed into an audio_service state so that
  /// it can be broadcast to audio_service clients.
  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: [
        MediaControl.skipToPrevious,
        if (_player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.stop,
        MediaControl.skipToNext,
      ],
      systemActions: const {
        MediaAction.seek,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      },
      androidCompactActionIndices: const [0, 1, 3],
      processingState: const {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[_player.processingState]!,
      playing: _player.playing,
      updatePosition: _player.position,
      bufferedPosition: _player.bufferedPosition,
      speed: _player.speed,
      queueIndex: event.currentIndex,
    );
  }
}
