part of 'common.dart';

class TemperatureText extends StatelessWidget {
  const TemperatureText({
    super.key,
    required this.temperature,
    this.style,
  });

  final String? temperature;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: GradientText(
        "${temperature!}°",
        style: style ?? AppTypography.bold144(),
        gradient: context.read<HomeCubit>().isDay
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 1.0],
                colors: [
                  AppColors.primary,
                  AppColors.white,
                ],
              )
            : const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.3, 1],
                colors: [
                  AppColors.white,
                  AppColors.primary,
                ],
              ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
