import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pro/constants.dart';
import 'package:pro/cubits/notes_cubit/notes_cubit.dart';
import 'package:pro/models/note_model.dart';
import 'package:pro/simple_bloc_observer.dart';
import 'package:pro/views/notes_view.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: SplashScreen(),
      ),
    );
  }
}

//////////////////////////////////

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const NotesView(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 42, 42, 43),
        child: ListView(
          children: <Widget>[
            // Image.asset(
            //   'assets/images/logo3.png',
            //   width: double.infinity,
            //   height: 810,
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 350),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Notes",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 80,
                          color: Colors.white,
                          fontFamily: "DancingScript",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
                height:
                    20), // add some space between the image and the progress indicator
            Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
