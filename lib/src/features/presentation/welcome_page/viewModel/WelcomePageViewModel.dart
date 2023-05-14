

import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/base/views/BaseView.dart';
import 'package:delivery_app/src/features/domain/Entities/User/UserEntity.dart';
import 'package:delivery_app/src/features/domain/useCases/Auth/GoogleSignInUseCase/GoogleSignInUseCase.dart';
import 'package:delivery_app/src/features/presentation/state_providers/LoadingStateProvider.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';

abstract class WelcomePageViewModelInput {
  Future<Result<UserEntity, Failure>> signInWithGoogle();
}

abstract class WelcomePageViewModel extends WelcomePageViewModelInput with BaseViewModel {}

class DefaultWelcomePageViewModel extends WelcomePageViewModel {

  //Dependencias
  final GoogleSignInUseCase _googleSignInUseCase;

  DefaultWelcomePageViewModel({ GoogleSignInUseCase? googleSignInUseCase })
    : _googleSignInUseCase = googleSignInUseCase ?? DefaultGoogleSignInUseCase() ;

  @override
  void initState({required LoadingStateProvider loadingStateProvider}) {
    loadingState = loadingStateProvider;
  }

  @override
  Future<Result<UserEntity, Failure>> signInWithGoogle() {
    return _googleSignInUseCase.execute();

  }

}