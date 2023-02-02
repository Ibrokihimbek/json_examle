import 'package:flutter/material.dart';
import 'package:json_example/data/sotrage_repository/sotorage_repo.dart';
import 'package:json_example/screens/home/home_page.dart';
import 'package:json_example/screens/password/pasword_two.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  bool isLog = false;

  Future<bool> isLoggedIn() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    isLog = _pref.getBool("isLoggedIn") ?? false;
    return _pref.getBool("isLoggedIn") ?? false;
  }

  String passwordOne = '';
  String passwordTwo = '';
  String passwordThre = '';
  String passwordFor = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('C Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            bottom: 30,
            top: 120,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Parol kiriting'),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  codeVerification(password: passwordOne),
                  const SizedBox(width: 8),
                  codeVerification(password: passwordTwo),
                  const SizedBox(width: 8),
                  codeVerification(password: passwordThre),
                  const SizedBox(width: 8),
                  codeVerification(password: passwordFor)
                ],
              ),
              const SizedBox(height: 40),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 90,
                  ),
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (passwordOne.isEmpty) {
                              passwordOne = index == 9
                                  ? ''
                                  : index == 10
                                      ? '0'
                                      : (index + 1).toString();
                              StorageRepository.setString(
                                  'passwordOne', passwordOne);
                            } else if (passwordTwo.isEmpty) {
                              passwordTwo = index == 9
                                  ? ''
                                  : index == 10
                                      ? '0'
                                      : (index + 1).toString();
                              StorageRepository.setString(
                                  'passwordTwo', passwordTwo);
                            } else if (passwordThre.isEmpty) {
                              passwordThre = index == 9
                                  ? ''
                                  : index == 10
                                      ? '0'
                                      : (index + 1).toString();
                              StorageRepository.setString(
                                  'passwordThre', passwordThre);
                            } else if (passwordFor.isEmpty) {
                              passwordFor = index == 9
                                  ? ''
                                  : index == 10
                                      ? '0'
                                      : (index + 1).toString();
                              StorageRepository.setString(
                                  'passwordFor', passwordFor);
                            }
                            if (passwordFor.isNotEmpty) {
                              Future.delayed(const Duration(milliseconds: 500))
                                  .then(
                                (value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => PasswordTwoPage()));
                                },
                              );
                            }
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == 9 || index == 11
                              ? Colors.transparent
                              : Colors.grey.shade300,
                        ),
                        child: Center(
                          child: Text(
                            index == 9 || index == 11
                                ? ''
                                : index == 10
                                    ? '0'
                                    : (index + 1).toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget codeVerification({required String password}) {
    return Container(
      width: 40,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Center(
          child: Text(
        password,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      )),
    );
  }

  void saveLogin(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isLoggedIn", true);

    // Navigator.pushNamedAndRemoveUntil(context, RoutName.home, (route) => false);
  }
}
