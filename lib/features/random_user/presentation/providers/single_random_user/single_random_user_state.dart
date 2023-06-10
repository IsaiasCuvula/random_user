import 'package:equatable/equatable.dart';
import 'package:random_user/features/random_user/random_user.dart';

class SingleRandomUserState extends Equatable {
  final RandomUser? user;
  final bool isLoading;
  final String? errorMessage;

  const SingleRandomUserState({
    this.user,
    this.errorMessage,
    required this.isLoading,
  });

  SingleRandomUserState copyWith({
    RandomUser? user,
    bool? isLoading,
    String? errorMessage,
  }) {
    return SingleRandomUserState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [user, isLoading, errorMessage];
}
