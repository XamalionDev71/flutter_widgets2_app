import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Hola Mundo!!'),
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            title: Text('Estas seguro?'),
            content: Text(
              'Occaecat sunt officia laborum eiusmod aliqua. Id officia Lorem anim eiusmod ex ad laboris amet. Ad commodo sit in in ad elit nostrud esse minim. Cillum officia velit velit proident nulla aliqua labore nostrud. Est tempor do mollit eiusmod voluptate adipisicing et ex occaecat non duis.',
            ),
            actions: [
              TextButton(onPressed: ()=> context.pop(), child: Text('Cancelar')),
              FilledButton(onPressed: ()=> context.pop(), child: Text('Aceptar')),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbar/Diálogos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    Text(
                      'Dolor laboris cillum magna eiusmod est excepteur proident ullamco incididunt do aliqua veniam eu cupidatat. Cupidatat proident nulla nisi laboris nostrud nisi sint nostrud. Deserunt amet irure id ipsum minim ea eu dolore nisi sint velit.',
                    ),
                  ],
                );
              },
              child: Text('Licencias Utilizadas'),
            ),
            FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: Text('Mostrar Diálogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showCustomSnackbar(context);
        },
        label: Text('Mostrar Snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
