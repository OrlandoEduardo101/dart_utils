import 'package:angular/core.dart';

@Injectable()
class ListService {
  List getLanguages() {
    return ['Dart', 'JavaScript', 'Java', 'Go'];
  }
}
