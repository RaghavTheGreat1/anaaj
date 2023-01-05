import * as functions from "firebase-functions";

import * as admin from 'firebase-admin';
import { initializeApp } from 'firebase-admin/app';
import { getFirestore } from 'firebase-admin/firestore';
import { getMessaging } from 'firebase-admin/messaging';

// The Firebase Admin SDK to access Firestore.
const auth_app = initializeApp({ credential: admin.credential.cert(require("../admin-sdk-private-key.json")) }, "auth_app")
const default_app = initializeApp();

// Take the text parameter passed to this HTTP endpoint and insert it into 
// Firestore under the path /messages/:documentId/original
exports.pickReceiver = functions.https.onRequest(async (req, res) => {

	const tokenId = req.get('Authorization')?.split('Bearer ')[1];

	if (tokenId) {
		try {
			await admin.auth().verifyIdToken(tokenId);
			try {
				const db = getFirestore(default_app);
				const messaging = getMessaging(auth_app);

				const event = await db.collection('receiver_instituitions').get();
				const all_receivers = event.docs.map(doc => doc.data());
				const accepting_receivers = all_receivers.filter(r => r.accepting_orders);
				const tokens: Array<string> = [...new Set(accepting_receivers.map(user => user.fcmToken))];

				console.log(accepting_receivers);

				if (tokens.length > 0) {
					const message = {
						notification: {
							title: 'Sparky says hello!',
						},
					}

					for (const token of tokens) {
						try {
							const response = await messaging.sendToDevice(token, message);
							console.log(response.successCount + ' messages were sent successfully');
						} catch (err) {
							console.error(err);
							console.log(auth_app.options.credential);
						}
					}
					// Send back a message that we've successfully written the message
				}
				res.send(JSON.stringify(accepting_receivers, null, 2));
			} catch (err) { console.error(err); res.sendStatus(500) }
		} catch (err) { res.status(401).send(err) }
	}
	// Grab the text parameter.
	// Push the new message into Firestore using the Firebase Admin SDK.


})
