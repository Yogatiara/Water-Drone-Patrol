import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";

import { MonitoringDetailTable } from "./components/MonitoringDetailTable";

import {
  MonitoringDateCard,
  PHCard,
  TDSCard,
  TemperatureCard,
  TurbidityCard,
  WaterStatusCard,
} from "@water-monitoring-detail-components/cards";

import {
  getMonitoringDataById,
  getSubMonitoringData,
} from "../../../api/fetching";
import { Loading } from "@public-components/Loading";

export const WaterMonitoringDetail = () => {
  const [monitoringData, setMonitoringData] = useState(null);
  const [subMonitoringData, setSubMonitoringData] = useState(null);

  const [loading, setLoading] = useState(true);

  const { id } = useParams();

  useEffect(() => {
    const fetchMonitoringData = () => {
      return getMonitoringDataById(id)
        .then((res) => {
          setMonitoringData(res);
        })
        .catch((err) => {
          throw new Error(err);
        });
    };

    const fetchSubMonitoringData = () => {
      return getSubMonitoringData(id)
        .then((res) => {
          setSubMonitoringData(res);
        })
        .catch((err) => {
          throw new Error(err);
        });
    };

    const fetchAllData = async () => {
      setLoading(true);
      try {
        await Promise.all([fetchMonitoringData(), fetchSubMonitoringData()]);
      } catch (error) {
        console.error(error);
      } finally {
        setLoading(false);
      }
    };

    fetchAllData();
  }, [id]);

  return (
    <>
      <div className="mt-12 h-screen">
        {loading ? (
          <div className="fixed h-screen px-[580px] py-48">
            <Loading />
          </div>
        ) : (
          <>
            <div className="mt-6 flex place-content-center items-center gap-16 rounded-2xl">
              <div className="flex flex-col items-center gap-10 border-r-2 border-r-gray-400 pr-16">
                <MonitoringDateCard monitoringData={monitoringData} />

                <WaterStatusCard monitoringData={monitoringData} />
              </div>
              <div className="grid w-max grid-cols-2 place-content-center gap-5">
                <PHCard monitoringData={monitoringData} />
                <TurbidityCard monitoringData={monitoringData} />
                <TemperatureCard monitoringData={monitoringData} />
                <TDSCard monitoringData={monitoringData} />
              </div>
            </div>
            <div className="mx-16 mt-32">
              <MonitoringDetailTable subMonitoringData={subMonitoringData} />
            </div>
          </>
        )}
      </div>
    </>
  );
};
