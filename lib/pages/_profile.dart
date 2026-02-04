import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instituto_braziel/services/users_service.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  bool switchValue = false;
  late Future<DocumentSnapshot<Map<String, dynamic>>> _userFuture;
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
        final TextEditingController fullName = TextEditingController(
          text: data?['fullName'] ?? '',
        );
        return Scaffold(
          // backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: Color(0xFF6F0606),
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'home');
              },
              icon: Icon(Icons.arrow_back, color: Colors.white),
            ),
            title: Text('Editar seu perfil'),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFF6F0606),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x33000000),
                                offset: Offset(0, 2),
                              ),
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              16,
                              24,
                              16,
                              24,
                            ),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              decoration: BoxDecoration(
                                // color: FlutterFlowTheme.of(context).accent4,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 8,
                                    color: Color(0x36000000),
                                    offset: Offset(0.0, 4),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 200,
                                      height: 200,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'https://picsum.photos/seed/139/600',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          data?['userType'] == 'aluno'
                              ? 'Estudante'
                              : 'Professor',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                              controller: fullName,
                              autofocus: true,
                              autofillHints: [AutofillHints.email],
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Nome completo',
                                alignLabelWithHint: false,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(),
                                ),
                                prefixIcon: Icon(Icons.person),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                              autofocus: true,
                              autofillHints: [AutofillHints.email],
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Data de nascimento',
                                alignLabelWithHint: false,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(),
                                ),
                                prefixIcon: Icon(Icons.calendar_month),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                              autofocus: true,
                              autofillHints: [AutofillHints.email],
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Telefone',
                                alignLabelWithHint: false,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(),
                                ),
                                prefixIcon: Icon(Icons.phone),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                              autofocus: true,
                              autofillHints: [AutofillHints.email],
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                alignLabelWithHint: false,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(),
                                ),
                                prefixIcon: Icon(Icons.email),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                              autofocus: true,
                              autofillHints: [AutofillHints.email],
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'CPF',
                                alignLabelWithHint: false,

                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(),
                                ),
                                prefixIcon: Icon(FontAwesomeIcons.idCard),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ),
                        data?['userType'] == 'aluno'
                            ? Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      0,
                                      0,
                                      16,
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: TextFormField(
                                        autofocus: true,
                                        autofillHints: [AutofillHints.email],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Escola',
                                          alignLabelWithHint: false,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              30.0,
                                            ),
                                            borderSide: BorderSide(),
                                          ),
                                          prefixIcon: Icon(
                                            FontAwesomeIcons.school,
                                          ),
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: TextFormField(
                                        // controller: _model.emailAddressTextController7,
                                        // focusNode: _model.emailAddressFocusNode7,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.email],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Ano Letivo',
                                          alignLabelWithHint: false,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              30.0,
                                            ),
                                            borderSide: BorderSide(),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.onetwothree_outlined,
                                          ),
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ),
                  data?['userType'] == 'aluno'
                      ? Column(
                          children: [
                            Divider(thickness: 2),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                16,
                                24,
                                16,
                                0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [Text('Responsável')],
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                16,
                                0,
                                16,
                                16,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      0,
                                      0,
                                      16,
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: TextFormField(
                                        // controller: _model.emailAddressTextController8,
                                        // focusNode: _model.emailAddressFocusNode8,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.email],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Nome completo',
                                          alignLabelWithHint: false,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              30.0,
                                            ),
                                            borderSide: BorderSide(),
                                          ),
                                          prefixIcon: Icon(Icons.person),
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: TextFormField(
                                        // controller: _model.emailAddressTextController9,
                                        // focusNode: _model.emailAddressFocusNode9,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.email],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Data de nascimento',
                                          alignLabelWithHint: false,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              30.0,
                                            ),
                                            borderSide: BorderSide(),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.calendar_month,
                                          ),
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: TextFormField(
                                        // controller: _model.emailAddressTextController10,
                                        // focusNode: _model.emailAddressFocusNode10,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.email],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Telefone',
                                          alignLabelWithHint: false,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              30.0,
                                            ),
                                            borderSide: BorderSide(),
                                          ),
                                          prefixIcon: Icon(Icons.phone),
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: TextFormField(
                                        // controller: _model.emailAddressTextController11,
                                        // focusNode: _model.emailAddressFocusNode11,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.email],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Email',
                                          alignLabelWithHint: false,

                                          filled: true,
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
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: TextFormField(
                                        // controller: _model.emailAddressTextController12,
                                        // focusNode: _model.emailAddressFocusNode12,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.email],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'CPF',
                                          alignLabelWithHint: false,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              30.0,
                                            ),
                                            borderSide: BorderSide(),
                                          ),
                                          filled: true,
                                          prefixIcon: Icon(
                                            FontAwesomeIcons.idCard,
                                          ),
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : SizedBox.shrink(),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 24),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Declaro ser maior de 18 anos e responsável \npela gestão dos meus estudos.',
                        ),
                        Switch.adaptive(
                          value: switchValue,
                          onChanged: (newValue) async {
                            setState(() {
                              switchValue = newValue;
                            });
                          },
                        ),
                      ],
                    ),
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
                        minimumSize: WidgetStatePropertyAll(Size(250, 50)),
                        side: WidgetStateProperty.all(
                          const BorderSide(color: Colors.transparent),
                        ),
                      ),
                      child: Text(
                        'SALVAR',
                        style: TextStyle(color: Colors.white),
                      ),
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
