import 'package:flutter_dependancy_injection/domains/controllers/meme_controller.dart';
import 'package:flutter_dependancy_injection/repositories/meme_repo.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup(){
  getIt.registerLazySingleton<MemeDomainController>(() => MemeDomainController());
  getIt.registerLazySingleton<MemeRepo>(() => MemeRepo());
}