import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test_for_vs/services/cloud/cloud_constants.dart';
import 'package:flutter_test_for_vs/services/cloud/cloud_exceptions.dart';
import 'package:flutter_test_for_vs/services/cloud/cloud_note.dart';
import 'package:flutter_test_for_vs/services/crud/notes_services.dart';


class CloudStorage{
   final Food = FirebaseFirestore.instance.collection('FoodData');



   Future<>
}