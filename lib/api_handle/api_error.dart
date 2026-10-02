class ApiError {
  final String message;
  final int? code;
  ApiError({required this.message, this.code});

  String getErrorMessage() {
   return 'the error is $message and the code is $code';
  }
}
