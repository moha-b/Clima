part of 'widgets.dart';

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
      height: 110.h,
      margin: 16.allInsets,
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.h),
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
                margin: 4.horizontalInsets,
                width: 8.w,
                height: 8.h,
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
