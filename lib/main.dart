import 'package:flutter/material.dart';
import 'package:kioski/src/config/init.dart';
import 'package:kioski/src/config/router.dart';
import 'package:kioski/src/presentation/home/cart.dart';
import 'package:kioski/src/presentation/home/product.dart';
import 'package:kioski/src/utils/constants/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  await init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: Routes.home,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
