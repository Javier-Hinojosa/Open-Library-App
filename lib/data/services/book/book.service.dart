import 'dart:convert';
import 'package:open_library/core/values/enums.dart';
import 'package:open_library/data/models/entities/book/book.model.dart';
import 'package:open_library/data/models/entities/book/rating.model.dart';
import 'package:open_library/data/services/base.service.dart';
import 'package:open_library/data/services/book/book.contract.dart';

class BookApiService extends BaseService implements IBookService {



  @override
  Future<BookModel> detail(String key) async{
    final response = await provider.request(RequestMethod.get,
        "${apiHost.api}$key.json");
    final Map<String, dynamic> jsonData = json.decode(response.result);
    return BookModel.fromJson(jsonData);
  }

  @override
  Future<RatingModel> rating(String key) async{
    try{
    final response = await provider.request(RequestMethod.get,
        "${apiHost.api}$key/ratings.json");
    final Map<String, dynamic> jsonData = json.decode(response.result);
    return RatingModel.fromJson(jsonData);
    }catch(e){
      return RatingModel();
    }
  }

}