import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:starter_template_app_new1/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
