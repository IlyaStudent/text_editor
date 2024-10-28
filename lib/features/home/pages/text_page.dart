part of '../home.dart';

@RoutePage()
class TextPage extends StatefulWidget implements AutoRouteWrapper {
  final UnencryptedTextEntity unencryptedTextEntity;
  const TextPage({
    super.key,
    required this.unencryptedTextEntity,
  });

  @override
  State<TextPage> createState() => _TextPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        textsRepository: instance(),
        settingsRepository: instance(),
        encryptor: instance(),
      ),
      child: this,
    );
  }
}

class _TextPageState extends State<TextPage> {
  final titleController = TextEditingController();
  final textController = TextEditingController();

  @override
  void initState() {
    titleController.text =
        widget.unencryptedTextEntity.textTitle ?? StringConsts.emptyString;
    textController.text =
        widget.unencryptedTextEntity.text ?? StringConsts.emptyString;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeBloc>().state;
    state.when(
      loaded: (_, __, ___) => context.router.pushAll(
        [const NavBarRoute()],
      ),
      loading: () => null,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "# ${widget.unencryptedTextEntity.id} ${widget.unencryptedTextEntity.textTitle}",
        ),
        actions: [
          if (Platform.isWindows)
            IconButton(
              onPressed: () => context.homeBloc.add(
                HomeEvent.changeText(
                  unencryptedTextDTO: UnencryptedTextDTO(
                    id: widget.unencryptedTextEntity.id,
                    textTitle: titleController.text,
                    text: textController.text,
                    userId: supabase.auth.currentUser?.id,
                    createdAt: widget.unencryptedTextEntity.createdAt,
                  ),
                ),
              ),
              icon: const Icon(Icons.check_rounded),
            )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Platform.isWindows
                  ? CustomTextField(
                      controller: titleController,
                      hintText: context.localization.enterATitle,
                      labelText: context.localization.title,
                    )
                  : Text(
                      widget.unencryptedTextEntity.textTitle ??
                          StringConsts.emptyString,
                      style: context.textTheme.titleMedium,
                    ),
              Platform.isWindows
                  ? TextField(
                      controller: textController,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: context.localization.enterAText,
                        labelText: context.localization.text,
                      ),
                    )
                  : Text(
                      widget.unencryptedTextEntity.text ??
                          StringConsts.emptyString,
                      style: context.textTheme.bodyMedium,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
