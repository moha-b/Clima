part of 'widgets.dart';

class News extends StatelessWidget {
  const News({
    super.key,
    required this.title,
    required this.content,
  });
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: AppTypography.medium18()),
        Text(
          content,
          style: AppTypography.medium14(),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
