import 'store_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'store_page.dart';

class StoreModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $StoreController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => StorePage()),
      ];

  static Inject get to => Inject<StoreModule>.of();
}
