import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class RingManager {
  static Soundpool pool = Soundpool.fromOptions(
      options: const SoundpoolOptions(streamType: StreamType.ring));

  static const ring = 'audio/mixkit-plastic-bubble-click-1124-short.wav';
  static int soundId = 0;

  void loadRing() async {
    soundId = await rootBundle.load(ring).then((ByteData soundData) {
      return pool.load(soundData);
    });
  }
}
