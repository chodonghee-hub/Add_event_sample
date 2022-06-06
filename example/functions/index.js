const functions = require("firebase-functions");
const admin = require('firebase-admin');
const auth = require('firebase-auth');

var serviceAccount = require("./memo-ff06e-firebase-adminsdk-64d7x-f69bd2a41e.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
exports.createCustomToken = functions.https.onRequest( async (request, response) => {
    const user = request.body;

    const uid = `kakao:${user.uid}`;
    const upadteParams = {
        email: user.email,
        photoURL: user.photoURL,
        displayName: user.displayName,
    };

    try {
        // 계정이 있는 경우 
        await admin.auth().updateUser(uid, updateParams);
    } catch (e) {
        // 계정이 없는 경우 
        updateParams["uid"] = uid;
        await admin.auth().createUser(updateParams);
    }

    // user 정보 추가 
    const token = await admin.auth().createCustomToken(uid);

    response.send(token);

});

