part of '../home.dart';

class TextWidget extends StatelessWidget {
  final UnencryptedTextEntity unencryptedTextEntity;
  const TextWidget({super.key, required this.unencryptedTextEntity});

  @override
  Widget build(BuildContext context) {
    final DateTime dateCreate = DateTime.parse(
        unencryptedTextEntity.createdAt ?? StringConsts.emptyString);
    return GestureDetector(
      onTap: () => context.router.push(
        TextRoute(unencryptedTextEntity: unencryptedTextEntity),
      ),
      child: ListTile(
          isThreeLine: true,
          trailing: IconButton(
            onPressed: () => context.homeBloc.add(
              HomeEvent.showQRCode(
                unencryptedTextEntity: unencryptedTextEntity,
              ),
            ),
            icon: const Icon(
              Icons.qr_code_rounded,
            ),
          ),
          title: Text("# ${unencryptedTextEntity.textTitle}"),
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
                "${(unencryptedTextEntity.text ?? StringConsts.emptyString).length < 25 ? unencryptedTextEntity.text : '${unencryptedTextEntity.text?.substring(0, 30)}...'}",
              ),
            ],
          )),
    );
  }
}
