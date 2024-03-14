import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:digit_components/digit_components.dart';
import 'package:reactive_forms/reactive_forms.dart';

class BirthRegistrationForm extends StatefulWidget {
  final String title;
  const BirthRegistrationForm({required this.title, super.key});

  @override
  BirthRegistrationFormState createState() => BirthRegistrationFormState();
}

class BirthRegistrationFormState extends State<BirthRegistrationForm> {

  String babyFirstNameKey = 'babyFirstName';
  String babyLastNameKey = 'babyFirstName';
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
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'User Details',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                    ),
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
                      label: 'Baby Last Name',
                      formControlName: babyLastNameKey,
                      isRequired: true,
                      validationMessages: {
                        'maxLength': (_) =>
                        'Baby Last Name should be maximum of 128 characters',
                      },
                    ),
                    DigitTextFormField(
                      label: 'Doctor Name',
                      formControlName: doctorNameKey,
                      isRequired: true,
                      onChanged: (val){  },
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
                    DigitElevatedButton(
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
                        child: const Text('Submit'))
                  ],
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
    babyLastNameKey : FormControl<String>(value: '', validators: [
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
