import 'dart:io';
import 'package:image/image.dart';

void main() {
  final path = 'assets/images/KemicalKonnect.png';
  final file = File(path);
  if (!file.existsSync()) {
    stderr.writeln('File not found: $path');
    exit(1);
  }

  try {
    final bytes = file.readAsBytesSync();
    final img = decodeImage(bytes);
    if (img == null) {
      stderr.writeln('Image decode returned null — file may be corrupt or in unsupported format.');
      exit(2);
    }

    final encoded = encodePng(img);
    file.copySync('\$path.bak');
    file.writeAsBytesSync(encoded);
    print('Re-encoded PNG written to $path (backup at $path.bak)');
  } catch (e) {
    stderr.writeln('Failed to re-encode image: $e');
    exit(3);
  }
}
