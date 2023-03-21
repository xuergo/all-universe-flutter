import 'package:get/get.dart';
import 'play_list_controller.dart';

class PlayListBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<PlayListController>(() => PlayListController());
    }
}
