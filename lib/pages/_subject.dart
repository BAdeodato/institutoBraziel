import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class Subject extends StatefulWidget {
  const Subject({super.key});
  @override
  State<Subject> createState() => _Subject();
}

class _Subject extends State<Subject> {
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
                                                  clipBehavior: Clip.antiAlias,
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 20),
                                                    Text(
                                                      'PROF. 1',
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        Text(
                                                          '(25 Feedbacks)',
                                                          style: TextStyle(
                                                            color: Colors.white,
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
    );
  }
}
