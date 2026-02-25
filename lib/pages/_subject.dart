import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instituto_braziel/components/_teacher_card.dart';
import 'package:instituto_braziel/models/_teacher_model.dart';
import 'package:instituto_braziel/services/users_service.dart';
import 'package:provider/provider.dart';

class Subject extends StatefulWidget {
  const Subject({super.key});
  @override
  State<Subject> createState() => _Subject();
}

class _Subject extends State<Subject> {
  List<TeacherModel> filteredTeacher = [];
  late Future<QuerySnapshot<Map<String, dynamic>>?> _usersFuture;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String subjectName =
        ModalRoute.of(context)!.settings.arguments as String;
    String searchText = "";
    _usersFuture = context.read<UsersService>().getUsers(
      userType: 'professor',
      subject: subjectName,
    );
    return FutureBuilder<QuerySnapshot<Map<String, dynamic>>?>(
      future: _usersFuture,
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

        // if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
        //   return const Scaffold(body: Center(child: Text('No teachers found')));
        // }

        // ✅ Convert Firestore docs into TeacherModel list
        var teachers = snapshot.data!.docs
            .map((doc) => TeacherModel.fromMap(doc.id, doc.data()))
            .toList();

        // ✅ Initialize filtered list only once
        if (searchText.isEmpty) {
          filteredTeacher = teachers;
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF6F0606),
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'subjects');
              },
              icon: Icon(Icons.arrow_back, color: Colors.white),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
            title: Text(subjectName, style: TextStyle(color: Colors.white)),
          ),
          body: Column(
            children: [
              Container(
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
                  ),
                ),
                child: Align(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 32, 5, 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                searchText = value;

                                filteredTeacher = teachers.where((teacher) {
                                  return teacher.name.toLowerCase().contains(
                                    value.toLowerCase(),
                                  );
                                  // teacher.subject.toLowerCase().contains(
                                  //   value.toLowerCase(),
                                  // );
                                }).toList();
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  12,
                                ), // Sets the border radius
                              ),
                              hintText: 'BUSCAR PROFESSOR(A)',
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment(0, -1),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.9, 0),
                          child: Text(
                            'PROFESSORES',
                            style: TextStyle(
                              color: Color(0xFF6F0606),
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        !snapshot.hasData || snapshot.data!.docs.isEmpty
                            ? Text(
                                'Nenhum professor encontrado!',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                              )
                            : Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  20,
                                  0,
                                  20,
                                  0,
                                ),
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics:
                                      NeverScrollableScrollPhysics(), // important if nested
                                  itemCount: filteredTeacher.length,
                                  itemBuilder: (context, index) {
                                    final teacher = filteredTeacher[index];
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 12,
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {},
                                        child: Container(
                                          height: 113.2,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF06223A),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            border: Border.all(
                                              color: Color(0xFFE6E6E6),
                                            ),
                                          ),
                                          child: TeacherCard(
                                            teacher:
                                                teacher, // <-- pass data here
                                          ),
                                        ),
                                      ),
                                    );
                                  },
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
      },
    );
  }
}
