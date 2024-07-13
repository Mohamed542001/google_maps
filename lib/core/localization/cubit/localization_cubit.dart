import '../../../core/src/app_export.dart';

part 'localization_state.dart';

class LocalizationBloc extends Cubit<LocalizationState> {
  LocalizationBloc() : super(LocalizationInit());

  static LocalizationBloc get(context) =>
      BlocProvider.of<LocalizationBloc>(context);

  void changeLanguageToArabic() {
    emit(
      LocalizationChange(
        AppLocalization.supportedLocales.first,
      ),
    );
  }

  void changeLanguageToEnglish() {
    emit(
      LocalizationChange(
        AppLocalization.supportedLocales.last,
      ),
    );
  }
}
