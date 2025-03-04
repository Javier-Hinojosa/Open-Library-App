import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_library/app/providers/person.provider.dart';
import 'package:open_library/app/services/navigation.service.dart';
import 'package:open_library/app/utils/snack_bar.utils.dart';
import 'package:open_library/core/values/globals.dart';
import 'package:open_library/core/values/keys.dart';
import 'package:open_library/data/models/entities/persons/person.model.dart';
import 'package:open_library/data/services/person/person.contract.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegisterPersonProvider extends ChangeNotifier {

  final IPersonService _personService;
  late final FormGroup _form;
  late bool _isValidForm = false;
  late File? _selectedFile=null;



  FormGroup get form => _form;
  bool get isValidForm => _isValidForm;
  File? get selectedFile => _selectedFile;

  RegisterPersonProvider(this._personService){
    _initForm();
  }

  void _initForm(){
    _form=FormGroup({
      Keys.name: FormControl<String>(validators: [
        Validators.required,
        Validators.pattern(Globals.letters)
      ]),
      Keys.lastName: FormControl<String>(validators: [
        Validators.required,
        Validators.pattern(Globals.letters)
      ]),
      Keys.surname: FormControl<String>(validators: [
        Validators.required,
        Validators.pattern(Globals.letters)
      ]),
      Keys.phone: FormControl<String>(
          validators: [
            Validators.required
          ]),
      Keys.email: FormControl<String>(
          validators: [
            Validators.required,
            Validators.email
          ]),
      Keys.dateOfBirth: FormControl<DateTime>(
          validators: [
            Validators.required,
            Validators.max(DateTime.now())
          ]),
      Keys.age: FormControl<int>(),
      Keys.gender: FormControl<String>(
          validators: [
            Validators.required
          ])
    },
    validators: [
      Validators.required
    ]);

    _form.valueChanges.listen((p0) {
      if(_form.valid){
        _isValidForm=true;
      }else{
        _isValidForm=false;
      }
      notifyListeners();
    });
  }

  void registerPerson(BuildContext context) async {
    try{

      await _personService.insertPerson(PersonModel(
          name: _form.control(Keys.name).value,
          surnameFirst: _form.control(Keys.lastName).value,
          surnameSecond: _form.control(Keys.surname).value,
          phone: _form.control(Keys.phone).value,
          email: _form.control(Keys.email).value,
          dateOfBirth: _form.control(Keys.dateOfBirth).value.toString(),
          age: _form.control(Keys.age).value,
          gender: _form.control(Keys.gender).value,
          imagePath: _selectedFile
    ));

      Provider.of<PersonsProvider>(context,listen: false).fetchData();
      NavigationService.goBack();
      _selectedFile=null;
      _form.reset();
      SnackBarUtils.success(context, "Usuario registrado correctamente");
    }catch(e){
      print(e.toString());
      SnackBarUtils.error(context, e.toString());
    }
  }

  void pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _selectedFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  void onDeleteFile(BuildContext context) {
      _selectedFile = null;
      notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _form.dispose();
  }


}