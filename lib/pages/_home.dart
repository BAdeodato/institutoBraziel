import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:expandable/expandable.dart';
import 'package:instituto_braziel/components/_sidebar.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'BEM VINDO(A)',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        'USUÁRIO',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                child: TextFormField(
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
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: Container(
                              height: 113.2,
                              decoration: BoxDecoration(
                                color: Color(0xFF06223A),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Color(0xFFE6E6E6)),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 1),
                                child: InkWell(
                                  onTap: () {
                                    // Navigating and passing the string as an argument
                                    Navigator.pushNamed(context, 'teacher');
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    color: Color(0x00000000),
                                    child: ExpandableNotifier(
                                      initialExpanded: true,
                                      child: ExpandablePanel(
                                        header: Container(),
                                        collapsed: Container(),
                                        expanded: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                12,
                                                16,
                                                12,
                                                12,
                                              ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 60,
                                                    height: 60,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/941/600',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  SizedBox(width: 20),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(height: 20),
                                                      Text(
                                                        'PROF. 1',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Matemática',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color: Color(
                                                              0xFFF9BD05,
                                                            ),
                                                            size: 24,
                                                          ),
                                                          Text(
                                                            '4.85',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Text(
                                                            '(25 Feedbacks)',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        theme: const ExpandableThemeData(
                                          hasIcon: false,
                                          tapHeaderToExpand: false,
                                          tapBodyToCollapse: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
