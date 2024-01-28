import 'dart:async';

import 'package:clima/features/hourly_forecast/data/models/weather_news_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/utils.dart';
import '../../data/models/weather_daily_model.dart';
import 'news.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget(
      {super.key, required this.article, required this.dailyForecast});
  final WeatherNewsModel article;
  final Daily dailyForecast;
  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  final PageController _pageController = PageController();
  late Timer timer;
  DateTime now = DateTime.now();
  int _currentPage = 0;
  List<Widget> list = [];
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 7), (Timer timer) {
      if (_currentPage < list.length - 1) {
        _currentPage += 1;
        _pageController.animateToPage(_currentPage + 1,
            duration: const Duration(milliseconds: 900),
            curve: Curves.easeInOut);
      } else {
        _currentPage = 0;
        _pageController.animateToPage(0,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    list = news();
    return Container(
      height: AppDimensions.height! * 0.13,
      margin: EdgeInsets.only(
        left: AppDimensions.width! * 0.03,
        right: AppDimensions.width! * 0.03,
        top: AppDimensions.height! * 0.02,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: AppDecoration.container(context),
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: list,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              list.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? Theme.of(context).cardColor
                      : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> news() {
    return [
      if (widget.article.title != null)
        InkWell(
          onTap: () async {
            Uri uri = Uri.parse(widget.article.url!);
            if (!await canLaunchUrl(uri)) {
              await launchUrl(uri);
            }
          },
          child: News(title: 'Breaking News', content: widget.article.title!),
        ),
      now.isBefore(DateFormat("h:mm a").parse(widget.dailyForecast.sunrise))
          ? News(
              title: 'Rise and Shine',
              content: "Sunrise will be at ${widget.dailyForecast.sunrise}",
            )
          : News(
              title: 'Don\'t Miss the Sunset',
              content: "Sunset will be at ${widget.dailyForecast.sunset}",
            ),
      if (now.isAfter(DateTime(now.year, now.month, now.day, 19, 0)))
        const News(
          title: 'Tomorrow\'s Temperature',
          content: 'Reflect on your day! Check the weather in the evening.',
        ),
      if (now.isBefore(DateTime(now.year, now.month, now.day, 14, 0)))
        const News(
          title: 'Today\'s Temperature',
          content: 'Plan your day! Check the weather in the morning.',
        ),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    timer.cancel();
    super.dispose();
  }
}
