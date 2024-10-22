part of '../home.dart';

class TextWidget extends StatelessWidget {
  final TextEntity textEntity;
  const TextWidget({super.key, required this.textEntity});

  @override
  Widget build(BuildContext context) {
    final DateTime dateCreate =
        DateTime.parse(textEntity.createdAt ?? StringConsts.emptyString);
    return GestureDetector(
      onTap: () => context.router.push(
        TextRoute(textEntity: textEntity),
      ),
      child: ListTile(
          isThreeLine: true,
          trailing: IconButton(
            onPressed: () => context.homeBloc.add(
              HomeEvent.showQRCode(
                textEntity: textEntity,
              ),
            ),
            icon: const Icon(
              Icons.qr_code_rounded,
            ),
          ),
          title: Text("# ${textEntity.textTitle}"),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${dateCreate.day}-${dateCreate.month}-${dateCreate.year}",
                style: context.textTheme.labelMedium,
              ),
              Text(
                style: context.textTheme.bodySmall,
                "${(textEntity.text ?? StringConsts.emptyString).length < 25 ? textEntity.text : '${textEntity.text?.substring(0, 30)}...'}",
              ),
            ],
          )),
    );
  }
}
