import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_amr/network/remote/dio_helper.dart';
import 'package:weather_app_amr/screens/home/cubit/cubit.dart';
import 'package:weather_app_amr/screens/home/cubit/states.dart';
import 'package:weather_app_amr/screens/home/view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

  runApp(BlocProvider(
    create: (context) => HomeCubit()..getWeatherWithCityName(cityName: "cairo")..getWeatherWithCLangLat(lat: "31.0876", long: "31.595"),
    child: BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return MyApp();
      },
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
