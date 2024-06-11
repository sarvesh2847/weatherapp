import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/bloc/weather_bloc_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  Widget getWeatherIcon(int code){
    switch(code){
      case >200 && <=300:
        return Image.asset(
          'assets/1.png'
        );
      case >300 && <=400:
        return Image.asset(
            'assets/2.png'
        );
      case >400 && <=500:
        return Image.asset(
            'assets/3.png'
        );
      case >500 && <=600:
        return Image.asset(
            'assets/4.png'
        );
      case >600 && <=700:
        return Image.asset(
            'assets/5.png'
        );
      case >700 && <=800:
        return Image.asset(
            'assets/6.png'
        );
      case == 800:
        return Image.asset(
            'assets/7.png'
        );
      case >800 && <=804:
        return Image.asset(
            'assets/8.png'
        );
        break;
      default:
        return Image.asset('assets/7.png');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(4, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.purple),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-4, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.purple),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 180, 83)),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                builder: (context, state) {
                  if (state is WeatherBlocSuccess) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' 📍 ${state.weather.areaName}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Good Morning',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child:getWeatherIcon(state.weather.weatherConditionCode!)
                          ),
                           Center(
                            child: Text('${state.weather.temperature!.celsius!.round()}°C',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 55,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Center(
                            child: Text('${state.weather.weatherMain!.toUpperCase()}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500)),
                          ),
                           Center(
                            child: Text(
                                DateFormat('EEEE dd •').add_jm().format(state.weather.date!),

                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300)),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/6.png',
                                    scale: 6,
                                  ),
                                  const SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Sunrise',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300)),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                          DateFormat().add_jm().format(state.weather.sunrise!),

                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700))
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/10.png',
                                    scale: 6,
                                  ),
                                  const SizedBox(width: 5),
                                   Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Sunset',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300)),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(DateFormat().add_jm().format(state.weather.sunset!),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700))
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/11.png',
                                    scale: 6,
                                  ),
                                  const SizedBox(width: 5),
                                   Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Temp Max',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300)),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text('${state.weather.tempMax!.celsius!.round()}°C',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700))
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/12.png',
                                    scale: 6,
                                  ),
                                  const SizedBox(width: 5),
                                   Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Temp Min',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300)),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text('${state.weather.tempMin!.celsius!.round()}°C',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700))
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
