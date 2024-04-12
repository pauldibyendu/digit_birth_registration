import 'package:digit_birth_certification/app/bloc/birth_list/birth_list_bloc.dart';
import 'package:digit_birth_certification/app/bloc/birth_list/birth_list_event.dart';
import 'package:digit_birth_certification/app/bloc/birth_list/birth_list_state.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/mixin/app_mixin.dart';
import '../../../../data/models/birth_registration_application.dart';
import '../../../../bloc/birth_registration/birth_registration_bloc.dart';
import '../../../widgets/birth_card.dart';

class BirthRegistrationList extends StatefulWidget with AppMixin{

  BirthRegistrationList({super.key});

  @override
  BirthRegistrationListState createState() => BirthRegistrationListState();

}

class BirthRegistrationListState extends State<BirthRegistrationList> {

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    widget.birthListBloc.add(BirthListInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Birth registration list"),
        ),
        body: Column(
          children: [
            DigitSearchBar(
                controller: searchController,
                hintText: "Tenant ID",
                textCapitalization: TextCapitalization.words,
                onChanged: (value) => { widget.birthListBloc.add(BirthListSearchEvent(searchString: value)) }
            ),
            BlocConsumer<BirthListBloc, BirthListState>(
              bloc: widget.birthListBloc,
              listenWhen: (previous, current) => current is BirthListActionState,
              buildWhen: (previous, current) => current is! BirthListActionState,
              listener: (context, state) { },
              builder: (context, state) {
                switch (state.runtimeType) {
                  case BirthListLoadingState:
                    return const Expanded(child: Center(child: CircularProgressIndicator()));
                  case BirthListLoadedSuccessState:
                    return HomeScreen(birthDataList: (state as BirthListLoadedSuccessState).birthData);
                  case BirthListErrorState:
                    return const Expanded(child: Center(child: Text("Something went wrong")));
                  default:
                    return const Expanded(child: SizedBox());
                }
              },
            ),
            DigitElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/BirthRegistration');
                },
                child: const Text('Birth Registration')
            ),
          ],
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
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.builder(
          primary: false,
          itemCount: birthDataList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return BirthCard(birthApplication: birthDataList[index]);
          },
        ),
      ),
    );
  }


}
