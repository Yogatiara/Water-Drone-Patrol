import TDSIcon from "@assets/icons/TDS icon.png";

export const TDSCard = () => {
  return (
    <div className="card w-[450px] rounded-xl border bg-[#aed1ff]">
      <div className="card-body">
        <h2 className="card-title text-2xl">Total Dissolved Solids : </h2>
        <div className="flex flex-row place-content-center items-center gap-4 pb-2 pt-6">
          <img src={TDSIcon} alt="TDS Icon" className="w-24" />

          <div className="flex flex-row items-end gap-1 text-gray-600">
            <h2 className="text-6xl">30.5</h2>
            <span className="text-2xl">PPM</span>
          </div>
        </div>
      </div>
    </div>
  );
};
