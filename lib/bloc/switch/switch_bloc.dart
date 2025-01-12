import 'package:bloc/bloc.dart';
import 'package:bloc_clean_code/bloc/switch/switch_event.dart';
import 'package:bloc_clean_code/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchStates> {
  SwitchBloc() : super(const SwitchStates()) {
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderEvent>(_sliderFunction);
  }
  void _enableOrDisableNotification(
    EnableOrDisableNotification event,
    Emitter<SwitchStates> emit,
  ) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _sliderFunction(
    SliderEvent event,
    Emitter<SwitchStates> emit,
  ) {
    emit(state.copyWith(slider: event.slider));
  }
}
