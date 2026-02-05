import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instituto_braziel/components/_new_password.dart';
import 'package:instituto_braziel/services/users_service.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<Sidebar> createState() => _Sidebar();
}

class _Sidebar extends State<Sidebar> {
  late Future<DocumentSnapshot<Map<String, dynamic>>?> _userFuture;
  @override
  void initState() {
    super.initState();
    _userFuture = context.read<UsersService>().getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      future: _userFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        }
        final data = snapshot.data!.data();
        return Drawer(
          width: 270,
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0),
              border: Border.all(color: Color(0xFFE6E6E6), width: 1),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.add_task_rounded,
                          color: Color(0xFF6F0606),
                          size: 32,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Text('check.io'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () {
                            // TODO: DEPOIS PREENCHER AS INFORMAÇÕES DA PESSOA AO CARREGAR A PÁGINA, DE ACORDO COM O PERFIL LOGADO
                            Navigator.pushNamed(context, 'profile');
                          },
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              // color: FlutterFlowTheme.of(context).accent1,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Color(0xFF6F0606),
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1624561172888-ac93c696e10c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjJ8fHVzZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              12,
                              0,
                              0,
                              0,
                            ),
                            child: InkWell(
                              onTap: () {
                                // TODO: DEPOIS PREENCHER AS INFORMAÇÕES DA PESSOA AO CARREGAR A PÁGINA, DE ACORDO COM O PERFIL LOGADO
                                Navigator.pushNamed(context, 'profile');
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data?['userName']),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      4,
                                      0,
                                      0,
                                    ),
                                    child: Text(data?['email']),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 12, thickness: 2),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                          child: Text('Configurações Gerais'),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.pushNamed(context, 'profile');
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              width: double.infinity,
                              height: 44,
                              decoration: BoxDecoration(
                                // color: FlutterFlowTheme.of(
                                //   context,
                                // ).primaryBackground,
                                borderRadius: BorderRadius.circular(12),
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  8,
                                  0,
                                  8,
                                  0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.settings_sharp,
                                      // color: FlutterFlowTheme.of(
                                      //   context,
                                      // ).primaryText,
                                      size: 24,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          12,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: Text('Editar Perfil'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
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
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                            0.5,
                                        child: NewPassword(),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              width: double.infinity,
                              height: 44,
                              decoration: BoxDecoration(
                                // color: FlutterFlowTheme.of(
                                //   context,
                                // ).primaryBackground,
                                borderRadius: BorderRadius.circular(12),
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  8,
                                  0,
                                  8,
                                  0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.forum_rounded,
                                      // color: FlutterFlowTheme.of(
                                      //   context,
                                      // ).primaryText,
                                      size: 24,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          12,
                                          0,
                                          0,
                                          0,
                                        ),
                                        child: Text('Mudar Senha'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            width: double.infinity,
                            height: 44,
                            decoration: BoxDecoration(
                              // color: FlutterFlowTheme.of(context).primaryBackground,
                              borderRadius: BorderRadius.circular(12),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                8,
                                0,
                                8,
                                0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.g_translate,
                                    // color: FlutterFlowTheme.of(context).primaryText,
                                    size: 24,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        12,
                                        0,
                                        0,
                                        0,
                                      ),
                                      child: Text('Idioma'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                          child: Text('Informações'),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            width: double.infinity,
                            height: 44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                8,
                                0,
                                8,
                                0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.phone_iphone,
                                    // color: FlutterFlowTheme.of(context).primaryText,
                                    size: 24,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        12,
                                        0,
                                        0,
                                        0,
                                      ),
                                      child: Text('Sobre o App'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            width: double.infinity,
                            height: 44,
                            decoration: BoxDecoration(
                              // color: FlutterFlowTheme.of(context).primaryBackground,
                              borderRadius: BorderRadius.circular(12),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                8,
                                0,
                                8,
                                0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.edit_document,
                                    // color: FlutterFlowTheme.of(context).primaryText,
                                    size: 24,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        12,
                                        0,
                                        0,
                                        0,
                                      ),
                                      child: Text('Termos & Condições'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            width: double.infinity,
                            height: 44,
                            decoration: BoxDecoration(
                              // color: FlutterFlowTheme.of(context).primaryBackground,
                              borderRadius: BorderRadius.circular(12),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                8,
                                0,
                                8,
                                0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.privacy_tip_rounded,
                                    // color: FlutterFlowTheme.of(context).primaryText,
                                    size: 24,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        12,
                                        0,
                                        0,
                                        0,
                                      ),
                                      child: Text('Polí­tica de Privacidade'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            width: double.infinity,
                            height: 44,
                            decoration: BoxDecoration(
                              // color: FlutterFlowTheme.of(context).primaryBackground,
                              borderRadius: BorderRadius.circular(12),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                8,
                                0,
                                8,
                                0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.share,
                                    // color: FlutterFlowTheme.of(context).primaryText,
                                    size: 24,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        12,
                                        0,
                                        0,
                                        0,
                                      ),
                                      child: Text('Compartilhar App'),
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
                  Divider(
                    height: 12,
                    thickness: 2,
                    // color: FlutterFlowTheme.of(context).alternate,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.menu_open_rounded,
                            // color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
