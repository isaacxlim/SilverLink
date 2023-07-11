// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future deleteRequest(
  String requestID,
  DocumentReference documentRef,
  String collectionName,
) async {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Get reference to Firestore
  final collectionRef = FirebaseFirestore.instance.collection(collectionName);

  //Check if document exists
  final docRef = collectionRef.doc(requestID);
  final docSnapshot = await docRef.get();

  // Delete Request
  if (docSnapshot.exists) {
    await docRef.delete();
  }

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
