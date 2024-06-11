import { collection, getDocs } from "firebase/firestore";

import { db } from "./config/fireStore";

const getAllMonitoringData = async () => {
  const querySnapshot = await getDocs(collection(db, "monitoring"));
  const monitoringData = querySnapshot.docs.map((doc) => ({
    id: doc.id,
    ...doc.data(),
  }));
  return monitoringData;
};

export { getAllMonitoringData };
