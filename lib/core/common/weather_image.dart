part of 'common.dart';

class WeatherImage extends StatefulWidget {
  final String? image;
  double? begin;
  double? end;

  final bool isCenter;
  WeatherImage({
    super.key,
    required this.image,
    this.begin,
    this.end,
    this.isCenter = true,
  });

  @override
  _WeatherImageState createState() => _WeatherImageState();
}

class _WeatherImageState extends State<WeatherImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    var tween =
        Tween<double>(begin: widget.begin ?? -5.0, end: widget.end ?? 40.0);

    _animation = tween.animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _animation.addListener(() {
      setState(() {});
    });

    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: widget.isCenter
          ? Center(
              child: Transform.translate(
                offset: Offset(0, _animation.value),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: context.read<HomeCubit>().isDay
                        ? RadialGradient(
                            colors: [
                              const Color(0xFFEFC5B4),
                              const Color(0xFFF2E477).withOpacity(0.001),
                            ],
                            stops: const [0.1, 1.0],
                            radius: 0.5,
                          )
                        : const RadialGradient(
                            colors: [
                              Color(0xFFE2E0EF),
                              Colors.transparent,
                            ],
                            stops: [0.1, 1.0],
                            radius: 0.5,
                          ),
                  ),
                  child: Image.asset(
                    widget.image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          : Transform.translate(
              offset: Offset(0, _animation.value),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: context.read<HomeCubit>().isDay
                      ? RadialGradient(
                          colors: [
                            const Color(0xFFEFC5B4),
                            const Color(0xFFF2E477).withOpacity(0.001),
                          ],
                          stops: const [0.1, 1.0],
                          radius: 0.5,
                        )
                      : const RadialGradient(
                          colors: [
                            Color(0xFFE2E0EF),
                            Colors.transparent,
                          ],
                          stops: [0.1, 1.0],
                          radius: 0.5,
                        ),
                ),
                child: Image.asset(
                  widget.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
