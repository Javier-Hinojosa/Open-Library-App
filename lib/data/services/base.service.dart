import 'package:open_library/core/values/environments.dart';
import 'package:open_library/data/providers/api.provider.dart';

abstract class BaseService {
  final provider = ApiProvider.instance;
  final Environments apiHost = Environments();
}
