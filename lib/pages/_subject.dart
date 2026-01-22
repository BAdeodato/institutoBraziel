import 'package:flutter/material.dart';
import 'package:instituto_braziel/components/_teacher_card.dart';
import 'package:instituto_braziel/models/_teacher_model.dart';

class Subject extends StatefulWidget {
  const Subject({super.key});
  @override
  State<Subject> createState() => _Subject();
}

class _Subject extends State<Subject> {
  final List<TeacherModel> teachers = [
    TeacherModel(id: '1', name: 'João Silva', subject: 'teacher'),
    TeacherModel(id: '2', name: 'Maria Santos', subject: 'student'),
    TeacherModel(id: '2', name: 'Maria Santos', subject: 'student'),
    TeacherModel(id: '2', name: 'Maria Santos', subject: 'student'),
    TeacherModel(id: '2', name: 'Maria Santos', subject: 'student'),
    TeacherModel(id: '2', name: 'Maria Santos', subject: 'student'),
    TeacherModel(id: '2', name: 'Maria Santos', subject: 'student'),
    TeacherModel(id: '2', name: 'Maria Santos', subject: 'student'),
    TeacherModel(id: '2', name: 'Maria Santos', subject: 'student'),
    TeacherModel(id: '2', name: 'Maria Santos', subject: 'student'),
    TeacherModel(id: '2', name: 'Maria Santos', subject: 'student'),
    TeacherModel(id: '2', name: 'Maria Santos', subject: 'student'),
  ];
  List<TeacherModel> filteredTeacher = [];
  @override
  void initState() {
    super.initState();
    filteredTeacher = List.from(teachers);
  }

  @override
  Widget build(BuildContext context) {
    final String subjectName =
        ModalRoute.of(context)!.settings.arguments as String;
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
      body: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment(0, -1),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
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
                                      filteredTeacher = teachers
                                          .where(
                                            (teacher) =>
                                                teacher.name
                                                    .toLowerCase()
                                                    .contains(
                                                      value.toLowerCase(),
                                                    ) ||
                                                teacher.subject
                                                    .toLowerCase()
                                                    .contains(
                                                      value.toLowerCase(),
                                                    ),
                                          )
                                          .toList();
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics:
                            NeverScrollableScrollPhysics(), // important if nested
                        itemCount: filteredTeacher.length,
                        itemBuilder: (context, index) {
                          final teacher = filteredTeacher[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {},
                              child: Container(
                                height: 113.2,
                                decoration: BoxDecoration(
                                  color: Color(0xFF06223A),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Color(0xFFE6E6E6)),
                                ),
                                child: TeacherCard(
                                  teacher: teacher, // <-- pass data here
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
  }
}
