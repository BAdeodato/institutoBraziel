import 'package:flutter/material.dart';

class Subjects extends StatefulWidget {
  const Subjects({super.key});
  @override
  State<Subjects> createState() => _Subjects();
}

class _Subjects extends State<Subjects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6F0606),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, 'home');
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
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
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        12,
                                      ), // Sets the border radius
                                    ),
                                    hintText: 'BUSCAR DISCIPLINA',
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
                        'DISCIPLINAS',
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
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 1,
                                ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              InkWell(
                                // Match the container radius for the ripple
                                onTap: () {
                                  // Navigating and passing the string as an argument
                                  Navigator.pushNamed(
                                    context,
                                    'subject',
                                    arguments: 'PORTUGUÊS',
                                  );
                                },
                                child: Container(
                                  // Your original decoration
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF06223A),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: const Color(0xFFE6E6E6),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Icon(
                                        Icons.import_contacts,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      const Text(
                                        'PORTUGUÊS',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                // Match the container radius for the ripple
                                onTap: () {
                                  // Navigating and passing the string as an argument
                                  Navigator.pushNamed(
                                    context,
                                    'subject',
                                    arguments: 'MATEMÁTICA',
                                  );
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
                                        Icons.calculate,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      Text(
                                        'MATEMÁTICA',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                // Match the container radius for the ripple
                                onTap: () {
                                  // Navigating and passing the string as an argument
                                  Navigator.pushNamed(
                                    context,
                                    'subject',
                                    arguments: 'CIÊNICAS',
                                  );
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
                                        Icons.biotech,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      Text(
                                        'CIÊNCIAS',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                // Match the container radius for the ripple
                                onTap: () {
                                  // Navigating and passing the string as an argument
                                  Navigator.pushNamed(
                                    context,
                                    'subject',
                                    arguments: 'HISTÓRIA',
                                  );
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
                                        Icons.history_edu,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      Text(
                                        'HISTÓRIA',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                // Match the container radius for the ripple
                                onTap: () {
                                  // Navigating and passing the string as an argument
                                  Navigator.pushNamed(
                                    context,
                                    'subject',
                                    arguments: 'GEOGRAFIA',
                                  );
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
                                        Icons.explore,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      Text(
                                        'GEOGRAFIA',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                // Match the container radius for the ripple
                                onTap: () {
                                  // Navigating and passing the string as an argument
                                  Navigator.pushNamed(
                                    context,
                                    'subject',
                                    arguments: 'QUÍMICA',
                                  );
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
                                        Icons.co2,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      Text(
                                        'QUÍMICA',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                // Match the container radius for the ripple
                                onTap: () {
                                  // Navigating and passing the string as an argument
                                  Navigator.pushNamed(
                                    context,
                                    'subject',
                                    arguments: 'FÍSICA',
                                  );
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
                                        Icons.rocket,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      Text(
                                        'FÍSICA',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                // Match the container radius for the ripple
                                onTap: () {
                                  // Navigating and passing the string as an argument
                                  Navigator.pushNamed(
                                    context,
                                    'subject',
                                    arguments: 'LITERATURA',
                                  );
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
                                        Icons.menu_book_outlined,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      Text(
                                        'LITERATURA',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                // Match the container radius for the ripple
                                onTap: () {
                                  // Navigating and passing the string as an argument
                                  Navigator.pushNamed(
                                    context,
                                    'subject',
                                    arguments: 'REDAÇÃO',
                                  );
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
                                        Icons.edit_note,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      Text(
                                        'REDAÇÃO',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                // Match the container radius for the ripple
                                onTap: () {
                                  // Navigating and passing the string as an argument
                                  Navigator.pushNamed(
                                    context,
                                    'subject',
                                    arguments: 'FILOSOFIA',
                                  );
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
                                        Icons.question_mark,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      Text(
                                        'FILOSOFIA',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                // Match the container radius for the ripple
                                onTap: () {
                                  // Navigating and passing the string as an argument
                                  Navigator.pushNamed(
                                    context,
                                    'subject',
                                    arguments: 'SOCIOLOGIA',
                                  );
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
                                        Icons.diversity_2,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      Text(
                                        'SOCIOLOGIA',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                // Match the container radius for the ripple
                                onTap: () {
                                  // Navigating and passing the string as an argument
                                  Navigator.pushNamed(
                                    context,
                                    'subject',
                                    arguments: 'INGLÊS',
                                  );
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
                                        Icons.translate,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      Text(
                                        'INGLÊS',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                // Match the container radius for the ripple
                                onTap: () {
                                  // Navigating and passing the string as an argument
                                  Navigator.pushNamed(
                                    context,
                                    'subject',
                                    arguments: 'REFORÇO',
                                  );
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
                                        Icons.quiz,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      Text(
                                        'REFORÇO',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                // Match the container radius for the ripple
                                onTap: () {
                                  // Navigating and passing the string as an argument
                                  Navigator.pushNamed(
                                    context,
                                    'subject',
                                    arguments: 'LIBRAS',
                                  );
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
                                        Icons.sign_language,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      Text(
                                        'LIBRAS',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                // Match the container radius for the ripple
                                onTap: () {
                                  // Navigating and passing the string as an argument
                                  Navigator.pushNamed(
                                    context,
                                    'subject',
                                    arguments: 'MULTIDISCIPLINA',
                                  );
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
                                        Icons.subject,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      Text(
                                        'MULTIDISCIPLINA',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 8,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                // Match the container radius for the ripple
                                onTap: () {
                                  // Navigating and passing the string as an argument
                                  Navigator.pushNamed(
                                    context,
                                    'subject',
                                    arguments: 'ALFABETIZAÇÃO',
                                  );
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
                                        Icons.abc,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      Text(
                                        'ALFABATIZAÇÃO',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 8,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
