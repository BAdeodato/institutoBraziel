// ignore_for_file: avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instituto_braziel/components/_generic_alert.dart';
import 'package:instituto_braziel/services/auth_service.dart';
import 'package:instituto_braziel/services/users_service.dart';
import 'package:instituto_braziel/utils/_input_formatters.dart';
import 'package:provider/provider.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<CreateAccount> createState() => _CreateAccount();
}

class _CreateAccount extends State<CreateAccount> {
  String selectedUser = '';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController userName = TextEditingController();
  late Future<DocumentSnapshot<Map<String, dynamic>>?> _userFuture;

  register() async {
    // TODO: LEMBRAR DE PASSAR O RESTANTE DOS PARÂMETROS JÁ ADD NO FIREBASE
    try {
      await context.read<AuthService>().register(
        email.text,
        confirmPassword.text,
        selectedUser,
        phone.text,
        userName.text,
        '',
        '',
        '',
        false,
      );
    } on AuthException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  void initState() {
    super.initState();
    _userFuture = context.read<UsersService>().getCurrentUser();
  }

  void _reloadUser() {
    if (!mounted) return;
    setState(() {
      _userFuture = context.read<UsersService>().getCurrentUser();
    });
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    phone.dispose();
    userName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFE6E6E6)),
        ),
        child: Align(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(32, 32, 32, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RadioGroup<String>(
                          groupValue: selectedUser,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedUser = newValue!;
                            });
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RadioListTile<String>(
                                title: Text(
                                  'SOU PROFESSOR(A)',
                                  style: TextStyle(color: Color(0xFF06223a)),
                                ),
                                value: 'professor',
                                activeColor: Color(0xFF06223a),
                                fillColor: WidgetStatePropertyAll(
                                  Color(0xFF06223a),
                                ),
                              ),
                              RadioListTile<String>(
                                title: Text(
                                  'SOU ALUNO(A)',
                                  style: TextStyle(color: Color(0xFF06223a)),
                                ),
                                value: 'aluno',
                                activeColor: Color(0xFF06223a),
                                fillColor: WidgetStatePropertyAll(
                                  Color(0xFF06223a),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: TextFormField(
                            controller: userName,
                            decoration: InputDecoration(
                              labelText: 'Usuário',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(),
                              ),
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: Container(
                            child: TextFormField(
                              controller: phone,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [AppInputFormatters.phone()],
                              decoration: InputDecoration(
                                labelText: 'Celular',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(),
                                ),
                                prefixIcon: Icon(Icons.phone),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Phone number is required';
                                }
                                if (value.length != 14) {
                                  return 'Enter a valid phone number';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(),
                              ),
                              prefixIcon: Icon(Icons.email),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: Container(
                            child: TextFormField(
                              controller: password,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Senha',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(),
                                ),
                                prefixIcon: Icon(Icons.lock),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: Container(
                            child: TextFormField(
                              controller: confirmPassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Confirmar senha',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(),
                                ),
                                prefixIcon: Icon(Icons.lock),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                    child: OutlinedButton(
                      onPressed: () async {
                        if (selectedUser == '') {
                          await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return GenerericAlert(
                                message:
                                    'Favor selecionar PROFESSOR(A) ou ALUNO(A)',
                              );
                            },
                          );
                          return;
                        }

                        if (password.text != confirmPassword.text) {
                          await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return GenerericAlert(
                                message:
                                    'As senhas não coincidem, favor verificar!',
                              );
                            },
                          );
                          return;
                        }
                        if (formKey.currentState!.validate()) {
                          await register();
                          if (mounted) {
                            Navigator.of(
                              context,
                            ).pop(); // This closes the component/screen
                            _reloadUser();
                          }
                        }
                        // Navigator.pushNamed(context, 'home');
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Color(0xFF06223a),
                        ),
                        minimumSize: WidgetStatePropertyAll(Size(220, 50)),
                        side: WidgetStateProperty.all(
                          const BorderSide(color: Colors.transparent),
                        ),
                      ),
                      child: Text(
                        'CRIAR CONTA',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
