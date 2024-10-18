part of '../home.dart';

@RoutePage()
class TextPage extends StatelessWidget implements AutoRouteWrapper {
  final TextEntity textEntity;
  const TextPage({
    super.key,
    required this.textEntity,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        textsRepository: instance(),
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textEntity.textTitle ?? StringConsts.emptyString,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text(
            textEntity.text ?? StringConsts.emptyString,
            style: context.textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
