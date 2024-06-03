import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note/config/routes.dart';
import 'package:my_note/modules/home/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(
                  Routes.cart,
                  parameters: {"name": "Hoang"},
                );
              },
              child: Text("go to cart"),
            ),
            ElevatedButton(
              onPressed: _controller.getUser,
              child: Text("get user hive"),
            ),
            ElevatedButton(
              onPressed: _controller.saveUser,
              child: Text("save user hive"),
            ),
            ElevatedButton(
              onPressed: _controller.toggleLanguage,
              child: Text("change language"),
            ),
            ElevatedButton(
              onPressed: _controller.triggerBackgroundTask,
              child: Text("background task1"),
            ),
          ],
        ),
      ),
    );
  }
}


// THIS IS RIVERPOD EXAMPLE
// class HomePage extends ConsumerWidget {
//   HomePage({super.key});

//   final provider = ChangeNotifierProvider<HomeProvider>((ref) {
//     var notifier = HomeProvider();
//     notifier.fetchData();

//     return notifier;
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("this is home page"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           ref.read(provider).addData();
//         },
//         child: const Text("add"),
//       ),
//       body: Column(
//         children: ref.watch(provider).listData.map((val) => Text(val)).toList(),
//       ),
//     );
//   }
// }

// class HomeProvider extends ChangeNotifier {
//   List<String> listData = [
//     "nguyen",
//   ];

//   void fetchData() async {
//     print("call api");
//     await Future.delayed(const Duration(seconds: 5));
//     listData.add("anh hoang dep zai");
//     notifyListeners();
//   }

//   void addData() {
//     listData.add("hoangdepzai");
//     notifyListeners();
//   }
// }
