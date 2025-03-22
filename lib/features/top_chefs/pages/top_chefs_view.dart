import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../managers/top_chefs_bloc.dart';
import '../managers/top_chefs_state.dart';

class TopChefsView extends StatelessWidget {
  const TopChefsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopChefsBloc, TopChefsState>(
      builder: (context, state) => Scaffold(
        body: ListView.builder(
          itemBuilder: (context, index) => Image.network(
            state.newChefs[index].image,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}