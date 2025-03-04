import 'package:flutter/material.dart';
import 'package:open_library/app/utils/config.utils.dart';
import 'package:open_library/core/values/enums.dart';
import 'package:open_library/data/models/entities/search/search.model.dart';
import 'package:open_library/data/services/search/search.contract.dart';

class HomeProvider extends ChangeNotifier {

 final  ISearchService _searchService;
 late bool _loadingPrincipalResults = true;
  late List<SearchResultsModel> _principalResults=[];

 late bool _loadingBestSheller = true;
 late List<SearchResultsModel> _bestSheller=[];

 late bool _loadingEditorChoice = true;
 late List<SearchResultsModel> _editorChoice=[];

  HomeProvider(this._searchService);

  bool get loadingPrincipalResults => _loadingPrincipalResults;
  List<SearchResultsModel> get principalResults => _principalResults;

  bool get loadingBestSheller => _loadingBestSheller;
  List<SearchResultsModel> get bestSheller => _bestSheller;

  bool get loadingEditorChoice => _loadingEditorChoice;
  List<SearchResultsModel> get editorChoice => _editorChoice;


  void fetchDataPrincipalResults()async {
    _loadingPrincipalResults = true;
    var searchModel = await _searchService.searchGeneral(ConfigUtils.getRandomLetter(), sort: FilterSorts.random);
    _principalResults=searchModel.docs??[];
    _loadingPrincipalResults=false;
    notifyListeners();
  }

 void fetchDataBestSheller()async {
   _loadingBestSheller = true;
   var searchModel = await _searchService.searchGeneral("Best Seller", sort: FilterSorts.random);
   _bestSheller=searchModel.docs??[];
   _loadingBestSheller=false;
   notifyListeners();
 }

 void fetchDataEditorChoice()async {
   _loadingEditorChoice = true;
   var searchModel = await _searchService.searchGeneral("Editor's Choice", sort: FilterSorts.random);
   _editorChoice=searchModel.docs??[];
   _loadingEditorChoice=false;
   notifyListeners();
 }


}