import 'package:firebase_auth/firebase_auth.dart';

String handleFirestoreException(FirebaseException error) {
  switch (error.code) {
    case "ABORTED":
      return "The operation was aborted, typically due to a concurrency issue like transaction aborts, etc.";
    case "ALREADY_EXISTS":
      return "Some document that we attempted to create already exists.";
    case "CANCELLED":
      return "The operation was cancelled (typically by the caller).";
    case "DATA_LOSS":
      return "Unrecoverable data loss or corruption.";
    case "DEADLINE_EXCEEDED":
      return "Deadline expired before operation could complete.";
    case "FAILED_PRECONDITION":
      return "Operation was rejected because the system is not in a state required for the operation's execution.";
    case "INTERNAL":
      return "Internal errors.";
    case "INVALID_ARGUMENT":
      return "Client specified an invalid argument.";
    case "NOT_FOUND":
      return "Some requested document was not found.";
    case "OK":
      return "The operation completed successfully.";
    case "OUT_OF_RANGE":
      return "Operation was attempted past the valid range.";
    case "PERMISSION_DENIED":
      return "The caller does not have permission to execute the specified operation.";
    case "RESOURCE_EXHAUSTED":
      return "Some resource has been exhausted, perhaps a per-user quota, or perhaps the entire file system is out of space.";
    case "UNAUTHENTICATED":
      return "The request does not have valid authentication credentials for the operation.";
    case "UNAVAILABLE":
      return "The service is currently unavailable.";
    case "UNIMPLEMENTED":
      return "Operation is not implemented or not supported/enabled.";
    case "UNKNOWN":
      return "Unknown error or an error from a different error domain.";
    default:
      return "An undefined Error happened.";
  }
}
