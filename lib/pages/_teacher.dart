import 'package:flutter/material.dart';
import 'package:instituto_braziel/models/_teacher_model.dart';
import 'package:table_calendar/table_calendar.dart';

class Teacher extends StatefulWidget {
  final TeacherModel teacher;
  const Teacher({super.key, required this.teacher});
  @override
  State<Teacher> createState() => _Teacher();
}

class _Teacher extends State<Teacher> {
  // TODO: MUDAR ESSA LISTA PARA SER UM MODEL, VISTO QUE A COR DAS HORAS LIVRES DEVEM VARIAR, OU COLOCAR COMO HABILITADO/DESABILITADO
  final List<String> times = [
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
  ];

  // Track which time is selected
  final Set<String> selectedTime = {};
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6F0606),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
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
                          InkWell(
                            onTap: () {
                              // TODO: DEPOIS PREENCHER AS INFORMAÇÕES DA PESSOA AO CARREGAR A PÁGINA, DE ACORDO COM O PERFIL LOGADO
                              Navigator.pushNamed(context, 'profile');
                            },
                            child: Container(
                              width: 90,
                              height: 90,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Image.network(
                                'https://picsum.photos/seed/603/600',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.teacher.name),
                              Text('SÉRIE'),
                              Text(widget.teacher.subject),
                            ],
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // TODO: DEPOIS PREENCHER AS INFORMAÇÕES DA PESSOA AO CARREGAR A PÁGINA, DE ACORDO COM O PERFIL LOGADO
                        Navigator.pushNamed(context, 'profile');
                      },
                      child: Column(
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
                    RadioGroup<String>(
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
                                style: TextStyle(
                                  color: Color(0xFF06223a),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                '(1 HR/AULA)\n',
                                style: TextStyle(fontSize: 10),
                              ),
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
                                style: TextStyle(
                                  color: Color(0xFF06223a),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                '(8 HRS/AULA) \n(1 MÊS)',
                                style: TextStyle(fontSize: 10),
                              ),
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
                                style: TextStyle(
                                  color: Color(0xFF06223a),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                '(18 HRS/AULA) \n(6 MÊS)',
                                style: TextStyle(fontSize: 10),
                              ),
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
                    TableCalendar(
                      focusedDay: _focusedDay,
                      locale: 'pt_BR',
                      firstDay: _currentWeekStart,
                      lastDay: DateTime.utc(2030, 3, 14),
                      calendarFormat: CalendarFormat.week,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      availableCalendarFormats: {CalendarFormat.week: 'Week'},
                      selectedDayPredicate: (day) {
                        return isSameDay(_focusedDay, day);
                      },

                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _focusedDay = focusedDay;
                        });
                      },
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                          color: Color(0xFF6F0606),
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Color(0xFF06223A),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: times.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: 2,
                              ),
                          itemBuilder: (context, index) {
                            final time = times[index];
                            final isSelected = selectedTime.contains(time);

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSelected) {
                                    selectedTime.remove(time); // deselect
                                  } else {
                                    selectedTime.add(time); // select
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Color(0xFF06223A)
                                      : Colors.white,
                                  border: Border.all(color: Color(0xFF06223A)),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  time,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Color(0xFF06223A),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: OutlinedButton(
                        onPressed: () async {
                          // Navigator.pushNamed(context, 'home');
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
                          'CONTINUAR',
                          style: TextStyle(color: Colors.white),
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
