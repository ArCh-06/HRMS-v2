import 'dart:io';
import 'dart:convert';

void main() {
  final dst = 'assets/images/KemicalKonnect.png';
  final dstFile = File(dst);
  if (dstFile.existsSync()) dstFile.copySync('$dst.bak');

  // 1x1 transparent PNG (safe minimal replacement)
  const b64 = 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGNgYAAAAAMAASsJTYQAAAAASUVORK5CYII=';
  final bytes = base64Decode(b64);
  dstFile.writeAsBytesSync(bytes);
  print('Wrote minimal valid PNG to $dst (backup at $dst.bak if existed)');
}
