import 'package:android_flutter_example/repository/internal_file_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:android_flutter_example/service/example_service_impl.dart';

import '../mock_definition.dart';

void main() {
  group("ExampleService", () {
    ExampleService exampleService;
    InternalFileRepository internalFileRepository = Mocks.internalFileRepository;

    setUp(() {
      exampleService = ExampleService(internalFileRepository: internalFileRepository);
    });

    test('getHello returns Hello Home!', () {
      expect(exampleService.getHello(), "Hello Home!");
    });

    test('saveText saves text and returns it', () {
      var text = "Hello Storage";

      exampleService.saveText();

      verify(internalFileRepository.save(text));
    });

    test('getSavedText returns the text from repository', () async {
      var text = "Example of text to read";

      when(internalFileRepository.read()).thenAnswer((_) => Future.value(text));

      expect(await exampleService.getSavedText(), text);
    });
  });
}
