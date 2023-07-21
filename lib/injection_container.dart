import 'package:get_it/get_it.dart';
import 'package:my_qoran/core/data/data_source/local/quran_database.dart';

final inject = GetIt.instance;

Future<void> initialiseDependencies() async {
  /**
   * Singleton: Same instance for the app lifetime.
   * Factory: New Instance Everytime, Good for ViewModels.
   */
}
