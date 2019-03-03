import 'package:android_flutter_example/repository/internal_file_repository.dart';

class ExampleService {
  final InternalFileRepository internalFileRepository;

  ExampleService({this.internalFileRepository});

  String getHello() {
    return "Hello Home!";
  }

  Future<String> getSavedText() async => await internalFileRepository.read();

  Future<void> saveText() async => internalFileRepository.save("Hello Storage");
}