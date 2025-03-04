import 'package:open_library/core/values/enums.dart';
import 'package:open_library/data/models/entities/search/search.model.dart';

abstract class ISearchService {
  Future<SearchModel> searchGeneral(String query,{String? author, String? book,FilterSorts? sort});
}