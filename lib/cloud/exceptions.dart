import 'package:flutter/cupertino.dart';

@immutable
class CloudStorageException implements Exception {
  const CloudStorageException();
}

class CouldNotAddNewFood implements Exception {}

class CouldNotGetAllInstitutionFood implements Exception {}

class CouldNotUpdateFood implements Exception {}

class CouldNotDeleteFood implements Exception {}
