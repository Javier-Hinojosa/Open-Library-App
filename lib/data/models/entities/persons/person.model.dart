import 'dart:io';
import 'package:open_library/data/models/entities/file.data.model.dart';

class PersonModel {
  final int? id;
  final String name;
  final String surnameFirst;
  final String surnameSecond;
  final String phone;
  final String email;
  final String dateOfBirth;
  final int age;
  final String gender;
  final File? imagePath;

  late final  FileDataModel? _imageFile;

  FileDataModel? get imageFile => _imageFile;

  PersonModel({
    this.id,
    required this.name,
    required this.surnameFirst,
    required this.surnameSecond,
    required this.phone,
    required this.email,
    required this.dateOfBirth,
    required this.age,
    required this.gender,
    this.imagePath
  }):_imageFile=  FileDataModel.getModel('image_path', imagePath);


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'surname_first': surnameFirst,
      'surname_second': surnameSecond,
      'phone': phone,
      'email': email,
      'date_of_birth': dateOfBirth,
      'age': age,
      'gender': gender,
      'image_path' : imagePath != null
          ? imagePath?.path
          : null
    };
  }

  static PersonModel fromMap(Map<String, dynamic> map) {
    return PersonModel(
      id: map['id'],
      name: map['name'],
      surnameFirst: map['surname_first'],
      surnameSecond: map['surname_second'],
      phone: map['phone'],
      email: map['email'],
      dateOfBirth: map['date_of_birth'],
      age: map['age'],
      gender: map['gender'],
      imagePath: map['image_path'] != null
          ? File(map['image_path'])
          : null
    );
  }
}