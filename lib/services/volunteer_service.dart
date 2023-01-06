import 'package:anaaj/models/volunteer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VolunteerService {
  VolunteerService._private();

  static VolunteerService instance = VolunteerService._private();

  Future<Volunteer> fetchAvailableVolunteer() async {
    final availableVolunteers = await FirebaseFirestore.instance
        .collection('volunteers')
        .where(
          "isAvailable",
          isEqualTo: true,
        )
        .get();

    final rawVolunteerData = availableVolunteers.docs.first.data();
    final parsedVolunteer = Volunteer.fromJson(rawVolunteerData);
    return parsedVolunteer;
  }
}
