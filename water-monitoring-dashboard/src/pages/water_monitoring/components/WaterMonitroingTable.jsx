import PropTypes from "prop-types";
import { Link } from "react-router-dom";

export const WaterMonitoringTable = ({ monitoringData, handleDelete }) => {
  return (
    <>
      <div className="overflow-x-auto">
        <table className="table table-zebra border border-gray-300 text-center">
          {/* head */}
          <thead className="text-md bg-[#5daeff] uppercase text-white">
            <tr className="border-gray-300">
              <th>No</th>
              <th>Id</th>
              <th>Date Time</th>
              <th>Status</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody className="border-gray-300">
            {monitoringData.map((data, i) => (
              <tr key={i} className="border-gray-300 text-base">
                <th>{i + 1}</th>
                <td>{data.id}</td>
                <td>
                  {data.time}, {data.date}
                </td>

                <td className="text-lg font-medium uppercase text-red-500">
                  {data.status}
                </td>
                <td className="space-x-3">
                  <Link to={`/water-monitoring/${data.id}`}>
                    <button className="btn btn-warning text-white">
                      See details
                    </button>
                  </Link>
                  <button
                    onClick={() => handleDelete(data.id)}
                    className="btn btn-error text-white"
                  >
                    Delete
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </>
  );
};

WaterMonitoringTable.propTypes = {
  monitoringData: PropTypes.arrayOf(
    PropTypes.shape({
      id: PropTypes.string.isRequired,
      date: PropTypes.string.isRequired,
      time: PropTypes.string.isRequired,
      status: PropTypes.string.isRequired,
    }),
  ).isRequired,
  handleDelete: PropTypes.func,
};
