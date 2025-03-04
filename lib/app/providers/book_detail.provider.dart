import 'package:flutter/material.dart';
import 'package:open_library/app/utils/config.utils.dart';
import 'package:open_library/data/models/entities/book/book.model.dart';
import 'package:open_library/data/models/entities/book/rating.model.dart';
import 'package:open_library/data/services/book/book.contract.dart';

class BookDetailProvider extends ChangeNotifier {
  final IBookService _bookService;
  late bool _isLoading = true;
  late BookModel _bookModel= BookModel();
  late RatingModel _ratingModel= RatingModel();
  late String _coverI="";
  late String _coverEditionKey="";
  late String _author="";

  BookModel get bookModel => _bookModel;
  RatingModel get ratingModel => _ratingModel;
  bool get isLoading => _isLoading;
  String get coverI => ConfigUtils.convertURKBookImage(_coverI);
  String get author => _author;

  BookDetailProvider(this._bookService){


  }

  void fetchData(BuildContext context) async {
    _isLoading=true;
    notifyListeners();
    String? arguments = ModalRoute.of(context)?.settings.arguments.toString();
    print(arguments);
    if(arguments != null){
      _coverEditionKey = arguments.split(",").first;
      _coverI = arguments.split(",")[1];
      _author = arguments.split(",").last;
      _bookModel = await _bookService.detail(_coverEditionKey);
      _ratingModel = await _bookService.rating(_coverEditionKey);
    }
    _isLoading=false;
    notifyListeners();
  }

}