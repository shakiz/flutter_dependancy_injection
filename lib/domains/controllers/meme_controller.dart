import 'package:flutter_dependancy_injection/repositories/meme_repo.dart';
import 'package:flutter_dependancy_injection/locator.dart';

class MemeDomainController {
  getNextMeme() async {
    return await getIt.get<MemeRepo>().getMeme();
  }
}