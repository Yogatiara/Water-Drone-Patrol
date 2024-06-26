import { useEffect, useState } from "react";

import Swal from "sweetalert2";

import { WaterMonitoringTable } from "./components/WaterMonitroingTable";

import { getAllMonitoringData, deleteMonitoringData } from "@api/fetching";
// import { Loading } from "@public-components/Loading";
import { Loading, Pagination } from "@public-components/";
export const WaterMonitoring = () => {
  const [monitoringData, setMonitoringData] = useState();
  const [loading, setLoading] = useState(true);
  const [curentPage, setCurrentPage] = useState(1);

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

  const handleDelete = (id) => {
    Swal.fire({
      title: "Are you sure?",
      text: "You won't be able to revert this!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Yes, delete it!",
    }).then((result) => {
      if (result.value) {
        const [filterMonitoringData] = monitoringData.filter(
          (filterMonitoringData) => filterMonitoringData.id === id,
        );

        deleteMonitoringData(id);

        Swal.fire({
          title: "Deleted!",
          text: `Monitoring at ${filterMonitoringData.time} / ${filterMonitoringData.date} has been deleted`,
          icon: "success",
        });

        const updatedMonitoringData = monitoringData.filter(
          (filterMonitoringData) => filterMonitoringData.id !== id,
        );
        setMonitoringData(updatedMonitoringData);
      }
    });
  };

  const recordsPerPage = 10;
  let records;
  let numbers;

  if (monitoringData) {
    const lastIndex = curentPage * recordsPerPage;
    const firstIndex = lastIndex - recordsPerPage;
    records = monitoringData.slice(firstIndex, lastIndex);
    const npage = Math.ceil(monitoringData.length / recordsPerPage);
    numbers = [...Array(npage + 1).keys()].slice(1);
  }

  const prefPage = () => {
    if (curentPage !== 1) {
      setCurrentPage(curentPage - 1);
    }
  };

  const nextPage = () => {
    if (curentPage !== numbers.length) {
      setCurrentPage(curentPage + 1);
    }
  };

  const changeCpage = (i) => {
    setCurrentPage(i);
  };

  return (
    <>
      <div className="mt-12">
        {loading ? (
          <div className="fixed h-screen px-[580px] py-48">
            <Loading />
          </div>
        ) : (
          <div className="mt-10 px-2">
            <WaterMonitoringTable
              handleDelete={handleDelete}
              monitoringData={records}
            />
            <Pagination
              prefPage={prefPage}
              numbers={numbers}
              changeCpage={changeCpage}
              curentPage={curentPage}
              nextPage={nextPage}
            />
          </div>
        )}
      </div>
    </>
  );
};
