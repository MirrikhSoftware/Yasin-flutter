import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:yaaseen/core/core.dart';

class AppAudioService {
  AppAudioService._instance() {
    _internal = this;
  }
  static AppAudioService? _internal;
  factory AppAudioService() => _internal ?? AppAudioService._instance();

  final _player = AudioPlayer();

  AudioPlayer get player => _player;

  Future<void> init() async {
    await JustAudioBackground.init(
      androidNotificationChannelId: 'com.ryanheise.myapp.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
    );

    'INIT ISHGA TUSHDI'.printf();

    final source = ConcatenatingAudioSource(
      children: List.generate(
        83,
        (index) {
          final verse = index;
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
    await _player.setAudioSource(source);
  }

  Future<void> play() => _player.play();
  Future<void> pause() => _player.pause();
  Future<void> stop() => _player.stop();
  Future<void> seekToIndex(int index) =>
      _player.seek(Duration.zero, index: index);
  Future<void> seekToNext() => _player.seekToNext();
  Future<void> seekToPrevious() => _player.seekToPrevious();

  Stream<PlayerState> get playerStateStream => _player.playerStateStream;

  bool get isPlaying => _player.playing;
}
