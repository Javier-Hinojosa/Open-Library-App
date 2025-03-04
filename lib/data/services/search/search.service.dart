import 'dart:convert';

import 'package:open_library/core/values/enums.dart';
import 'package:open_library/data/models/entities/search/search.model.dart';
import 'package:open_library/data/services/base.service.dart';
import 'package:open_library/data/services/search/search.contract.dart';

class SearchApiService extends BaseService implements ISearchService {

  @override
  Future<SearchModel> searchGeneral(String query,{String? author, String? book, FilterSorts? sort}) async{
    final response = await provider.request(RequestMethod.get,
        "${apiHost.api}/search.json?q=$query"
            + (author != null ? "&author=$author" : "")
            + (book != null ? "&title=$book" : "")
            + "&limit=10"
            + (sort != null ? "&sort=${sort.value}" : "")
    );
    final Map<String, dynamic> jsonData = json.decode(response.result);
    return SearchModel.fromJson(jsonData);
  }

}