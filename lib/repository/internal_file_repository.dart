import 'dart:io';

import 'package:path_provider/path_provider.dart';

class InternalFileRepository {
  final String fileName;
  
  Future<String> get filePath async {
    return (await getApplicationDocumentsDirectory()).path;
  }
  
  Future<File> get _file async {
    print('${await filePath}/$fileName');
    return File('${await filePath}/$fileName');
  }

  InternalFileRepository({this.fileName});

  Future<void> save(String textToSave) async {
    print('writing file');
    await (await _file).writeAsString(textToSave);
    print('file written');
  }

  Future<String> read() async {
    try {
      print('reading file');
      return await (await _file).readAsString();
    } catch (e) {
      return null;
    }
  }
}