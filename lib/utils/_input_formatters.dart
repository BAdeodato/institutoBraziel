import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppInputFormatters {
  AppInputFormatters._(); // private constructor (no instances)

  static MaskTextInputFormatter phone() {
    return MaskTextInputFormatter(
      mask: '(##)#####-####',
      filter: {"#": RegExp(r'[0-9]')},
    );
  }

  static MaskTextInputFormatter cpf() {
    return MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {"#": RegExp(r'[0-9]')},
    );
  }

  static MaskTextInputFormatter date() {
    return MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
    );
  }

  static String formatPhone(String phone) {
    if (phone.length == 11) {
      return '(${phone.substring(0, 2)}) '
          '${phone.substring(2, 7)}-'
          '${phone.substring(7)}';
    }
    return phone;
  }

  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe a data';
    }

    final regex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
    if (!regex.hasMatch(value)) {
      return 'Formato inválido ($value)';
    }

    final parts = value.split('/');
    final day = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final year = int.parse(parts[2]);

    try {
      final date = DateTime(year, month, day);

      // Dart auto-corrects invalid dates, so we must re-check
      if (date.day != day || date.month != month || date.year != year) {
        return 'Data inválida';
      }

      return null;
    } catch (_) {
      return 'Data inválida';
    }
  }

  static String? validateCPF(String? cpf) {
    if (cpf == null || cpf.isEmpty) {
      return 'Informe o CPF';
    }

    // Remove mask
    final cleanCpf = cpf.replaceAll(RegExp(r'[^0-9]'), '');

    // Must have 11 digits
    if (cleanCpf.length != 11) {
      return 'CPF inválido';
    }

    // Reject repeated digits (00000000000, 11111111111, etc)
    if (RegExp(r'^(\d)\1{10}$').hasMatch(cleanCpf)) {
      return 'CPF inválido';
    }

    final digits = cleanCpf.split('').map(int.parse).toList();

    // Validate first digit
    int sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += digits[i] * (10 - i);
    }
    int firstVerifier = (sum * 10) % 11;
    if (firstVerifier == 10) firstVerifier = 0;

    if (digits[9] != firstVerifier) {
      return 'CPF inválido';
    }

    // Validate second digit
    sum = 0;
    for (int i = 0; i < 10; i++) {
      sum += digits[i] * (11 - i);
    }
    int secondVerifier = (sum * 10) % 11;
    if (secondVerifier == 10) secondVerifier = 0;

    if (digits[10] != secondVerifier) {
      return 'CPF inválido';
    }

    return null;
  }

  static bool isUnder18(DateTime birthDate) {
    final today = DateTime.now();

    int age = today.year - birthDate.year;

    // If birthday hasn’t happened yet this year, subtract 1
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age < 18;
  }

  static bool isUnder18FromString(String birth) {
    try {
      final parts = birth.split('/');
      if (parts.length != 3) return true;

      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);

      final birthDate = DateTime(year, month, day);
      return isUnder18(birthDate);
    } catch (_) {
      // Invalid date → treat as under 18 or block submission
      return true;
    }
  }
}
