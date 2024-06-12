import { useEffect, useState } from "react";

import { WaterMonitoringTable } from "./components/WaterMonitroingTable";

import { getAllMonitoringData } from "@api/fetching";
import { Loading } from "@public-components/Loading";

export const WaterMonitoring = () => {
  const [monitoringData, setMonitoringData] = useState();
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    getAllMonitoringData()
      .then((res) => {
        setMonitoringData(res);
      })
      .catch((err) => {
        throw new Error(err);
      })
      .finally(() => {
        setLoading(false);
      });
  }, []);

  return (
    <>
      <div className="mt-12">
        {loading ? (
          <div className="fixed h-screen px-[580px] py-48">
            <Loading />
          </div>
        ) : (
          <div className="mt-10 px-2">
            <WaterMonitoringTable monitoringData={monitoringData} />
          </div>
        )}
      </div>
    </>
  );
};
