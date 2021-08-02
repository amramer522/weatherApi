// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:weather_app_amr/const/const.dart';
// import 'package:weather_app_amr/network/remote/dio_helper.dart';
// import 'package:weather_app_amr/screens/home/model.dart';
//
// getWeatherByName({@required cityName}) {
//   DioHelper.getData(queryParameters: {"q": cityName, "appid": appAccessToken})
//       .then((value) {
//     WeatherModel weatherModel = WeatherModel.fromJson(value.data);
//     // _weatherState = weatherModel.weather[0].main;
//     print(weatherModel.weather[0].main);
//   });
// }