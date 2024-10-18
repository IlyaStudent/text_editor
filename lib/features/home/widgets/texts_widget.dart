part of '../home.dart';

class TextsWidget extends StatelessWidget {
  final List<TextEntity> texts;
  const TextsWidget({super.key, required this.texts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: texts.length,
      itemBuilder: (context, index) => TextWidget(
        textEntity: texts[index],
      ),
    );
  }
}
