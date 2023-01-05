import * as functions from "firebase-functions";

import * as admin from "firebase-admin";
import { initializeApp } from "firebase-admin/app";
import { getFirestore } from "firebase-admin/firestore";
import { getMessaging } from "firebase-admin/messaging";

// The Firebase Admin SDK to access Firestore.
const auth_app = initializeApp(
  {
    credential: admin.credential.cert(require("../admin-sdk-private-key.json")),
  },
  "auth_app",
);
const default_app = initializeApp();

const db = getFirestore(default_app);
const messaging = getMessaging(auth_app);

const verifyTokenHelper = async (req: functions.https.Request) => {
  const token = req.get("Authorization")?.split("Bearer ")[1];
  if (token) {
    await admin.auth().verifyIdToken(token);
  }
  throw new Error("Token id messaging");
};

exports.createOrder = functions.https.onRequest(async (req, res) => {
  try {
    // verifyTokenHelper(req);
    const event = await db.collection("receiver_instituitions").get();
    const all_receivers = event.docs.map((doc: any) => doc.data());
    const accepting_receivers = all_receivers.filter(
      (r: any) => r.acceptingOrders,
    );
    console.log(accepting_receivers);
  } catch (error) {
    console.error(error);
  }
});

// Take the text parameter passed to this HTTP endpoint and insert it into
// Firestore under the path /messages/:documentId/original
exports.pickReceiver = functions.https.onRequest(async (req, res) => {
  try {
    await verifyTokenHelper(req);
    try {
      const event = await db.collection("receiver_instituitions").get();
      const all_receivers = event.docs.map((doc: any) => doc.data());
      const accepting_receivers = all_receivers.filter(
        (r: any) => r.accepting_orders,
      );
      const tokens: Array<string> = [
        ...new Set(accepting_receivers.map((user: any) => user.fcmToken)),
      ] as Array<string>;

      console.log(accepting_receivers);

      if (tokens.length > 0) {
        const message = {
          notification: {
            title: "Sparky says hello!",
          },
        };

        for (const token of tokens) {
          try {
            const response = await messaging.sendToDevice(token, message);
            console.log(
              response.successCount + " messages were sent successfully",
            );
          } catch (err) {
            console.error(err);
            console.log(auth_app.options.credential);
          }
        }
        // Send back a message that we've successfully written the message
      }
      res.send(JSON.stringify(accepting_receivers, null, 2));
    } catch (err) {
      console.error(err);
      res.sendStatus(500);
    }
  } catch (err) {
    res.status(401).send(err);
  }
});
// Grab the text parameter.
// Push the new message into Firestore using the Firebase Admin SDK.
