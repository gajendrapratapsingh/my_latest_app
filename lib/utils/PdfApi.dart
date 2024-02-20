import 'dart:io';

import 'package:myapp/utils/AppUtils.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class PdfApi {
  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes);

    return file;
  }

  static Future<OpenResult> openFile(File file) async {
    final url = file.path;

    print("open ${file.path}");

    var result = await OpenFilex.open(url);
    return result;
  }

  static Future<List<File>> getAllFilesFromDirectory() async {
    final dir = await getApplicationDocumentsDirectory();
    final files = await dir.list().toList(); // Get a list of FileSystemEntity objects

    List<File> fileList = [];

    List<FileSystemEntity> pdfFiles = files.where((file) => file.path.endsWith('.pdf')).toList();

    // Iterate through the list of FileSystemEntity objects and filter out files
    for(var entity in pdfFiles) {
      if(entity is File) {
        fileList.add(entity);
      }
    }
    return fileList;
  }

  static Future<bool> deleteFile(String name) async{
    try{
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$name');
      file.deleteSync();
      return true;
    }
    catch(e){
       return false;
    }
  }
}