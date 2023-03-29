
abstract class FBFailureMessages {

  //Error Messages
  static String emailNotFoundMessage = 
    "There is no user record corresponding to this identifier. The user may have been deleted.";
  static String invalidPasswordMessage = 
    "The password is invalid or the user does not have a password.";
  static String emailExistMessage = 
    "La dirrección de correo electronica ya se encuentra registrado.";
  static String toManyAttemptMessage = 
    "Hemos bloqueado todas las solicitudes de este dispositivo debido a una actividad inusual. Vuelve a intentarlo mas tarde.";
  static String invalidIdTokenMessage = 
    "La credencial del usuario ya no es valida, el usuario debe iniciar sesion nuevamente.";
  static String userNotFoundMessage = 
    "No hay un registro de usuario que corresponda a este identificador. Es posible que se haya eliminado el usuario";  

}