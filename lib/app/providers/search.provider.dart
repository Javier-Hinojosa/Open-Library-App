import 'package:flutter/material.dart';
import 'package:open_library/core/values/keys.dart';
import 'package:open_library/data/models/entities/search/search.model.dart';
import 'package:open_library/data/services/search/search.contract.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SearchProvider extends ChangeNotifier {

  final ISearchService _searchService;

  late bool _isEmpty = true;
  late final FormGroup _filtersForm;
  late bool _hasFilter = false;
  final TextEditingController _searchController = TextEditingController();
  late bool _loadingSearch = false;
  late List<SearchResultsModel> _searchResults=[];
  late bool _isActive = false;

  SearchProvider(this._searchService){
    _initForm();
  }

  bool get isEmpty => _isEmpty;
  bool get hasFilter => _hasFilter;
  FormGroup get filtersForm => _filtersForm;
  TextEditingController get searchController => _searchController;
  bool get loadingSearch => _loadingSearch;
  List<SearchResultsModel> get searchResults => _searchResults;
  bool get isActive => _isActive;



  void toggleSearch(String query) {
    if(_searchController.text!=""){
      _isEmpty = false;
    }else{
      _isEmpty = true;
      if(!_hasFilter){
        _isActive=false;
      }
    }
    notifyListeners();
  }
  void clearSearch() {
    _searchController.clear();
    toggleSearch("");
  }
  void clearFilters() {
    _filtersForm.reset();
    if(!_isEmpty){
      _isActive=false;
    }
    notifyListeners();
  }
  void _initForm(){
    _filtersForm=FormGroup({
      Keys.author: FormControl<String>(),
      Keys.book: FormControl<String>()
    });

    _filtersForm.valueChanges.listen((p0) {
      if( (_filtersForm.control(Keys.author).value!=null && _filtersForm.control(Keys.author).value!="" ) || (_filtersForm.control(Keys.book).value!=null && _filtersForm.control(Keys.book).value!="")){
        _hasFilter=true;
      }else{
        _hasFilter=false;
      }
      notifyListeners();
    });
  }
  void onSearch(String _) async {
    _loadingSearch=true;
    notifyListeners();
    _isActive=true;
      var value = _searchController.text;
      SearchModel searchModel;
      if(_hasFilter){
        searchModel = await _searchService.searchGeneral(value,
            author:_filtersForm.control(Keys.author).value,
            book: _filtersForm.control(Keys.book).value);
      }else{
        searchModel = await _searchService.searchGeneral(value);
      }
     _searchResults = searchModel.docs??[];
      _loadingSearch=false;
      notifyListeners();
}
}