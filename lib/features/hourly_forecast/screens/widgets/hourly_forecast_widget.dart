import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../data/models/hourly_forecast_model.dart';
import 'hourly_forecast_details.dart';

class HourlyForecastWidget extends StatefulWidget {
  const HourlyForecastWidget({Key? key, required this.forecast})
      : super(key: key);
  final List<HourlyForecast> forecast;

  @override
  State<HourlyForecastWidget> createState() => _HourlyForecastWidgetState();
}

class _HourlyForecastWidgetState extends State<HourlyForecastWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: ExpansionPanelList(
          dividerColor: Theme.of(context).focusColor,
          expandedHeaderPadding: const EdgeInsets.all(0),
          expandIconColor: Theme.of(context).primaryColor,
          animationDuration: const Duration(milliseconds: 700),
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              widget.forecast[index].isExpanded = isExpanded;
            });
          },
          children: widget.forecast.map<ExpansionPanel>((HourlyForecast item) {
            return ExpansionPanel(
              backgroundColor: Theme.of(context).focusColor,
              canTapOnHeader: true,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return isExpanded
                    ? ListTile(
                        title: Text("${item.date} Forecast"),
                      )
                    : ListTile(
                        title: Text(item.date),
                        subtitle: Text(item.temperature),
                        leading: Lottie.asset(item.image),
                      );
              },
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: AspectRatio(
                  aspectRatio: 2,
                  child: HourlyForecastDetails(forecast: item),
                ),
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
      ),
    );
  }
}
