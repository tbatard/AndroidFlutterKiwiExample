import 'package:android_flutter_example/repository/internal_file_repository.dart';
import 'package:android_flutter_example/service/example_service_impl.dart';
import 'package:mockito/mockito.dart';

class MockExampleService extends Mock implements ExampleService {}
class MockInternalFileRepository extends Mock implements InternalFileRepository {}

class Mocks {
  static final exampleService = MockExampleService();
  static final internalFileRepository = MockInternalFileRepository();
}