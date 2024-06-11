import DateIcon from "@assets/icons/date icon.png";

export const MonitoringDateCard = () => {
  return (
    <div className="card w-96 rounded-3xl border bg-slate-100 shadow-xl">
      <div className="card-body p-6">
        <h2 className="card-title text-2xl">Monitoring Date : </h2>
        <div className="flex flex-row place-content-center items-center gap-4 p-2 pt-3">
          <img src={DateIcon} alt="Temeperature Icon" className="w-8" />

          <div className="flex flex-row items-center">
            <h2 className="text-2xl">6:37:47 PM&nbsp;&nbsp;6/10/2024</h2>
          </div>
        </div>
      </div>
    </div>
  );
};
