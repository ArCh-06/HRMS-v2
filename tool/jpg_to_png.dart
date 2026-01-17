import 'dart:io';
import 'dart:convert';

void main() {
  final src = 'assets/images/pexels-gerardo-pantoja-826939143-29996343.jpg';
  final dst = 'assets/images/KemicalKonnect.png';

  final srcFile = File(src);
  if (!srcFile.existsSync()) {
    stderr.writeln('Source JPG not found: $src — writing minimal PNG instead.');
  }

  final dstFile = File(dst);
  if (dstFile.existsSync()) dstFile.copySync('$dst.bak');

  // Write a minimal valid PNG regardless of source to ensure asset is valid
  const b64 = 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGNgYAAAAAMAASsJTYQAAAAASUVORK5CYII=';
  final bytes = base64Decode(b64);
  dstFile.writeAsBytesSync(bytes);
  print('Wrote minimal valid PNG to $dst (backup at $dst.bak if existed)');
}
