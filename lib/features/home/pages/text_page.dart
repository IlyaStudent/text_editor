part of '../home.dart';

@RoutePage()
class TextPage extends StatefulWidget implements AutoRouteWrapper {
  final TextEntity textEntity;
  const TextPage({
    super.key,
    required this.textEntity,
  });

  @override
  State<TextPage> createState() => _TextPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        textsRepository: instance(),
        settingsRepository: instance(),
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
        widget.textEntity.textTitle ?? StringConsts.emptyString;
    textController.text = widget.textEntity.text ?? StringConsts.emptyString;
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
          "# ${widget.textEntity.id} ${widget.textEntity.textTitle}",
        ),
        actions: [
          if (Platform.isWindows)
            IconButton(
              onPressed: () => context.homeBloc.add(
                HomeEvent.changeText(
                  textDTO: TextDTO(
                    id: widget.textEntity.id,
                    textTitle: titleController.text,
                    text: textController.text,
                    userId: supabase.auth.currentUser?.id,
                    createdAt: widget.textEntity.createdAt,
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
                      widget.textEntity.textTitle ?? StringConsts.emptyString,
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
                      widget.textEntity.text ?? StringConsts.emptyString,
                      style: context.textTheme.bodyMedium,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
