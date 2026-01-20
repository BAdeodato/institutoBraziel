import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Teacher extends StatefulWidget {
  const Teacher({super.key});
  @override
  State<Teacher> createState() => _Teacher();
}

class _Teacher extends State<Teacher> {
  DateTime _focusedDay = DateTime.now();
  late DateTime _currentWeekStart;
  String? selectedOption;

  DateTime startOfWeek(DateTime date) {
    return DateTime(
      date.year,
      date.month,
      date.day - (date.weekday - DateTime.monday),
    );
  }

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _focusedDay = now;
    _currentWeekStart = startOfWeek(now);
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6F0606),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            // Navigator.pushNamed(context, 'home');
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.95,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(width: 20),
                          Container(
                            width: 90,
                            height: 90,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: Image.network(
                              'https://picsum.photos/seed/603/600',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 20),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text('Nome professor'), Text('SÉRIE')],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Divider(thickness: 2),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('PERFIL'),
                            SizedBox(width: 300),
                            Icon(Icons.arrow_forward_ios, size: 24),
                          ],
                        ),
                      ],
                    ),
                    Divider(thickness: 2),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AVALIAÇÕES'),
                        SizedBox(width: 260),
                        Icon(Icons.arrow_forward_ios, size: 24),
                      ],
                    ),
                    Divider(thickness: 2),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.star, size: 24, color: Colors.amberAccent),
                        Text('n° (qtd)'),
                      ],
                    ),
                    Divider(thickness: 2),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('PACOTES')],
                    ),
                    Container(
                      child: RadioGroup<String>(
                        groupValue: selectedOption,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedOption = newValue;
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                title: Text(
                                  'AVULSO',
                                  style: TextStyle(color: Color(0xFF06223a),fontSize: 13, fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text('(1 HR/AULA)\n', style: TextStyle(fontSize: 10)),
                                value: 'a',
                                activeColor: Color(0xFF06223a),
                                fillColor: WidgetStatePropertyAll(
                                  Color(0xFF06223a),
                                ),
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<String>(
                                title: Text(
                                  'MENSAL',
                                  style: TextStyle(color: Color(0xFF06223a),fontSize: 13, fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text('(8 HRS/AULA) \n(1 MÊS)', style: TextStyle(fontSize: 10),),
                                value: 'm',
                                activeColor: Color(0xFF06223a),
                                fillColor: WidgetStatePropertyAll(
                                  Color(0xFF06223a),
                                ),
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<String>(
                                title: Text(
                                  'SEMESTRAL',
                                  style: TextStyle(color: Color(0xFF06223a),fontSize: 13, fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text('(18 HRS/AULA) \n(6 MÊS)', style: TextStyle(fontSize: 10),),
                                value: 's',
                                activeColor: Color(0xFF06223a),
                                fillColor: WidgetStatePropertyAll(
                                  Color(0xFF06223a),
                                ),
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TableCalendar(
                      focusedDay: _focusedDay,
                      locale: 'pt_BR',
                      firstDay: _currentWeekStart,
                      lastDay: DateTime.utc(2030, 3, 14),
                      calendarFormat: CalendarFormat.week,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      availableCalendarFormats: {CalendarFormat.week: 'Week'},
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                          color: Color(0xFF6F0606),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: GridView(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 60,
                                childAspectRatio: 1,
                              ),
                          scrollDirection: Axis.vertical,
                          children: [
                            Container(
                              width: 0,
                              height: 12.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text('09:00'),
                              ),
                            ),
                            Container(
                              width: 0,
                              height: 12.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text('09:30'),
                              ),
                            ),
                            Container(
                              width: 0,
                              height: 12.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Color(0xFF06223A)),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  '10:00',
                                  style: TextStyle(color: Color(0xFF06223A)),
                                ),
                              ),
                            ),
                            Container(
                              width: 0,
                              height: 12.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Color(0xFF06223A)),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  '10:30',
                                  style: TextStyle(color: Color(0xFF06223A)),
                                ),
                              ),
                            ),
                            Container(
                              width: 0,
                              height: 12.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Color(0xFF06223A)),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  '11:00',
                                  style: TextStyle(color: Color(0xFF06223A)),
                                ),
                              ),
                            ),
                            Container(
                              width: 0,
                              height: 12.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Color(0xFF06223A)),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  '11:30',
                                  style: TextStyle(color: Color(0xFF06223A)),
                                ),
                              ),
                            ),
                            Container(
                              width: 0,
                              height: 12.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text('12:00'),
                              ),
                            ),
                            Container(
                              width: 0,
                              height: 12.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Color(0xFF06223A)),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  '13:00',
                                  style: TextStyle(color: Color(0xFF06223A)),
                                ),
                              ),
                            ),
                            Container(
                              width: 0,
                              height: 12.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Color(0xFF06223A)),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  '13:30',
                                  style: TextStyle(color: Color(0xFF06223A)),
                                ),
                              ),
                            ),
                            Container(
                              width: 0,
                              height: 12.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Color(0xFF06223A)),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  '14:00',
                                  style: TextStyle(color: Color(0xFF06223A)),
                                ),
                              ),
                            ),
                            Container(
                              width: 0,
                              height: 12.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text('14:30'),
                              ),
                            ),
                            Container(
                              width: 0,
                              height: 12.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text('15:00'),
                              ),
                            ),
                            Container(
                              width: 0,
                              height: 12.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text('15:30'),
                              ),
                            ),
                            Container(
                              width: 0,
                              height: 12.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Color(0xFF06223A)),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  '16:00',
                                  style: TextStyle(color: Color(0xFF06223A)),
                                ),
                              ),
                            ),
                            Container(
                              width: 0,
                              height: 12.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Color(0xFF06223A)),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  '16:30',
                                  style: TextStyle(color: Color(0xFF06223A)),
                                ),
                              ),
                            ),
                            Container(
                              width: 0,
                              height: 12.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text('17:00'),
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
        ),
      ),
    );
  }
}
