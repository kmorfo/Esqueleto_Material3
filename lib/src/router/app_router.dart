import 'package:go_router/go_router.dart';

import 'package:esqueleto/src/pages/pages.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: Page1Page.name,
    builder: (context, state) => Page1Page(),
  ),
]);
