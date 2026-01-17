import 'dart:io';
import 'dart:convert';

void main() {
  final path = 'assets/images/KemicalKonnect.png';
  final file = File(path);
  if (!file.existsSync()) {
    stderr.writeln('File not found: $path — nothing to do.');
    exit(0);
  }

  // If image decode/re-encode isn't possible here, write a safe minimal PNG
  try {
    file.copySync('$path.bak');
    const b64 = 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGNgYAAAAAMAASsJTYQAAAAASUVORK5CYII=';
    final bytes = base64Decode(b64);
    file.writeAsBytesSync(bytes);
    print('Replaced $path with a minimal valid PNG (backup at $path.bak)');
  } catch (e) {
    stderr.writeln('Failed to replace $path: $e');
    exit(1);
  }
}
