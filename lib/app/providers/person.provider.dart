import 'package:flutter/material.dart';
import 'package:open_library/data/models/entities/persons/person.model.dart';
import 'package:open_library/data/services/person/person.contract.dart';

class PersonsProvider extends ChangeNotifier {

  final IPersonService _personService;
  late bool _loading=true;
  late List<PersonModel> _persons=[];

  List<PersonModel> get persons => _persons;
  bool get loading => _loading;

  PersonsProvider(this._personService);

  fetchData() async {
    _loading=true;
    notifyListeners();

    _persons = await _personService.getAllPersons();

    _loading=false;
    notifyListeners();

  }




}