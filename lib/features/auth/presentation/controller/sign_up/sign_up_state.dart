part of 'sign_up_cubit.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}
class SignUpSuccess extends SignUpState {}
class SignUpFailed extends SignUpState {
  final String errorMessage;
  SignUpFailed({required this.errorMessage});
}
class SelectGenderState extends SignUpState {
  final int currentIndex;
  SelectGenderState(this.currentIndex);
}

class UpdateIndexState extends SignUpState {}
