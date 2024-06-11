import { MonitoringDetailTable } from "./components/MonitoringDetailTable";
import { MonitoringDateCard } from "./components/cards/MonitoringDateCard";
import { PHCard } from "./components/cards/PHCard";
import { TDSCard } from "./components/cards/TDSCard";
import { TemperatureCard } from "./components/cards/TemperatureCard";
import { TurbidityCard } from "./components/cards/TurbidityCard";
import { WaterStatusCard } from "./components/cards/WaterStatusCard";

export const WaterMonitoringDetail = () => {
  return (
    <>
      <div className="mt-12">
        <div className="mt-6 flex place-content-center items-center gap-16 rounded-2xl">
          <div className="flex flex-col items-center gap-10 border-r-2 border-r-gray-400 pr-16">
            <MonitoringDateCard />

            <WaterStatusCard />
          </div>
          <div className="grid w-max grid-cols-2 place-content-center gap-5">
            <PHCard />
            <TurbidityCard />
            <TemperatureCard />
            <TDSCard />
          </div>
        </div>
        <div className="mx-16 mt-32">
          <MonitoringDetailTable />
        </div>
      </div>
    </>
  );
};
