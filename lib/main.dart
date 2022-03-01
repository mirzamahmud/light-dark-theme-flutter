import 'package:adaptive_theme_provider/providers/theme_provider.dart';
import 'package:adaptive_theme_provider/views/home_views.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  
  runApp(

    ChangeNotifierProvider<ThemeProvider>(

      create: (_) => ThemeProvider()..initialize(),
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {

  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer<ThemeProvider>(

      builder: (context, provider, child) => MaterialApp(
        
        debugShowCheckedModeBanner: false,
        title: "Adaptive Theme with Provider",
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: provider.themeMode, 
    
        home: const HomeViews(),
      ),
    );
  }
}