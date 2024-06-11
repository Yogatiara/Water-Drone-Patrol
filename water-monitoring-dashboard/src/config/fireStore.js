// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getFirestore } from "firebase/firestore";

// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

const {
  API_KEY: apiKey,
  AUTH_DOMAIN: authDomain,
  PROJECT_ID: projectId,
  STORAGE_BUCKET: storageBucket,
  MESSAGING_SENDER_ID: messagingSenderId,
  APP_ID: appId,
} = import.meta.env;
// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey,
  authDomain,
  projectId,
  storageBucket,
  messagingSenderId,
  appId,
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
export const db = getFirestore(app);
