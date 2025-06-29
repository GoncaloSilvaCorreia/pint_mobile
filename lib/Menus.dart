import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// CÓDIGO DO RODAPE
class Rodape extends StatelessWidget {
  const Rodape({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF3F51B5),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Pesquisar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: 'Meus Cursos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
      currentIndex: 0, // índice do item selecionado (pode implementar dinâmico)
      onTap: (index) {
        switch (index) {
          case 0:
            context.go('/TelaPrincipal');  // TelaPrincipal
            break;
          case 1:
            context.go('/pesquisar');
            break;
          case 2:
            context.go('/meus-cursos');
            break;
          case 3:
            context.go('/perfil');
            break;
        }
      },
    );
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            // Cabeçalho com título e botão fechar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'MENU',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            // Itens do menu
            Expanded(
              child: ListView(
                children: [
                  _buildMenuItem(context, Icons.library_books, 'Cursos', '/cursos', selected: true),
                  _buildMenuItem(context, Icons.bookmark, 'Meus cursos', '/meus-cursos'),
                  _buildMenuItem(context, Icons.person, 'Formadores', '/formadores'),
                  _buildMenuItem(context, Icons.forum, 'Fórum', '/forum'),
                  _buildMenuItem(context, Icons.account_circle, 'Perfil', '/perfil'),
                ],
              ),
            ),
            // Botão sair
            Padding(
              padding: const EdgeInsets.all(16),
              child: ListTile(
                leading: const Icon(Icons.exit_to_app, color: Colors.black),
                title: const Text('Sair'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () => context.go('/login'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, String route, {bool selected = false}) {
    final color = selected ? Colors.indigo.shade100 : Colors.black;
    final bgColor = selected ? Colors.indigo.shade100.withOpacity(0.5) : Colors.transparent;

    return Container(
      color: bgColor,
      child: ListTile(
        leading: Icon(icon, color: selected ? Colors.indigo : Colors.black),
        title: Text(title, style: TextStyle(color: color)),
        onTap: () {
          Navigator.of(context).pop();
          context.go(route);
        },
      ),
    );
  }
}