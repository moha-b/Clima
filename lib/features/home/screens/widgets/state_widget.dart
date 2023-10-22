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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(lottie ?? AppImages.failure, fit: BoxFit.cover),
            Text(text ?? "Error"),
          ],
        ),
      ),
    );
  }
}
