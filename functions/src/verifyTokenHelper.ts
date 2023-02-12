import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

const verifyTokenHelper = async (req: functions.https.Request) => {
  const token = req.get("Authorization")?.split("Bearer ")[1];
  if (token) {
    return admin.auth().verifyIdToken(token);
  }
  throw new Error("Token id messaging");
};

export default verifyTokenHelper;
