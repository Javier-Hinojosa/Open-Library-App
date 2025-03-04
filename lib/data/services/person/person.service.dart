import 'package:open_library/data/helpers/database_persons.helper.dart';
import 'package:open_library/data/models/entities/persons/person.model.dart';
import 'package:open_library/data/services/base.service.dart';
import 'package:open_library/data/services/person/person.contract.dart';

class PersonApiService extends BaseService implements IPersonService {

  @override
  Future<int> insertPerson(PersonModel person) async {
    final db = await DatabaseHelper.database;
    return await db.insert('persons', person.toMap());
  }

  @override
   Future<List<PersonModel>> getAllPersons() async {
    final db = await DatabaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('persons');
    return maps.map((map) => PersonModel.fromMap(map)).toList();
  }

  @override
   Future<int> updatePerson(PersonModel person) async {
    final db = await DatabaseHelper.database;
    return await db.update('persons', person.toMap(), where: 'id = ?', whereArgs: [person.id]);
  }

  @override
   Future<int> deletePerson(int id) async {
    final db = await DatabaseHelper.database;
    return await db.delete('persons', where: 'id = ?', whereArgs: [id]);
  }

}