import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets2_app/presentation/providers/theme_provider.dart';

class ThemeChanger extends ConsumerWidget {
  static const name = 'theme_changer_screen';

  const ThemeChanger({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cambiar Tema'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
            icon: Icon(
              isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];

        return RadioListTile(
          title: Text('Este color',style: TextStyle(color: color),),
          subtitle: Text('${color.hashCode}'),
          value: index,
          groupValue: 5,
          onChanged: (value){
            //TODO: Notificar el cambio
          }
        );
      },
    );
  }
}
