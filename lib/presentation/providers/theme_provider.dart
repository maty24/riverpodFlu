import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

// Un simple boolean
final isDarkmodeProvider = StateProvider((ref) => false);

// Un simple int
final selectedColorProvider = StateProvider((ref) => 0);

// Un objeto de tipo AppTheme (custom)
//el primer parametro es el tipo de dato que va a manejar y el segundo es el valor inicial
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
    //creo una instancia de ThemeNotifier, cuando se refiera a instancia es uan referencia a un objeto
    (ref) => ThemeNotifier());

//cotrolador de estado
class ThemeNotifier extends StateNotifier<AppTheme> {
  //le digo que tenga los valores iniciales de AppTheme
  // STATE = Estado = new AppTheme();
  ThemeNotifier() : super(AppTheme());

  void toggleDarkmode() {
   //el state es el estado actual de este provider
   //el copyWith es un metodo que se creo en el AppTheme que recibe los parametros que se quieren cambiar

    //estoy cambiando el estado actual por uno nuevo,  si isDarkmode es true lo pone en false y viceversa
    state = state.copyWith(isDarkmode: !state.isDarkmode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
