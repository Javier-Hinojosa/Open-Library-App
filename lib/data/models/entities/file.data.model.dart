import 'dart:io';
import 'package:open_library/core/values/globals.dart';
import 'package:path/path.dart' as p;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class FileDataModel {
  final String field; // Nombre del campo
  final File file; // El archivo físico del sistema
  final String filename; // Nombre del archivo
  final MediaType contentType; // Tipo MIME del archivo

  FileDataModel({
    required this.field,
    required this.file,
    required this.filename,
    required this.contentType,
  });


  static Future<List<http.MultipartFile>> getMultipartFiles(List<FileDataModel> files) async {
    return await Future.wait(files.map((fileData) async =>
      // Crear el MultipartFile a partir de los bytes
       http.MultipartFile.fromBytes(
        fileData.field,  // Leer los bytes del archivo
        await fileData.file.readAsBytes(), // Bytes del archivo
        filename: fileData.filename, // Nombre del archivo
        contentType: fileData.contentType, // Tipo MIME del archivo
      )));
  }

  static List<FileDataModel> getModels(String field, List<File> files)  {
    return files.map((fileData)  {
      // Leer los bytes del archivo

      // Extraer la extensión del archivo usando el paquete `path`
      final extension = p.extension(fileData.path).replaceFirst('.', '');

      // Obtener el MediaType basado en la extensión
      var mediaType = Globals.mimeTypes[extension] ?? MediaType('application', 'octet-stream');

      // Crear el MultipartFile a partir de los bytes
      return FileDataModel(
        field: field,                  // Nombre del campo
        file: fileData,                  // Bytes del archivo
        filename: p.basename(fileData.path), // Nombre del archivo
        contentType: mediaType, // Tipo MIME del archivo
      );
    }).toList();
  }

  static FileDataModel? getModel(String field, File? file)  {
    if(file!= null){
      // Extraer la extensión del archivo usando el paquete `path`
      final extension = p.extension(file.path).replaceFirst('.', '');

      // Obtener el MediaType basado en la extensión
      var mediaType = Globals.mimeTypes[extension] ?? MediaType('application', 'octet-stream');

      // Crear el MultipartFile a partir de los bytes
      return FileDataModel(
        field: field,                  // Nombre del campo
        file: file,                  // Bytes del archivo
        filename: p.basename(file.path), // Nombre del archivo
        contentType: mediaType, // Tipo MIME del archivo
      );
    }else
      return null;
  }

}

