import 'package:flutter/material.dart';
import 'package:instituto_braziel/components/_rating_card.dart';

class SummaryPayment extends StatefulWidget {
  const SummaryPayment({super.key});
  @override
  State<SummaryPayment> createState() => _SummaryPayment();
}

class _SummaryPayment extends State<SummaryPayment> {
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
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFE6E6E6)),
        ),
        child: Align(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(32, 32, 32, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      // TODO: DEPOIS PREENCHER AS INFORMAÇÕES DA PESSOA AO CARREGAR A PÁGINA, DE ACORDO COM O PERFIL LOGADO
                      Navigator.pushNamed(context, 'home');
                    },
                    child: Container(
                      width: 90,
                      height: 90,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset(
                        'assets/images/logo-transparent.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
