part of 'widgets.dart';

class StateWidget extends StatelessWidget {
  const StateWidget({
    super.key,
    this.lottie,
    this.text,
  });
  final String? lottie;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PlayLottie(lottie: lottie ?? AppLottie.failure, repeat: true),
          Text(text ?? "Error"),
        ],
      ),
    );
  }
}
