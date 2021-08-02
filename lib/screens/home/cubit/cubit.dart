import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_amr/const/const.dart';
import 'package:weather_app_amr/network/remote/dio_helper.dart';
import 'package:weather_app_amr/screens/home/cubit/states.dart';
import 'package:weather_app_amr/screens/home/model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  WeatherModel weatherModel;
  void getWeatherWithCityName({@required String cityName}) async {
    emit(GetWeatherLoadingState());
    DioHelper.getData(queryParameters: {
      "q":cityName,
      "appid":appAccessToken,
    }).then((value) {
      print(value.data.toString());
      if (value.statusCode == 200) {
         weatherModel = WeatherModel.fromJson(value.data);
        emit(GetWeatherSuccessState());
      } else {
        print( "server status code is :" + value.statusCode.toString());
      }
    }).catchError((onError) {
      print(onError.toString());
      emit(GetWeatherFailedState(onError.toString()));
    });
  }
  WeatherModel weatherModel2;
  void getWeatherWithCLangLat({@required String lat,@required String long}) async {
    emit(GetWeatherLoadingState());
    DioHelper.getData(queryParameters: {
      "lat":lat,
      "lon":long,
      "appid":appAccessToken,
    }).then((value) {
      print(value.data.toString());
      if (value.statusCode == 200) {
        weatherModel2 = WeatherModel.fromJson(value.data);
        emit(GetWeatherSuccessState());
      } else {
        print( "server status code is :" + value.statusCode.toString());
      }
    }).catchError((onError) {
      print(onError.toString());
      emit(GetWeatherFailedState(onError.toString()));
    });
  }

}
