import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instituto_braziel/services/auth_service.dart';
import 'package:instituto_braziel/services/users_service.dart';
import 'package:instituto_braziel/utils/_input_formatters.dart';
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
  late Future<DocumentSnapshot<Map<String, dynamic>>?> _userFuture;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? _selectedImage;
  Uint8List? _webImage;
  String? selectedPeriod;
  bool _initialized = false;

  final List<String> periodList = [
    'teste1',
    'teste2',
    'teste3',
    'teste4',
    'teste5',
  ];

  Future<void> _pickImage() async {
    final picker = ImagePicker();

    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (picked == null) return;

    if (kIsWeb) {
      final bytes = await picked.readAsBytes();
      setState(() {
        _webImage = bytes;
        _selectedImage = null;
      });
    } else {
      setState(() {
        _selectedImage = File(picked.path);
        _webImage = null;
      });
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
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      future: _userFuture,
      builder: (context, snapshot) {
        final uid = FirebaseAuth.instance.currentUser!.uid;
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
        bool switchValue = data?['over18'] ?? false;
        if (!_initialized) {
          selectedPeriod = data?['period'];
          _initialized = true;
        }
        final TextEditingController subject = TextEditingController(
          text: data?['subject'] ?? '',
        );
        final TextEditingController school = TextEditingController(
          text: data?['school'] ?? '',
        );
        final TextEditingController schoolYear = TextEditingController(
          text: data?['schoolYear'] ?? '',
        );
        final TextEditingController relativesName = TextEditingController(
          text: data?['relativesName'] ?? '',
        );
        final TextEditingController relativesPhone = TextEditingController(
          text: data?['relativesPhone'] ?? '',
        );
        final TextEditingController relativesBirth = TextEditingController(
          text: data?['relativesBirth'] ?? '',
        );
        final TextEditingController relativesEmail = TextEditingController(
          text: data?['relativesEmail'] ?? '',
        );
        final TextEditingController relativesCpf = TextEditingController(
          text: data?['relativesId'] ?? '',
        );
        final TextEditingController birth = TextEditingController(
          text: data?['birth'] ?? '',
        );
        final TextEditingController cpf = TextEditingController(
          text: data?['id'] ?? '',
        );
        final TextEditingController phone = TextEditingController(
          text: AppInputFormatters.formatPhone(data?['phone'] ?? ''),
        );
        final TextEditingController email = TextEditingController(
          text: data?['email'] ?? '',
        );
        final TextEditingController userName = TextEditingController(
          text: data?['userName'] ?? '',
        );

        Widget _defaultAvatar() {
          return Container(
            color: Colors.grey.shade200,
            child: const Icon(Icons.person, size: 60, color: Color(0xFF6F0606)),
          );
        }

        Widget _buildProfileImage(Map<String, dynamic>? data) {
          if (_webImage != null) {
            return Image.memory(_webImage!, fit: BoxFit.cover);
          }

          if (_selectedImage != null) {
            return Image.file(_selectedImage!, fit: BoxFit.cover);
          }

          final photoUrl = data?['photoUrl'];

          if (photoUrl != null && photoUrl.isNotEmpty) {
            return Image.network(
              photoUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => _defaultAvatar(),
            );
          }

          return _defaultAvatar();
        }

        return Scaffold(
          // backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: Color(0xFF6F0606),
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
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
            child: Column(
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
                              child: InkWell(
                                onTap: _pickImage,
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
                                      child: _buildProfileImage(data),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            16,
                            24,
                            16,
                            0,
                          ),
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
                        SizedBox(height: 10),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
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
                                          controller: userName,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Usuário',
                                            alignLabelWithHint: false,
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              borderSide: BorderSide(),
                                            ),
                                            prefixIcon: Icon(Icons.person),
                                          ),
                                          keyboardType: TextInputType.text,
                                        ),
                                      ),
                                    ),
                                    data?['userType'] == 'professor'
                                        ? Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                  0,
                                                  0,
                                                  0,
                                                  16,
                                                ),

                                            child: SizedBox(
                                              width: double.infinity,
                                              child: TextFormField(
                                                controller: subject,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Matéria',
                                                  alignLabelWithHint: false,
                                                  filled: true,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          30.0,
                                                        ),
                                                    borderSide: BorderSide(),
                                                  ),
                                                  prefixIcon: Icon(Icons.abc),
                                                ),
                                                keyboardType:
                                                    TextInputType.text,
                                              ),
                                            ),
                                          )
                                        : SizedBox.shrink(),
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
                                          controller: fullName,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Nome completo',
                                            alignLabelWithHint: false,
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              borderSide: BorderSide(),
                                            ),
                                            prefixIcon: Icon(Icons.person),
                                          ),
                                          keyboardType: TextInputType.text,
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
                                          controller: birth,
                                          inputFormatters: [
                                            AppInputFormatters.date(),
                                          ],
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Data de nascimento',
                                            alignLabelWithHint: false,
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              borderSide: BorderSide(),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.calendar_month,
                                            ),
                                          ),
                                          keyboardType: TextInputType.datetime,
                                          validator:
                                              AppInputFormatters.validateDate,
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
                                          controller: phone,
                                          inputFormatters: [
                                            AppInputFormatters.phone(),
                                          ],
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Telefone',
                                            alignLabelWithHint: false,
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              borderSide: BorderSide(),
                                            ),
                                            prefixIcon: Icon(Icons.phone),
                                          ),
                                          keyboardType: TextInputType.phone,
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
                                          controller: email,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Email',
                                            alignLabelWithHint: false,
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
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
                                          controller: cpf,
                                          inputFormatters: [
                                            AppInputFormatters.cpf(),
                                          ],
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'CPF',
                                            alignLabelWithHint: false,
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              borderSide: BorderSide(),
                                            ),
                                            prefixIcon: Icon(
                                              FontAwesomeIcons.idCard,
                                            ),
                                          ),
                                          keyboardType: TextInputType.number,
                                          validator:
                                              AppInputFormatters.validateCPF,
                                        ),
                                      ),
                                    ),
                                    data?['userType'] == 'professor'
                                        ? Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                  0,
                                                  0,
                                                  0,
                                                  16,
                                                ),
                                            child:
                                                DropdownButtonFormField<String>(
                                                  initialValue: selectedPeriod,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        'Selecione uma série',
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12,
                                                          ),
                                                    ),
                                                  ),
                                                  items: periodList.map((
                                                    subject,
                                                  ) {
                                                    return DropdownMenuItem<
                                                      String
                                                    >(
                                                      value: subject,
                                                      child: Text(subject),
                                                    );
                                                  }).toList(),
                                                  onChanged: (value) async {
                                                    setState(() {
                                                      selectedPeriod = value;
                                                    });
                                                  },
                                                ),
                                          )
                                        : SizedBox.shrink(),
                                    data?['userType'] == 'aluno'
                                        ? Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                      0,
                                                      0,
                                                      0,
                                                      16,
                                                    ),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: TextFormField(
                                                    controller: school,
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: 'Escola',
                                                      alignLabelWithHint: false,
                                                      filled: true,
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              30.0,
                                                            ),
                                                        borderSide:
                                                            BorderSide(),
                                                      ),
                                                      prefixIcon: Icon(
                                                        FontAwesomeIcons.school,
                                                      ),
                                                    ),
                                                    keyboardType:
                                                        TextInputType.text,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                      0,
                                                      0,
                                                      0,
                                                      16,
                                                    ),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: TextFormField(
                                                    controller: schoolYear,
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: 'Ano Letivo',
                                                      alignLabelWithHint: false,
                                                      filled: true,
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              30.0,
                                                            ),
                                                        borderSide:
                                                            BorderSide(),
                                                      ),
                                                      prefixIcon: Icon(
                                                        Icons
                                                            .onetwothree_outlined,
                                                      ),
                                                    ),
                                                    keyboardType:
                                                        TextInputType.number,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                16,
                                                0,
                                                16,
                                                16,
                                              ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                      0,
                                                      0,
                                                      0,
                                                      16,
                                                    ),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: TextFormField(
                                                    controller: relativesName,
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Nome completo responsável',
                                                      alignLabelWithHint: false,
                                                      filled: true,
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              30.0,
                                                            ),
                                                        borderSide:
                                                            BorderSide(),
                                                      ),
                                                      prefixIcon: Icon(
                                                        Icons.person,
                                                      ),
                                                    ),
                                                    keyboardType:
                                                        TextInputType.text,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                      0,
                                                      0,
                                                      0,
                                                      16,
                                                    ),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: TextFormField(
                                                    controller: relativesBirth,
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Data de nascimento responsável',
                                                      alignLabelWithHint: false,
                                                      filled: true,
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              30.0,
                                                            ),
                                                        borderSide:
                                                            BorderSide(),
                                                      ),
                                                      prefixIcon: Icon(
                                                        Icons.calendar_month,
                                                      ),
                                                    ),
                                                    keyboardType:
                                                        TextInputType.datetime,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                      0,
                                                      0,
                                                      0,
                                                      16,
                                                    ),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: TextFormField(
                                                    controller: relativesPhone,
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Telefone responsável',
                                                      alignLabelWithHint: false,
                                                      filled: true,
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              30.0,
                                                            ),
                                                        borderSide:
                                                            BorderSide(),
                                                      ),
                                                      prefixIcon: Icon(
                                                        Icons.phone,
                                                      ),
                                                    ),
                                                    keyboardType:
                                                        TextInputType.phone,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                      0,
                                                      0,
                                                      0,
                                                      16,
                                                    ),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: TextFormField(
                                                    controller: relativesEmail,
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Email responsável',
                                                      alignLabelWithHint: false,

                                                      filled: true,
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              30.0,
                                                            ),
                                                        borderSide:
                                                            BorderSide(),
                                                      ),
                                                      prefixIcon: Icon(
                                                        Icons.email,
                                                      ),
                                                    ),
                                                    keyboardType: TextInputType
                                                        .emailAddress,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                      0,
                                                      0,
                                                      0,
                                                      16,
                                                    ),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: TextFormField(
                                                    controller: relativesCpf,
                                                    autofocus: true,
                                                    obscureText: false,
                                                    inputFormatters: [
                                                      AppInputFormatters.cpf(),
                                                    ],
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'CPF responsável',
                                                      alignLabelWithHint: false,
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              30.0,
                                                            ),
                                                        borderSide:
                                                            BorderSide(),
                                                      ),
                                                      filled: true,
                                                      prefixIcon: Icon(
                                                        FontAwesomeIcons.idCard,
                                                      ),
                                                    ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    validator:
                                                        AppInputFormatters
                                                            .validateCPF,
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  16,
                                  0,
                                  16,
                                  24,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Declaro ser maior de 18 anos e responsável \npela gestão dos meus estudos.',
                                    ),
                                    SizedBox(width: 50),
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
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                          child: OutlinedButton(
                            onPressed: () async {
                              if (!formKey.currentState!.validate()) return;
                              if (switchValue == false &&
                                  AppInputFormatters.isUnder18FromString(
                                        birth.text,
                                      ) ==
                                      false) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Favor selecionar a opção "maior de 18 anos"!',
                                    ),
                                  ),
                                );
                              }
                              try {
                                String? photoUrl;

                                final ref = FirebaseStorage.instance
                                    .ref()
                                    .child('profile_images')
                                    .child('$uid.jpg');

                                if (_selectedImage != null) {
                                  // MOBILE
                                  await ref.putFile(_selectedImage!);
                                  photoUrl = await ref.getDownloadURL();
                                } else if (_webImage != null) {
                                  // WEB
                                  await ref.putData(_webImage!);
                                  photoUrl = await ref.getDownloadURL();
                                }
                                await context.read<UsersService>().update(
                                  birth: birth.text,
                                  fullName: fullName.text,
                                  subject: subject.text,
                                  school: school.text,
                                  schoolYear: schoolYear.text,
                                  relativesName: relativesName.text,
                                  relativesPhone: relativesPhone.text,
                                  relativesBirth: relativesBirth.text,
                                  relativesEmail: relativesEmail.text,
                                  relativesId: relativesCpf.text,
                                  period: selectedPeriod,
                                  photoUrl: photoUrl,
                                  id: cpf.text,
                                  over18: switchValue,
                                  phone: phone.text,
                                  userName: userName.text,
                                );
                                _reloadUser();
                              } on AuthException catch (e) {
                                if (!context.mounted) return;

                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
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
              ],
            ),
          ),
        );
      },
    );
  }
}
