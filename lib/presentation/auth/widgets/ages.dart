import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:e_commerce_app/presentation/auth/bloc/ages_display_cubit.dart';
import 'package:e_commerce_app/presentation/auth/bloc/ages_display_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      child: BlocBuilder<AgesDisplayCubit, AgesDisplayState>(
        builder: (context, state) {
          if (state is AgesLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is AgesLoaded) {
            return Container(
                alignment: Alignment.center, child: _ages(state.ages));
          }
          if (state is AgesLoadFailure) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => {
            Navigator.pop(context),
            context
                .read<AgeSelectionCubit>()
                .selectAge(ages[index].data()['value'].toString()),
          },
          child: Text(
            ages[index].data()['value'].toString(),
            style: const TextStyle(fontSize: 25),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(),
      itemCount: ages.length,
    );
  }
}
