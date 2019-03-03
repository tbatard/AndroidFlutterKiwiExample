// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_injector.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$ApplicationInjector extends ApplicationInjector {
  void configure() {
    final Container container = Container();
    container.registerFactory(
        (c) =>
            ExampleService(internalFileRepository: c<InternalFileRepository>()),
        name: 'exampleService');
    container.registerFactory(
        (c) => InternalFileRepository(fileName: c<String>('fileName')));
  }
}
