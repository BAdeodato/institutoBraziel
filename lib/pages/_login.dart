import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instituto_braziel/components/_create_account.dart';
import 'package:instituto_braziel/components/_forgot_password.dart';
import 'package:instituto_braziel/components/_new_password.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? selectedUser;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color(0xFF6F0606),
      body: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Color(0xFF6F0606)),
              alignment: AlignmentDirectional(0, 1),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Colocar logomarca!!!'),
                          RadioGroup<String>(
                            groupValue: selectedUser,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedUser = newValue;
                              });
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RadioListTile<String>(
                                  title: Text(
                                    'SOU PROFESSOR(A)',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  value: 'professor',
                                  activeColor: Colors.white,
                                  fillColor: WidgetStatePropertyAll(
                                    Colors.white,
                                  ),
                                ),
                                RadioListTile<String>(
                                  title: Text(
                                    'SOU ALUNO(A)',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  value: 'aluno',
                                  activeColor: Colors.white,
                                  fillColor: WidgetStatePropertyAll(
                                    Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x33000000),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        border: Border.all(color: Color(0xFFE6E6E6)),
                      ),
                      child: Align(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            32,
                            32,
                            32,
                            MediaQuery.of(context).padding.bottom + 20,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  12,
                                  0,
                                  24,
                                ),
                                child: Text(
                                  'Preencha as informações abaixo para efetuar o login!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  0,
                                  0,
                                  16,
                                ),
                                child: Container(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          30.0,
                                        ),
                                        borderSide: BorderSide(),
                                      ),
                                      prefixIcon: Icon(Icons.email),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  0,
                                  0,
                                  16,
                                ),
                                child: Container(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Senha',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          30.0,
                                        ),
                                        borderSide: BorderSide(),
                                      ),
                                      prefixIcon: Icon(Icons.lock),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    16,
                                    0,
                                    0,
                                    24,
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                context,
                                              ),
                                              child: Container(
                                                height:
                                                    MediaQuery.sizeOf(
                                                      context,
                                                    ).height *
                                                    0.65,
                                                child: ForgotPassword(),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                    child: const Text(
                                      'Esqueci minha senha',
                                      style: TextStyle(
                                        color: Color(0xFF06223a),
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  0,
                                  0,
                                  16,
                                ),
                                child: OutlinedButton(
                                  onPressed: () async {
                                    Navigator.pushNamed(context, 'home');
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      Color(0xFF06223a),
                                    ),
                                    minimumSize: WidgetStatePropertyAll(
                                      Size(250, 50),
                                    ),
                                    side: WidgetStateProperty.all(
                                      const BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'CONECTE-SE',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  0,
                                  0,
                                  16,
                                ),
                                child: OutlinedButton.icon(
                                  onPressed: () async {},
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      Colors.white,
                                    ),
                                    minimumSize: WidgetStatePropertyAll(
                                      Size(250, 50),
                                    ),
                                    side: WidgetStateProperty.all(
                                      const BorderSide(
                                        color: Color(0xFFE6E6E6),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  label: Text(
                                    'Fazer login com Google',
                                    style: TextStyle(color: Color(0xFF06223a)),
                                  ),
                                  icon: FaIcon(
                                    FontAwesomeIcons.google,
                                    size: 20,
                                    color: Color(0xFF06223a),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  0,
                                  0,
                                  16,
                                ),
                                child: OutlinedButton.icon(
                                  onPressed: () async {},
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      Colors.white,
                                    ),
                                    minimumSize: WidgetStatePropertyAll(
                                      Size(250, 50),
                                    ),
                                    side: WidgetStateProperty.all(
                                      const BorderSide(
                                        color: Color(0xFFE6E6E6),
                                      ),
                                    ),
                                  ),
                                  label: Text(
                                    'Fazer login com Apple',
                                    style: TextStyle(color: Color(0xFF06223a)),
                                  ),
                                  icon: FaIcon(
                                    FontAwesomeIcons.apple,
                                    size: 20,
                                    color: Color(0xFF06223a),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  0,
                                  0,
                                  16,
                                ),
                                child: OutlinedButton.icon(
                                  onPressed: () async {},
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      Colors.white,
                                    ),
                                    minimumSize: WidgetStatePropertyAll(
                                      Size(250, 50),
                                    ),
                                    side: WidgetStateProperty.all(
                                      const BorderSide(
                                        color: Color(0xFFE6E6E6),
                                      ),
                                    ),
                                  ),
                                  label: Text(
                                    'Fazer login com Facebook',
                                    style: TextStyle(color: Color(0xFF06223a)),
                                  ),
                                  icon: FaIcon(
                                    FontAwesomeIcons.facebook,
                                    size: 20,
                                    color: Color(0xFF06223a),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  12,
                                  0,
                                  12,
                                ),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(text: 'Ainda não conta? '),
                                      TextSpan(
                                        text: 'Criar uma nova conta.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(
                                                      context,
                                                    ).unfocus();
                                                    FocusManager
                                                        .instance
                                                        .primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                          context,
                                                        ),
                                                    child: Container(
                                                      height:
                                                          MediaQuery.sizeOf(
                                                            context,
                                                          ).height *
                                                          0.75,
                                                      child: CreateAccount(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                      ),
                                    ],
                                    style: TextStyle(color: Color(0xFF06223a)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
