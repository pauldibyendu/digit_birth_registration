import 'package:digit_birth_certification/app/presentation/features/birth_registration/bloc/birth_registration_event.dart';
import 'package:digit_birth_certification/config/app_mixin.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:flutter/material.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../config/theme/app_themes.dart';
import '../../../../data/models/birth_registration_application.dart';
import '../bloc/birth_registration_bloc.dart';
import '../bloc/birth_registration_state.dart';

class BirthRegistrationForm extends StatefulWidget with AppMixin {
  final String title;
  BirthRegistrationApplicationModel? birthData;
  BirthRegistrationForm({required this.title, this.birthData, super.key});

  @override
  BirthRegistrationFormState createState() => BirthRegistrationFormState();
}

class BirthRegistrationFormState extends State<BirthRegistrationForm> {

  BirthRegistrationApplicationModel birthData = BirthRegistrationApplicationModel();

  String babyFirstNameKey = 'babyFirstName';
  String babyLastNameKey = 'babyLastName';
  String doctorNameKey = 'doctorName';
  String fatherNameKey = 'fatherName';
  String hospitalNameKey = 'hospitalName';
  String motherNameKey = 'motherName';
  String placeOfBirthKey = 'placeOfBirth';

  @override
  void initState() {
    if(widget.birthData != null){
      birthData.copyFrom(widget.birthData!);
    }
    super.initState();
  }

  void showDialog(FormGroup form){
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
                  if(widget.birthData == null){
                      widget.birthRegistrationBloc.add(BirthRegistrationSaveEvent(birthData: birthData));
                  }
                  else{
                      widget.birthRegistrationBloc.add(BirthRegistrationUpdateEvent(birthData: birthData));
                  }
                } else {
                  widget.birthRegistrationBloc.add(BirthRegistrationInvalidInputEvent());
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
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BirthRegistrationBloc, BirthRegistrationState>(
      bloc: widget.birthRegistrationBloc,
      listener: (context, state) {
        switch (state.runtimeType) {
          case SuccessActionState:
            buildForm().reset();
            DigitToast.show(context,
                options: DigitToastOptions(
                  (state as SuccessActionState).successMsg,
                  false,
                  theme(),
                ),
            );
            Navigator.pushNamed(context, '/');
            break;
          case FailedActionState:
            buildForm().reset();
            DigitToast.show(context,
                options: DigitToastOptions(
                  (state as FailedActionState).failedMsg,
                  false,
                  theme(),
                ),
            );
            Navigator.pushNamed(context, '/');
            break;
          case InvalidDataActionState:
            DigitToast.show(context,
              options: DigitToastOptions(
                "Oops ! Please fill the mandatory details",
                true,
                theme(),
              ),
            );
            break;
          default:
            break;
        }
      },
      child: Scaffold(
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
                      DigitTextFormField(
                        label: 'Baby First Name',
                        formControlName: babyFirstNameKey,
                        isRequired: true,
                        onChanged: (val) { birthData.babyFirstName = val.value.toString(); },
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
                        onChanged: (val) { birthData.babyLastName = val.value.toString(); },
                        validationMessages: {
                          'required': (_) => 'Baby Last Name is required',
                          'minLength': (_) =>
                          'Baby Last Name should be minimum of 2 characters',
                          'maxLength': (_) =>
                          'Baby Last Name should be maximum of 128 characters',
                        },
                      ),
                      DigitTextFormField(
                        label: 'Doctor Name',
                        formControlName: doctorNameKey,
                        isRequired: true,
                        onChanged: (val) { birthData.doctorName = val.value.toString(); },
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
                        onChanged: (val) { birthData.father = val.value.toString(); },
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
                        onChanged: (val) { birthData.hospitalName = val.value.toString(); },
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
                        onChanged: (val) { birthData.mother = val.value.toString(); },
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
                        onChanged: (val) { birthData.placeOfBirth = val.value.toString(); },
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
                            showDialog(form);
                          },
                          child: const Text('Submit')
                      )
                    ],
                  );
                }
            ),
      
          ),
        ), // This trailing comma makes auto-formattig nicer for build methods.
      ),
    );
  }

  FormGroup buildForm() => fb.group(<String, Object>{
    babyFirstNameKey : FormControl<String>(
      value: birthData.babyFirstName ?? '',
      validators: [
        Validators.required,
        Validators.minLength(2),
        Validators.maxLength(128)
      ]
    ),
    babyLastNameKey : FormControl<String>(
      value: birthData.babyLastName ?? '',
      validators: [
        Validators.required,
        Validators.minLength(2),
        Validators.maxLength(128)
      ]
    ),
    doctorNameKey: FormControl<String>(
      value: birthData.doctorName ?? '',
      validators: [
        Validators.required,
        Validators.minLength(2),
        Validators.maxLength(128)
      ]
    ),
    fatherNameKey: FormControl<String>(
      value: birthData.father ?? '',
      validators: [
        Validators.required,
        Validators.minLength(2),
        Validators.maxLength(128)
      ]
    ),
    hospitalNameKey: FormControl<String>(
      value: birthData.hospitalName ?? '',
      validators: [
        Validators.required,
        Validators.minLength(2),
        Validators.maxLength(128)
      ]
    ),
    motherNameKey: FormControl<String>(
      value: birthData.mother ?? '',
      validators: [
        Validators.required,
        Validators.minLength(2),
        Validators.maxLength(128)
      ]
    ),
    placeOfBirthKey: FormControl<String>(
      value: birthData.placeOfBirth ?? '',
      validators: [
        Validators.required,
        Validators.minLength(2),
        Validators.maxLength(128)
      ]
    ),
  });

}
