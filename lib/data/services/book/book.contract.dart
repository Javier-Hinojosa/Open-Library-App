import 'package:open_library/data/models/entities/book/book.model.dart';
import 'package:open_library/data/models/entities/book/rating.model.dart';

abstract class IBookService {
  Future<BookModel> detail(String key);
  Future<RatingModel> rating(String key);
}