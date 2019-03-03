import 'package:kiwi/kiwi.dart';

import 'package:android_flutter_example/service/example_service_impl.dart';
import 'package:android_flutter_example/repository/internal_file_repository.dart';

part 'application_injector.g.dart';

abstract class ApplicationInjector {
  @Register.factory(ExampleService, name: "exampleService")
  @Register.factory(InternalFileRepository, resolvers: {String: 'fileName'})
  void configure();
}

void setup() {
  var injector = _$ApplicationInjector();
  injector.configure();

  final Container container = Container();
  container.registerInstance("hello.txt", name: "fileName");
}
