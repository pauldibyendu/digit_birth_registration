import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/app_mixin.dart';
import '../../data/models/birth_registration_application.dart';
import '../bloc/birth_registration_bloc.dart';
import '../bloc/birth_registration_event.dart';
import '../bloc/birth_registration_state.dart';
import '../widgets/birth_card.dart';

class BirthRegistrationList extends StatefulWidget with AppMixin{

  BirthRegistrationList({super.key});

  @override
  BirthRegistrationListState createState() => BirthRegistrationListState();

}

class BirthRegistrationListState extends State<BirthRegistrationList> {

  @override
  void initState() {
    widget.birthRegistrationBloc.add(BirthDataInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Birth registration list"),
        ),
        body: BlocConsumer<BirthRegistrationBloc, BirthDataState>(
          bloc: Get.find<BirthRegistrationBloc>(),
          listenWhen: (previous, current) => current is BirthDataActionState,
          buildWhen: (previous, current) => current is! BirthDataActionState,
          listener: (context, state) {
            switch (state.runtimeType) {
              case NavigateToRegistrationActionState:
                Navigator.pushNamed(context, '/BirthRegistration');
                break;
              default:
                break;
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case BirthDataLoadingState:
                return const Center(child: CircularProgressIndicator());
              case BirthDataLoadedSuccessState:
                return HomeScreen(birthDataList: (state as BirthDataLoadedSuccessState).birthData);
              case BirthDataErrorState:
                return const Center(child: Text("Something went wrong"));
              default:
                return const SizedBox();
            }
          },
        )
    );

  }

}

class HomeScreen extends StatelessWidget with AppMixin{

  List<BirthRegistrationApplicationModel> birthDataList;

  HomeScreen({required this.birthDataList, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              primary: false,
              itemCount: birthDataList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return BirthCard(birthApplication: birthDataList[index]);
              },
            ),
          ),
          DigitElevatedButton(
              onPressed: () {
                birthRegistrationBloc.add(BirthRegistrationNavigateEvent());
              },
              child: const Text('Birth Registration')
          ),
        ],
      ),
    );
  }


}
