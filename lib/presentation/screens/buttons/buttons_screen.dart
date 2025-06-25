import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buttons Screen')),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Wrap(
          spacing: 20,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){},
              child: Text('ElevatedButton'),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text('Disable ElevatedButton'),
            ),
            ElevatedButton.icon(
              onPressed: (){},
              label: Text('Elevated Icon'),
              icon: Icon(Icons.alarm),
            ),
            FilledButton(onPressed: (){}, child: Text('Filled')),
            FilledButton.icon(
              onPressed: (){}, 
              label: Text('Filled Icon'),
              icon: Icon(Icons.ac_unit),  
            ),
            OutlinedButton(onPressed: (){}, child: Text('Outlined')),
            OutlinedButton.icon(
              onPressed: (){},
              label: Text('Outlined Icon'),
              icon: Icon(Icons.accessible_forward_outlined),
            ),
            TextButton(onPressed: (){}, child: Text('Text Button')),
            TextButton.icon(
              onPressed: (){},
              label: Text('Text Button Icon'),
              icon: Icon(Icons.add_to_photos),
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_added)),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.app_registration_rounded),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),
                iconColor: WidgetStatePropertyAll(Colors.white)
              ),
            ),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.deepOrange,
        child: InkWell(
          onTap: (){},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Flutter/Dart',
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
