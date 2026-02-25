import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:instituto_braziel/models/_teacher_model.dart';
import 'package:instituto_braziel/pages/_teacher.dart';

class TeacherCard extends StatelessWidget {
  final TeacherModel teacher;

  const TeacherCard({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: InkWell(
        onTap: () {
          // Navigating and passing the string as an argument
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => Teacher(teacher: teacher)),
          );
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
                padding: const EdgeInsetsDirectional.fromSTEB(12, 16, 12, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.network(
                            'https://picsum.photos/seed/941/600',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              teacher.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.white),
                            ),
                            // Text(  
                            //   teacher.subject,
                            //   style: TextStyle(color: Colors.white),
                            // ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFF9BD05),
                                  size: 24,
                                ),
                                Text(
                                  '4.85',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  '(25 Feedbacks)',
                                  style: TextStyle(color: Colors.white),
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
    );
  }
}
