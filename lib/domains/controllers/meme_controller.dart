import 'package:flutter_dependancy_injection/repositories/meme_repo.dart';
import 'package:flutter_dependancy_injection/locator.dart';

class MemeDomainController {
  getNextMeme() async {
    // TODO: Call the Repository and receive a meme
    return await getIt.get<MemeRepo>().getMeme();
  }
}