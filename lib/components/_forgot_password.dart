import 'package:flutter/material.dart';
import 'package:instituto_braziel/components/_new_password.dart';
import 'package:instituto_braziel/components/_send_email.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<ForgotPassword> createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  String? selectedOption;
  _pageToGoTo() {
    if (selectedOption == 'email') {
      return SendEmail();
    } else if (selectedOption == 'celular') {
      return NewPassword(); //mudar
    } else {
      return NewPassword(); //mudar
    }
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
                          groupValue: selectedOption,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedOption = newValue;
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                    child: Text(
                      'Digite seu e-mail, telefone ou nome de usuário e enviaremos um link para alteração da senha!',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RadioGroup<String>(
                          groupValue: selectedOption,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedOption = newValue;
                            });
                          },
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              RadioListTile<String>(
                                title: Text(
                                  'E-MAIL',
                                  style: TextStyle(color: Color(0xFF06223a)),
                                ),
                                secondary: const Icon(
                                  Icons.email,
                                  color: Color(0xFF06223a),
                                ),
                                value: 'email',
                                activeColor: Color(0xFF06223a),
                                fillColor: WidgetStatePropertyAll(
                                  Color(0xFF06223a),
                                ),
                              ),
                              RadioListTile<String>(
                                title: Text(
                                  'CELULAR',
                                  style: TextStyle(color: Color(0xFF06223a)),
                                ),
                                value: 'celular',
                                activeColor: Color(0xFF06223a),
                                fillColor: WidgetStatePropertyAll(
                                  Color(0xFF06223a),
                                ),
                                secondary: const Icon(
                                  Icons.phone_android,
                                  color: Color(0xFF06223a),
                                ),
                              ),
                              RadioListTile<String>(
                                title: Text(
                                  'USUÁRIO',
                                  style: TextStyle(color: Color(0xFF06223a)),
                                ),
                                value: 'usuario',
                                activeColor: Color(0xFF06223a),
                                fillColor: WidgetStatePropertyAll(
                                  Color(0xFF06223a),
                                ),
                                secondary: const Icon(
                                  Icons.person,
                                  color: Color(0xFF06223a),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                    child: OutlinedButton(
                      onPressed: () async {
                        if (selectedOption == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Favor selecionar uma opção!'),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                          return; // Stop here
                        }
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.5,
                                  child: _pageToGoTo(),
                                ),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
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
                        'CONTINUAR',
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
