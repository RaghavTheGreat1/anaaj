import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

import { initializeApp } from "firebase-admin/app";
import { getFirestore } from "firebase-admin/firestore";

import * as express from "express";
import { getMessaging } from "firebase-admin/messaging";

// import verifyTokenHelper from "./verifyTokenHelper";

const auth_app = initializeApp(
	{
		credential: admin.credential.cert(require("../admin-sdk-private-key.json")),
	},
	"auth_app",
);
const express_app = express();
const default_app = initializeApp();

const db = getFirestore(default_app);
const messaging = getMessaging(auth_app);


express_app.post("/createOrder", async (req, res) => {
	try {
		// await verifyTokenHelper(req);
		const order = JSON.parse(req.body)
		const result = await db.collection('orders').doc(order.id).set(order);
		const receiver_token = order.receiverInstituition.fcmToken;
		const volunteer_token = order.receiverInstituition.fcmToken;
		const recv_message = {
			notification: {
				title: "Your Order has been confirmed!",
				body: "A volunteer will soon deliver it to you"
			},
			android: {
				notification: {
					imageUrl: 'https://foo.bar.pizza-monster.png'
				}
			},
			token: receiver_token
		};
		const volunteer_message = {
			notification: {
				title: "An Order is Ready to be picked up!",
			},
			android: {
				notification: {
					imageUrl: 'https://foo.bar.pizza-monster.png'
				}
			},
			token: volunteer_token
		};

		await messaging.send(recv_message);
		await messaging.send(volunteer_message);

		res.send(result)
	} catch (error) {
		console.error(error);
		res.send(error)
	}
})

exports.api = functions.https.onRequest(express_app);
