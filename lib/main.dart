import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:digit_components/digit_components.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'app/presentation/pages/birth_registration_list.dart';
import 'config/bindings.dart';
import 'config/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bindings.registerDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: DigitTheme.instance.mobileTheme,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      home: BirthRegistrationList(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({required this.title, super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String babyFirstNameKey = 'babyFirstName';
  String doctorNameKey = 'doctorName';
  String fatherNameKey = 'fatherName';
  String hospitalNameKey = 'hospitalName';
  String motherNameKey = 'motherName';
  String placeOfBirthKey = 'placeOfBirth';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: ReactiveFormBuilder(
              form: buildForm,
              builder: (context, form, child) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DigitTextFormField(
                        label: 'Baby First Name',
                        formControlName: babyFirstNameKey,
                        isRequired: true,
                        validationMessages: {
                          'required': (_) => 'Baby First Name is required',
                          'minLength': (_) =>
                          'Baby First Name should be minimum of 2 characters',
                          'maxLength': (_) =>
                          'Baby First Name should be maximum of 128 characters',
                        },
                      ),
                      DigitTextFormField(
                        label: 'Doctor Name',
                        formControlName: doctorNameKey,
                        isRequired: true,
                        validationMessages: {
                          'required': (_) => 'Doctor Name is required',
                          'minLength': (_) =>
                          'Doctor Name should be minimum of 2 characters',
                          'maxLength': (_) =>
                          'Doctor Name should be maximum of 128 characters',
                        },
                      ),
                      DigitTextFormField(
                        label: 'Father Name',
                        formControlName: fatherNameKey,
                        isRequired: true,
                        validationMessages: {
                          'required': (_) => 'Father Name is required',
                          'minLength': (_) =>
                          'Father Name should be minimum of 2 characters',
                          'maxLength': (_) =>
                          'Father Name should be maximum of 128 characters',
                        },
                      ),
                      DigitTextFormField(
                        label: 'Hospital Name',
                        formControlName: hospitalNameKey,
                        isRequired: true,
                        validationMessages: {
                          'required': (_) => 'Hospital Name is required',
                          'minLength': (_) =>
                          'Hospital Name should be minimum of 2 characters',
                          'maxLength': (_) =>
                          'Hospital Name should be maximum of 128 characters',
                        },
                      ),
                      DigitTextFormField(
                        label: 'Mother Name',
                        formControlName: motherNameKey,
                        isRequired: true,
                        validationMessages: {
                          'required': (_) => 'Mother Name is required',
                          'minLength': (_) =>
                          'Mother Name should be minimum of 2 characters',
                          'maxLength': (_) =>
                          'Mother Name should be maximum of 128 characters',
                        },
                      ),
                      DigitTextFormField(
                        label: 'Place Of Birth',
                        formControlName: placeOfBirthKey,
                        isRequired: true,
                        validationMessages: {
                          'required': (_) => 'Place Of Birth is required',
                          'minLength': (_) =>
                          'Place Of Birth should be minimum of 2 characters',
                          'maxLength': (_) =>
                          'Place Of Birth should be maximum of 128 characters',
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DigitElevatedButton(
                            onPressed: () {
                              form.markAllAsTouched();
                              if (!form.valid) return;
                              DigitDialog.show(context,
                                  options: DigitDialogOptions(
                                      titleIcon: const Icon(
                                        Icons.warning,
                                        color: Colors.red,
                                      ),
                                      titleText: 'Warning',
                                      contentText:
                                      'Please confirm your details before submitting',
                                      primaryAction: DigitDialogActions(
                                        label: 'Confirm',
                                        action: (BuildContext context) {
                                          if (form.valid) {
                                            form.reset();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Yay ! Details Submitted')));
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Oops ! Please fill the mandatory details')));
                                          }
                                          Navigator.of(context,
                                              rootNavigator: true)
                                              .pop();
                                        },
                                      ),
                                      secondaryAction: DigitDialogActions(
                                        label: 'Back',
                                        action: (BuildContext context) =>
                                            Navigator.of(context,
                                                rootNavigator: true)
                                                .pop(),
                                      )));
                            },
                            child: const Text('Submit')),
                      )
                    ],
                  ),
                );
              }
          ),

        ),
      ), // This trailing comma makes auto-formattig nicer for build methods.
    );
  }

  FormGroup buildForm() => fb.group(<String, Object>{

    babyFirstNameKey : FormControl<String>(value: '', validators: [
      Validators.required,
      Validators.minLength(2),
      Validators.maxLength(128)
    ]),
    doctorNameKey: FormControl<String>(value: '', validators: [
      Validators.required,
      Validators.minLength(2),
      Validators.maxLength(128)
    ]),
    fatherNameKey: FormControl<String>(value: '', validators: [
      Validators.required,
      Validators.minLength(2),
      Validators.maxLength(128)
    ]),
    hospitalNameKey: FormControl<String>(value: '', validators: [
      Validators.required,
      Validators.minLength(2),
      Validators.maxLength(128)
    ]),
    motherNameKey: FormControl<String>(value: '', validators: [
      Validators.required,
      Validators.minLength(2),
      Validators.maxLength(128)
    ]),
    placeOfBirthKey: FormControl<String>(value: '', validators: [
      Validators.required,
      Validators.minLength(2),
      Validators.maxLength(128)
    ]),

  });

}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
