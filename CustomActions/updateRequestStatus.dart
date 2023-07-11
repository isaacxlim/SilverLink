// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future updateRequestStatus(
  String requestID,
  String requestStatus,
  double consultationPrice,
  int consultationPriceInCents,
  String customerAddress,
  String customerName,
  String customerPhoneNumber,
  String nurseName,
  String nursePhoneNumber,
  DateTime requestDate,
  String uidCustomer,
  String uidNurse,
  DocumentReference documentRef,
  String collectionName,
) async {
  /// MODIFY CODE ONLY BELOW THIS LINE
  // Updated request
  final doc = {
    'consultationPrice': consultationPrice,
    'consultationPriceInCents': consultationPriceInCents,
    'customerName': customerName,
    'customerAddress': customerAddress,
    'customerPhoneNumber': customerPhoneNumber,
    'nurseName': nurseName,
    'nursePhoneNumber': nursePhoneNumber,
    'requestDate': requestDate,
    'requestStatus': requestStatus,
    'uidCustomer': uidCustomer,
    'uidNurse': uidNurse,
  };

  // Get reference to Firestore
  final collectionRef = FirebaseFirestore.instance.collection(collectionName);

  // Update request
  await collectionRef.doc(requestID).update(doc);

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
