import 'package:adaptive_theme_provider/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeViews extends StatefulWidget {

  const HomeViews({ Key? key }) : super(key: key);

  @override
  _HomeViewsState createState() => _HomeViewsState();
}

class _HomeViewsState extends State<HomeViews> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(

        children: [

          AnimatedSwitcher(

            duration: const Duration(microseconds: 250),
            child: Image.asset(
          
              Theme.of(context).brightness == Brightness.light ?
              "assets/light.png" : "assets/dark.png",
              height: double.infinity,
              fit: BoxFit.fill,
              key: Key(Theme.of(context).brightness.toString()),
            ),
          ),

          Positioned.fill(

            top: 80,
            child: Align(
          
              alignment: Alignment.topCenter,
              child: Consumer<ThemeProvider>(

                builder: (context, provider, child) => DropdownButton<String>(
                          
                  value: provider.currentTheme,
                  
                  items: [
                          
                    DropdownMenuItem<String>(
                          
                      value: 'light',
                      child: Text("Light", style: Theme.of(context).textTheme.headline6),
                    ),
                     DropdownMenuItem<String>(
                          
                      value: 'dark',
                      child: Text("Dark", style: Theme.of(context).textTheme.headline6),
                    ),
                     DropdownMenuItem<String>(
                          
                      value: 'system',
                      child: Text("System", style: Theme.of(context).textTheme.headline6),
                    ),
                  ],
                  onChanged: (String? value){
                          
                    provider.changeTheme(value ?? 'system');
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}