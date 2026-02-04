import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instituto_braziel/components/_create_account.dart';
import 'package:instituto_braziel/components/_forgot_password.dart';
import 'package:instituto_braziel/components/_generic_alert.dart';
import 'package:instituto_braziel/services/auth_service.dart';
import 'package:instituto_braziel/services/users_service.dart';
import 'package:provider/provider.dart';

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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
    late Future<DocumentSnapshot<Map<String, dynamic>>> _userFuture;
  bool isLogin = true;
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userFuture = context.read<UsersService>().getCurrentUser();
  }

    void _reloadUser() {
    setState(() {
      _userFuture = context.read<UsersService>().getCurrentUser();
    });
  }


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
                    Column(
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
                                fillColor: WidgetStatePropertyAll(Colors.white),
                              ),
                              RadioListTile<String>(
                                title: Text(
                                  'SOU ALUNO(A)',
                                  style: TextStyle(color: Colors.white),
                                ),
                                value: 'aluno',
                                activeColor: Colors.white,
                                fillColor: WidgetStatePropertyAll(Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                              Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        0,
                                        0,
                                        0,
                                        16,
                                      ),
                                      child: TextFormField(
                                        controller: email,
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
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Favor informar o e-mail corretamente!';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        0,
                                        0,
                                        0,
                                        16,
                                      ),
                                      child: TextFormField(
                                        controller: password,
                                        obscureText: true,
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
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Favor informar a senha!';
                                          }
                                          // else if (value.length < 8) {
                                          //   return 'A senha deve conter no mínimo 8 caracteres!';
                                          // }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
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
                                              child: SizedBox(
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
                                    if (selectedUser == null ||
                                        selectedUser == '') {
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
                                    if (!formKey.currentState!.validate())
                                      return;

                                    try {
                                      await context.read<AuthService>().login(
                                        selectedUser!,
                                        email.text,
                                        password.text,
                                      );
                                      _reloadUser();
                                    } on AuthException catch (e) {
                                      if (!context.mounted) return;

                                      ScaffoldMessenger.of(
                                        context,
                                      ).clearSnackBars();
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(content: Text(e.message)),
                                      );
                                    }
                                    // Navigator.pushNamed(context, 'home');
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
                                                    child: SizedBox(
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
