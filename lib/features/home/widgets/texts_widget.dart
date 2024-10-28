part of '../home.dart';

class TextsWidget extends StatelessWidget {
  final List<UnencryptedTextEntity> texts;
  const TextsWidget({super.key, required this.texts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: texts.length,
      itemBuilder: (context, index) => TextWidget(
        unencryptedTextEntity: texts[index],
      ),
    );
  }
}
