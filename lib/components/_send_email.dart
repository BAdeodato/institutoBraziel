import 'package:flutter/material.dart';

class SendEmail extends StatefulWidget {
  const SendEmail({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<SendEmail> createState() => _SendEmail();
}

class _SendEmail extends State<SendEmail> {
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nova Senha',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFE6E6E6),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Confirmar nova senha',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFE6E6E6),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      'Sua senha deve conter pelo menos 8 caracteres.',
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text('Inclua pelo menos uma letra maiúscula.'),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text('Inclua pelo menos uma letra minúscula.'),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text('Inclua pelo menos um número na senha.'),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                    child: OutlinedButton(
                                  onPressed: () async {
                                    Navigator.pushNamed(context, 'home');
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      Color(0xFF06223a),
                                    ),
                                    minimumSize: WidgetStatePropertyAll(
                                      Size(220, 50),
                                    ),
                                    side: WidgetStateProperty.all(
                                      const BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'CONFIRMAR',
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
