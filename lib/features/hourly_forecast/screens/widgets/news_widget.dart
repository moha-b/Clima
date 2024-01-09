import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({super.key});

  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height! * 0.13,
      margin: EdgeInsets.only(
        left: AppDimensions.width! * 0.03,
        right: AppDimensions.width! * 0.03,
        top: AppDimensions.height! * 0.02,
      ),
      padding: const EdgeInsets.all(8),
      decoration: AppDecoration.container(context),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemBuilder: (context, index) => SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Rise and shine", style: AppTypography.medium18()),
                    Text(
                      "Sunrise will be at 06:51",
                      style: AppTypography.medium14(),
                    ),
                  ],
                ),
              ),
              itemCount: 3,
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
              3,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? Theme.of(context).cardColor
                      : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
