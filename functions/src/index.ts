import * as functions from "firebase-functions";

import { initializeApp } from "firebase-admin/app";
import { getFirestore } from "firebase-admin/firestore";

import * as express from "express";
import { getMessaging } from "firebase-admin/messaging";

// import verifyTokenHelper from "./verifyTokenHelper";

const expressApp = express();
const defaultApp = initializeApp();

const db = getFirestore(defaultApp);
const messaging = getMessaging(defaultApp);

expressApp.post("/createOrder", async (req, res) => {
  try {
    // await verifyTokenHelper(req);
    const order = JSON.parse(req.body);
    const result = await db.collection("orders").doc(order.id).set(order);

    console.log(order.volunteer.phoneNumber);
    await db
      .collection("volunteers")
      .doc(`${order.volunteer.phoneNumber}`)
      .set({ ...order.volunteer, isAvailable: false });

    const receiverToken = order.receiverInstituition.fcmToken;
    const volunteerToken = order.receiverInstituition.fcmToken;
    const recvMessage = {
      notification: {
        title: "Your Order has been confirmed!",
        body: "A volunteer will soon deliver it to you",
      },
      android: {
        notification: {
          imageUrl: "https://foo.bar.pizza-monster.png",
        },
      },
      token: receiverToken,
    };
    const volunteerMessage = {
      notification: {
        title: "An Order is Ready to be picked up!",
      },
      android: {
        notification: {
          imageUrl: "https://foo.bar.pizza-monster.png",
        },
      },
      token: volunteerToken,
    };

    try {
      await messaging.send(recvMessage);
      await messaging.send(volunteerMessage);
    } catch (err) {
      console.error("could not send notificaitons", err);
    }

    res.send(result);
  } catch (error) {
    console.error(error);
    res.send(error);
  }
});

exports.api = functions.https.onRequest(expressApp);
