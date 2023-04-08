

import 'package:delivery_app/src/features/data/repositories/auth/UpdatePasswordRepository/UpdatePasswordRepository.dart';
import 'package:delivery_app/src/features/domain/interfaces/Interfaces.dart';

abstract class UpdatePasswordUseCase {

  Future<void> execute({ required String email });

}

class DefaultUpdatePasswordUseCase extends UpdatePasswordUseCase {

  //Dependencias
  
  UpdatePasswordRepository _updatePasswordRepository;

  DefaultUpdatePasswordUseCase({ UpdatePasswordRepository? updatePasswordRepository })
    : _updatePasswordRepository = updatePasswordRepository ?? DefaultUpdatePasswordRepository();

  @override
  Future<void> execute({required String email}) {
    
    return _updatePasswordRepository.updatePassword(email: email);
  }
}