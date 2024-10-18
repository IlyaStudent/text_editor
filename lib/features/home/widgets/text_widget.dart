part of '../home.dart';

class TextWidget extends StatelessWidget {
  final TextEntity textEntity;
  const TextWidget({super.key, required this.textEntity});

  @override
  Widget build(BuildContext context) {
    final DateTime dateCreate = DateTime.parse(textEntity.createdAt);
    return GestureDetector(
      onTap: () => context.router.push(
        TextRoute(textEntity: textEntity),
      ),
      child: ListTile(
        trailing: Text(
          "${dateCreate.day}-${dateCreate.month}-${dateCreate.year}",
        ),
        title: Text("#${textEntity.id} ${textEntity.textTitle}"),
        subtitle: Text(
            "${(textEntity.text ?? StringConsts.emptyString).length < 25 ? textEntity.text : '${textEntity.text?.substring(0, 30)}...'}"),
      ),
    );
  }
}
