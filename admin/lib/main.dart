import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:admin/data_provider.dart';
import 'firebase_options.dart';
import 'screen/socre_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => EventRepository(),
        ),
        ChangeNotifierProvider(
          create: (_) => DepartmentRepository(),
        ),
        ChangeNotifierProvider(
          create: (_) => ScreenStateProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => EventProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DepartmentProvider(),
        ),
      ],
      child: const MainPage(),
    ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final depData = Provider.of<DepartmentRepository>(context, listen: false);
      final eventData = Provider.of<EventRepository>(context, listen: false);
      depData.updateData();
      eventData.updateData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenStateProvider = Provider.of<ScreenStateProvider>(context);
    ScreenState screenState = screenStateProvider.state;
    switch (screenState) {
      case ScreenState.score:
        return const ScorePage();
      default:
        print("Error");
        return const ScorePage();
    }
  }
}
