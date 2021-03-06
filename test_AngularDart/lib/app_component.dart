import 'package:angular/angular.dart';
import 'package:test_AngularDart/src/list/list_component.dart';
import 'src/hello_world/hello_world_component.dart';


// AngularDart info: https://angulardart.dev
// Components info: https://angulardart.dev/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  //directives: [TodoListComponent],
  directives: [HelloWorldComponent, ListComponent],
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}
