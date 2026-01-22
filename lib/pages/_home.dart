import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instituto_braziel/components/_sidebar.dart';
import 'package:instituto_braziel/components/_teacher_card.dart';
import 'package:instituto_braziel/models/_teacher_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<TeacherModel> teachers = [
    TeacherModel(id: '1', name: 'João Silva', subject: 'teacher'),
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
    return Scaffold(
      drawer: Sidebar(),
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
                              Row(
                                children: [
                                  Builder(
                                    builder: (context) {
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          Scaffold.of(context).openDrawer();
                                        },
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            'https://picsum.photos/seed/61/600',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(width: 10),
                                  Builder(
                                    builder: (context) {
                                      return InkWell(
                                        onTap: () async {
                                          Scaffold.of(context).openDrawer();
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'BEM VINDO(A)',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              'USUÁRIO',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      filteredTeacher = teachers.where(
                                        (teacher) =>
                                            teacher.name.toLowerCase().contains(
                                              value.toLowerCase(),
                                            ) ||
                                            teacher.subject.toLowerCase().contains(
                                              value.toLowerCase(),
                                            ),
                                      ).toList();
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
                    SizedBox(height: 20),
                    Align(
                      alignment: AlignmentDirectional(-0.9, 0),
                      child: Text(
                        'SERVIÇOS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6F0606),
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: GridView(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 1,
                                ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              InkWell(
                                onTap: () {
                                  // Navigating and passing the string as an argument
                                  Navigator.pushNamed(context, 'subjects');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF06223A),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Color(0xFFE6E6E6),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.computer,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      Text(
                                        'Online',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF06223A),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Color(0xFFE6E6E6)),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.groups_2_rounded,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    Text(
                                      'Presencial',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF06223A),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Color(0xFFE6E6E6)),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.solidComments,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    Text(
                                      'Chat',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF06223A),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Color(0xFFE6E6E6)),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.attach_money_rounded,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    Text(
                                      'Financeiro',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                // Match the container radius for the ripple
                                onTap: () {
                                  // Navigating and passing the string as an argument
                                  // Navigator.pushNamed(context, 'subjects');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF06223A),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Color(0xFFE6E6E6),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.graduationCap,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      Text(
                                        'Cursos',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF06223A),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Color(0xFFE6E6E6)),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.check_sharp,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    Text(
                                      'Minhas Aulas',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: AlignmentDirectional(-0.9, 0),
                      child: Text(
                        'TOP PROFESSORES',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        backgroundColor: Color(0xFF6F0606),
        shape: const CircleBorder(), // Matching your theme color
        child: Icon(Icons.logout, color: Colors.white),
      ),
    );
  }
}
