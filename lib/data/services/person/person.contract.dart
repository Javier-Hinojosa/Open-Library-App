import 'package:open_library/data/models/entities/persons/person.model.dart';


abstract class IPersonService {
   Future<int> insertPerson(PersonModel person);
   Future<List<PersonModel>> getAllPersons();
   Future<int> updatePerson(PersonModel person);
   Future<int> deletePerson(int id);
}