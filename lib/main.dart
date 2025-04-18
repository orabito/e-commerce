import 'package:ecommerce_app/core/local/prefs_helper.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/MyBlocObserver.dart';
import 'core/di/di.dart';
import 'core/routes_manager/route_generator.dart';
import 'features/products_screen/presentation/logic/product_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  await dotenv.load(fileName: ".env");
  configureDependencies();
  Bloc.observer = MyBlocObserver();

  await PrefsHelper.initPrefs();

  runApp(BlocProvider(
    create: (context) => getIt<ProductCubit>(),
    child:const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>
          MaterialApp(
            debugShowCheckedModeBanner: false,
            home: child,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: PrefsHelper.getToken() == null
                ? Routes.signInRoute
                : Routes.mainRoute,

          ),
    );
  }
}
