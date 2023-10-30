import 'package:my_note/common/constant/background_task_name.dart';
import 'package:workmanager/workmanager.dart';

// Task run on isolate, not share memory, dependencies with main thread
@pragma('vm:entry-point')
void workManagerDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case BackgroundTaskName.task1:
        print("do something here");
        break;
      default:
        break;
    }
    return Future.value(true);
  });
}
