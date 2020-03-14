class Prescription {
  final String time;
  final List<String> medicines;
  Prescription({this.time, this.medicines});
}

List<Prescription> prescriptions = [
  Prescription(
      time: '6:30 am', medicines: ['Synthroid', 'Crestor', 'Ventolin HFA']),
  Prescription(
      time: '7:30 am',
      medicines: ['Nexium', 'Advair Diskus', 'Lantus Solostar']),
  Prescription(
      time: '8:30 am', medicines: ['Vyvanse', 'Lyrica', 'Ventolin HFA']),
  Prescription(time: '9:30 am', medicines: ['Synthroid', 'Crestor', 'Spiriva']),
  Prescription(
      time: '10:30 am',
      medicines: ['Nexium', 'Advair Diskus', 'Lantus Solostar']),
  Prescription(
      time: '2:30 pm', medicines: ['Vyvanse', 'Lyrica', 'Ventolin HFA']),
  Prescription(time: '4:30 am', medicines: ['Synthroid', 'Crestor', 'Spiriva']),
  Prescription(
      time: '6:30 pm', medicines: ['Synthroid', 'Crestor', 'Ventolin HFA']),
];
