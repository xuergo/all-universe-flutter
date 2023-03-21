import 'package:get/get.dart';
import 'play_controller.dart';

class PlayBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<PlayController>(() => PlayController());
    }
}
