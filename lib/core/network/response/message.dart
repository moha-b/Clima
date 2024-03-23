part of '../network.dart';

class ResponseMessage {
  static const String SUCCESS = "Operation successful!";
  static const String NO_CONTENT =
      "Operation successful, but no content found.";
  static const String BAD_REQUEST =
      "Invalid request. Please check your input and try again.";
  static const String UNAUTHORIZED =
      "You are not authorized to perform this action. Please log in and try again.";
  static const String FORBIDDEN =
      "Access forbidden. Please contact support for assistance.";
  static const String INTERNAL_SERVER_ERROR =
      "Oops! Something went wrong on our end. Please try again later.";
  static const String NOT_FOUND =
      "Requested resource not found. Please check the URL and try again.";
  static const String CONNECT_TIMEOUT =
      "Request timed out. Please check your internet connection and try again.";
  static const String CANCEL = "Request canceled.";
  static const String RECEIVE_TIMEOUT =
      "Data retrieval timed out. Please try again later.";
  static const String SEND_TIMEOUT =
      "Sending data timed out. Please try again later.";
  static const String CACHE_ERROR =
      "Error while fetching cached data. Please try again later.";
  static const String NO_INTERNET_CONNECTION =
      "No internet connection. Please connect to the internet and try again.";
  static const String DEFAULT =
      "An unexpected error occurred. Please try again.";
}
