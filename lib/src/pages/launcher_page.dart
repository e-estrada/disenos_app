
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos_app/src/routes/routes.dart';
import 'package:disenos_app/src/theme/theme.dart';

class LauncherPage extends StatelessWidget {
 const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diseños en Flutter'),
      ),
      drawer: _MenuPrincipal(),
      body: _ListaOpciones(),
   );
  }
}


class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(
        color: appTheme.primaryColorLight,
      ), 
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(pageRoutes[index].icon, color: appTheme.colorScheme.secondary),
        title: Text(pageRoutes[index].titulo),
        trailing: Icon(Icons.chevron_right, color: appTheme.colorScheme.secondary),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => pageRoutes[index].page));
        },

      ), 
    
    );
  }
}


class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final colorSchemeSecondary = appTheme.currentTheme.colorScheme.secondary;
    return Drawer(
      child: Column(
        children: [

          SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: colorSchemeSecondary,
                child: const Text('EE', style: TextStyle(
                  fontSize: 50
                ),),
              ),
            ),
          ),


          Expanded(
            child: _ListaOpciones()
          ),


          ListTile(
            leading: Icon(Icons.lightbulb_outline, color: colorSchemeSecondary),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
              activeColor: colorSchemeSecondary,
              value: appTheme.darkTheme, 
              onChanged: (value) => appTheme.darkTheme = value,
            ),
          ),


          SafeArea(
            bottom: true,
            top: false,
            left: false,
            right: false,
            child: ListTile(
              leading: Icon(Icons.add_to_home_screen, color: colorSchemeSecondary),
              title: const Text('Custom Theme'),
              trailing: Switch.adaptive(
                activeColor: colorSchemeSecondary,
                value: appTheme.customTheme, 
                onChanged: (value) => appTheme.customTheme = value,
              ),
            ),
          )

        ],
      ),
    );
  }
}