import 'package:angular/angular.dart';
import 'package:test_AngularDart/src/list/list_service.dart';

@Component(
    selector: 'list',
    styleUrls: ['list_component.css'],
    templateUrl: 'list_component.html',
    directives: [NgFor],
    providers: [ClassProvider(ListService)])
class ListComponent implements OnInit {
  //inject dependences
  final ListService listService;
  ListComponent(this.listService);

  List languages = [];

  @override
  void ngOnInit() {
    languages = listService.getLanguages();
  }
}
