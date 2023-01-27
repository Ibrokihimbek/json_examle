import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_example/cubit/cards_cubit.dart';
import 'package:json_example/cubit/cards_state.dart';
import 'package:json_example/data/app_repository/app_repository.dart';
import 'package:json_example/data/json/api_service.dart';

class JsonExample extends StatelessWidget {
  const JsonExample({super.key});

  @override
  Widget build(BuildContext context) {
    CardsCubit cardsCubit = CardsCubit(AppRepository(apiService: ApiService()));
    return BlocProvider(
      create: (context) => cardsCubit,
      child: BlocBuilder<CardsCubit, CardsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: const Text(
                'Users Data',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            body: state is LoadCardsInProgress
                ? const Center(child: CircularProgressIndicator())
                : state is LoadCardsInSuccess
                    ? Center(
                        child: Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.cards.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(
                                  top: 15,
                                  bottom: 15,
                                  left: 20,
                                  right: 20,
                                ),
                                padding: const EdgeInsets.all(20),
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          state.cards[index].fISh,
                                          style: const TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      state.cards[index].lavozim,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Text(
                                          state.cards[index].qabulkunlari,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        const Text(
                                          "SO'M",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 18),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    : state is LoadCardssInFailure
                        ? Center(
                            child: Text(
                              state.errorText.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          )
                        : Container(),
          );
        },
      ),
    );
  }
}
