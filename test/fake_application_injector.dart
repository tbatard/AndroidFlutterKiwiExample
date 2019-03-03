import 'package:android_flutter_example/service/example_service_impl.dart';
import 'package:kiwi/kiwi.dart';

import 'mock_definition.dart';

void setupTest() {
  final Container container = Container();
  container.registerInstance(Mocks.exampleService as ExampleService, name: "exampleService"); // ignore: unnecessary_cast
}
