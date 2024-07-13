
import 'package:google_maps/features/map_screen/cubit/map_cubit.dart';
import 'package:google_maps/features/map_screen/presentation/screens/map_screen.dart';

import '../common/widgets/no_route.dart';
import '../src/app_export.dart';

part 'app_routes.dart';

class AppRouter {
  static Route? generateRoutes(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        switch (settings.name) {
          case AppRoutes.initScreen:
            return BlocProvider(
                create: (context)=>getIt<MapCubit>(),
                child: const GoogleMapScreen());
          default:
            return NoRouteScreen(routeName: settings.name!);
        }
      },
    );
  }
}
