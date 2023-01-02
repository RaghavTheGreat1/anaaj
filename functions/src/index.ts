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
exports.addMessage = functions.https.onRequest(async (req, res) => {
	// Grab the text parameter.
	// Push the new message into Firestore using the Firebase Admin SDK.
	try {
		const dn = getFirestore(default_app);
		const messaging = getMessaging(auth_app);

		const event = await dn.collection('volunteers').get();
		const all_users = event.docs.map(doc => doc.data());
		const all_tokens: Array<string> = [...new Set(all_users.map(user => user.fcmToken))];

		console.log(all_users);

		if (all_tokens.length > 0) {
			const message = {
				notification: {
					title: 'Sparky says hello!',
					// imageUrl: 'https://foo.bar.pizza-monster.png'
					// data: {
					// imageUrl: 'https://foo.bar.pizza-monster.png'
					// }
				},
			}

			// console.log(all_messages);
			for (const token of all_tokens) {
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
		res.json({ result: all_users });
		// res.sendStatus(200);
	} catch (err) { console.error(err); res.sendStatus(500) }

})
