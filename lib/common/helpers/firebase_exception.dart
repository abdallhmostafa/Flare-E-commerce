import 'package:firebase_core/firebase_core.dart';

String checkFirebaseException(FirebaseException error) {
  String errorMessage;
  if (error.code == 'permission-denied') {
    errorMessage = 'Permission denied';
  } else if (error.code == 'unavailable') {
    errorMessage = 'Service unavailable';
  } else if (error.code == 'aborted') {
    errorMessage = 'Aborted';
  } else if (error.code == 'cancelled') {
    errorMessage = 'Cancelled';
  } else if (error.code == 'data-loss') {
    errorMessage = 'Data loss';
  } else if (error.code == 'deadline-exceeded') {
    errorMessage = 'Deadline exceeded';
  } else if (error.code == 'internal') {
    errorMessage = 'Internal error';
  } else if (error.code == 'invalid-argument') {
    errorMessage = 'Invalid argument';
  } else if (error.code == 'not-found') {
    errorMessage = 'Not found';
  } else if (error.code == 'out-of-range') {
    errorMessage = 'Out of range';
  } else if (error.code == 'resource-exhausted') {
    errorMessage = 'Resource exhausted';
  } else if (error.code == 'unauthenticated') {
    errorMessage = 'Unauthenticated';
  } else if (error.code == 'unknown') {
    errorMessage = 'Unknown error';
  } else {
    errorMessage = 'Something went wrong 😔';
  }
  return errorMessage;
}
