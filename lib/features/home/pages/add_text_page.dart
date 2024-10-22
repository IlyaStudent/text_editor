part of '../home.dart';

@RoutePage()
class AddTextPage extends StatefulWidget implements AutoRouteWrapper {
  const AddTextPage({super.key});

  @override
  State<AddTextPage> createState() => _AddTextPageState();

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

class _AddTextPageState extends State<AddTextPage> {
  final titleController = TextEditingController();
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeBloc>().state;
    state.when(
      loaded: (List<TextEntity> texts, _, __) => context.router.pushAll(
        [const NavBarRoute()],
      ),
      loading: () => null,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.localization.addText,
        ),
        actions: [
          IconButton(
            onPressed: () => context.homeBloc.add(
              HomeEvent.addText(
                textDTO: TextDTO(
                  textTitle: titleController.text,
                  text: textController.text,
                  userId: supabase.auth.currentUser?.id,
                  createdAt: DateTime.now().toIso8601String(),
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
              CustomTextField(
                controller: titleController,
                hintText: context.localization.enterATitle,
                labelText: context.localization.title,
              ),
              TextField(
                controller: textController,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: context.localization.enterAText,
                  labelText: context.localization.text,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
