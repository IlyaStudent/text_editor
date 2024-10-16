part of '../../authorization.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc() : super(const _CheckingData()) {
    on<_AuthorizeEvent>(_onAuthorizeEvent);
    on<_ChangeDataEvent>(_onChangeDataEvent);
  }

  Future<void> _onAuthorizeEvent(
    _AuthorizeEvent event,
    Emitter<AuthorizationState> emit,
  ) async {
    final currentState = state;
    if (currentState is! _CheckingData) return;

    try {
      emit(
        const AuthorizationState.loading(),
      );
      await supabase.auth.signInWithPassword(
        password:
            currentState.authorizationDTO.password ?? StringConsts.emptyString,
        email: currentState.authorizationDTO.email,
      );
      emit(
        const AuthorizationState.authorized(),
      );
    } catch (e) {
      emit(
        AuthorizationState.checkingData(
          authorizationErrorDTO: currentState.authorizationErrorDTO.copyWith(
            isValid: false,
            signInError: true,
          ),
          authorizationDTO: currentState.authorizationDTO,
        ),
      );
    }
  }

  Future<void> _onChangeDataEvent(
    _ChangeDataEvent event,
    Emitter<AuthorizationState> emit,
  ) async {
    final currentState = state;
    if (currentState is! _CheckingData) return;

    AuthorizationValidator authorizationValidator = AuthorizationValidator(
        changedFieldName: event.changedFieldName,
        changedFieldText: event.changedFieldText,
        authorizationDTO: currentState.authorizationDTO,
        authorizationErrorDTO: currentState.authorizationErrorDTO)
      ..changeData()
      ..validateFields();
    emit(
      AuthorizationState.checkingData(
        authorizationDTO: authorizationValidator.authorizationDTO,
        authorizationErrorDTO: authorizationValidator.authorizationErrorDTO,
      ),
    );
  }
}

extension AuthorizationBlocExtension on BuildContext {
  AuthorizationBloc get authorizationBloc => read();
}
