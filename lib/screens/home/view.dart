import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_amr/screens/home/cubit/cubit.dart';
import 'package:weather_app_amr/screens/home/cubit/states.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("Weather App"),
          ),
          body: cubit.weatherModel!=null&&cubit.weatherModel2!=null?SingleChildScrollView(
            child: Column(
              children: [
                // Text("hello"),
                Row(
                  children: [
                    Text("by site name "+cubit.weatherModel.name+" : "),
                    Text(cubit.weatherModel.weather[0].main),
                  ],
                ),
                Row(
                  children: [
                    Text("by site name " + cubit.weatherModel2.name+" : "),
                    Text(cubit.weatherModel2.weather[0].main),
                  ],
                ),
              ],
            ),
          ):Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
