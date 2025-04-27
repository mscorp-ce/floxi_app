import 'package:flutter/material.dart';
import '../screens/splash.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPage(), // Tela inicial é o Splash
      routes: {
        '/home': (context) => HomeScreen(), // Rota para a HomeScreen
      }, // Tela principal (com Drawer)
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Color appBarColor = const Color(0xFF002D62); // Azul escuro
  final Color accentColor = const Color(0xFF0073BC); // Azul mais claro

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Floxi - Focu no futuro',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: appBarColor,
        // Define a cor do ícone do drawer (menu de hamburger) para branco
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: buildDrawer(context, appBarColor),
      body: Center(child: Text('Home')),
    );
  }

  Widget buildDrawer(BuildContext context, Color appBarColor) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: appBarColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context); // Fecha o Drawer
                    }
                  },
                ),
                SizedBox(height: 16),
                Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: accentColor),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context); // Fecha o Drawer
              // Navegação adicional (se necessário)
            },
          ),

          // Seção de Cadastros
          ExpansionTile(
            leading: Icon(Icons.folder_open, color: accentColor),
            title: Text('Cadastros'),
            children: [
              ListTile(
                contentPadding: EdgeInsets.only(left: 72),
                leading: Icon(Icons.arrow_right, color: accentColor),
                title: Text('Classificações de Receitas'),
                onTap: () {
                  Navigator.pop(context);
                  // Navegue para a página de classificações de receitas
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 72),
                leading: Icon(Icons.arrow_right, color: accentColor),
                title: Text('Classificações de Despesas'),
                onTap: () {
                  Navigator.pop(context);
                  // Navegue para a página de classificações de despesas
                },
              ),
            ],
          ),

          // Seção de Movimentações
          ExpansionTile(
            leading: Icon(Icons.sync_alt, color: accentColor),
            title: Text('Movimentações'),
            children: [
              ListTile(
                contentPadding: EdgeInsets.only(left: 72),
                leading: Icon(Icons.arrow_upward, color: Colors.green),
                title: Text('Receitas'),
                onTap: () {
                  Navigator.pop(context);
                  // Navegue para a página de receitas
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 72),
                leading: Icon(Icons.arrow_downward, color: Colors.red),
                title: Text('Despesas'),
                onTap: () {
                  Navigator.pop(context);
                  // Navegue para a página de despesas
                },
              ),
            ],
          ),

          ListTile(
            leading: Icon(Icons.settings, color: accentColor),
            title: Text('Configurações'),
            onTap: () {
              Navigator.pop(context); // Fecha o Drawer
              // Navega para Configurações
            },
          ),
        ],
      ),
    );
  }
}
