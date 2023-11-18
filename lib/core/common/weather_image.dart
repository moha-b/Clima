part of '../../features/home/screens/widgets/widgets.dart';

class WeatherImage extends StatefulWidget {
  final String? image;

  const WeatherImage({
    Key? key,
    required this.image,
  }) : super(key: key);

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

    var tween = Tween<double>(begin: -20.0, end: 20.0);

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
      child: Center(
        child: Transform.translate(
          offset: Offset(0, _animation.value),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: GlobalVariablesState.isNight
                  ? const RadialGradient(
                      colors: [
                        Color(0xFFE2E0EF),
                        Colors.transparent,
                      ],
                      stops: [0.1, 1.0],
                      radius: 0.5,
                    )
                  : RadialGradient(
                      colors: [
                        const Color(0xFFEFC5B4),
                        const Color(0xFFF2E477).withOpacity(0.001),
                      ],
                      stops: const [0.1, 1.0],
                      radius: 0.5,
                    ),
            ),
            child: Image.asset(
              widget.image!,
              fit: BoxFit.cover,
            ),
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
