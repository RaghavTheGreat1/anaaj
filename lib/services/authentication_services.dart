import 'package:anaaj/models/donor_instituition.dart';
import 'package:anaaj/models/receiver_instituition.dart';
import 'package:anaaj/models/volunteer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationServices {
  Future<UserCredential> createDonorInstituition(
      DonorInstituition donorInstituition, String password) async {
    UserCredential credentials =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: donorInstituition.emailAddress,
      password: password,
    );
    DonorInstituition donor =
        donorInstituition.copyWith(id: credentials.user!.uid);
    await FirebaseFirestore.instance
        .collection('donor_instituitions')
        .doc(donor.id)
        .set(donor.toJson());

    return credentials;
  }

  Future<UserCredential> createReceiverInstituition(
      ReceiverInstituition receiverInstituition, String password) async {
    UserCredential credentials =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: receiverInstituition.emailAddress,
      password: password,
    );
    ReceiverInstituition receiver =
        receiverInstituition.copyWith(id: credentials.user!.uid);
    await FirebaseFirestore.instance
        .collection('receiver_instituitions')
        .doc(receiver.id)
        .set(receiver.toJson());

    return credentials;
  }

  Future<UserCredential> createVolunteer(
      Volunteer volunteer, String password) async {
    UserCredential credentials =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: volunteer.emailAddress,
      password: password,
    );
    Volunteer middlemen = volunteer.copyWith(id: credentials.user!.uid);
    await FirebaseFirestore.instance
        .collection('volunteers')
        .doc(middlemen.id)
        .set(middlemen.toJson());

    return credentials;
  }
}
