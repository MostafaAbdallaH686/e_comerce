part of 'update_profile_cubit.dart';

sealed class UpdateProfileState extends Equatable {
  const UpdateProfileState();

  @override
  List<Object> get props => [];
}

final class UpdateProfileInitial extends UpdateProfileState {}

final class UpdateProfilePickImage extends UpdateProfileState {}

final class UpdateProfileLoading extends UpdateProfileState {}

final class UpdateProfileSuccess extends UpdateProfileState {}

final class UpdateProfileFailing extends UpdateProfileState {
  final String errMessage;

  const UpdateProfileFailing({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

final class UpdateProfileNotValidate extends UpdateProfileState {}
