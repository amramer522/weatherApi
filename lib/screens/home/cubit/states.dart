abstract class HomeStates {}

class HomeInitialState extends HomeStates {}
class GetWeatherLoadingState extends HomeStates {}
class GetWeatherFailedState extends HomeStates {
  final String error;
  GetWeatherFailedState(this.error);
}
class GetWeatherSuccessState extends HomeStates {}
