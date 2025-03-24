import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {}

class RegisterInitialState extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterLoadingState extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterSuccessState extends RegisterState {
  final String message;

  RegisterSuccessState({required this.message});

  @override
  List<Object?> get props => [message];
}

class RegisterFailingState extends RegisterState {
  final String errMessage;

  RegisterFailingState({required this.errMessage});

  @override
  List<Object?> get props => [errMessage];
}

class RegisterNotValidateState extends RegisterState {
  @override
  List<Object?> get props => [];
}

// class RegisterPickImage extends RegisterState {
//   @override
//   List<Object?> get props => [];
// }
