part of '../../registration.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(const _CheckingData()) {
    on<_RegisterEvent>(_onRegisterEvent);
    on<_ChangeDataEvent>(_onChangeDataEvent);
  }

  Future<void> _onRegisterEvent(
    _RegisterEvent event,
    Emitter<RegistrationState> emit,
  ) async {
    final currentState = state;
    if (currentState is! _CheckingData) return;

    try {
      emit(
        const RegistrationState.loading(),
      );
      await supabase.auth.signUp(
        password: currentState.registrationDTO.plainPassword ??
            StringConsts.emptyString,
        email: currentState.registrationDTO.email ?? StringConsts.emptyString,
      );
      emit(
        const RegistrationState.registered(),
      );
    } on AuthException {
      emit(RegistrationState.checkingData(
        registrationErrorDTO: currentState.registrationErrorDTO.copyWith(
          isValid: false,
          userAlreadyRegisteredError: true,
        ),
        registrationDTO: currentState.registrationDTO,
      ));
    }
  }

  Future<void> _onChangeDataEvent(
    _ChangeDataEvent event,
    Emitter<RegistrationState> emit,
  ) async {
    final currentState = state;
    if (currentState is! _CheckingData) return;

    RegistrationValidator registrationValidator = RegistrationValidator(
        changedFieldName: event.changedFieldName,
        changedFieldText: event.changedFieldText,
        registrationDTO: currentState.registrationDTO,
        registrationErrorDTO: currentState.registrationErrorDTO)
      ..changeData()
      ..validateFields();

    emit(
      RegistrationState.checkingData(
        registrationDTO: registrationValidator.registrationDTO,
        registrationErrorDTO: registrationValidator.registrationErrorDTO,
      ),
    );
  }
}

extension RegistrationBlocBuildContext on BuildContext {
  RegistrationBloc get registrationBloc => read();
}
