import { NavLink, Outlet, useLocation } from "react-router-dom";

import { SideBar } from "./SideBar";

export const MainLayout = () => {
  const location = useLocation();

  return (
    <>
      <div
        className={`${location.pathname == "/" || location.pathname == "/history" ? "h-screen" : "h-full"} bg-blue-100 p-8 font-firaSans`}
      >
        <SideBar NavLink={NavLink} />
        <div className="ml-[360px] bg-blue-100 pl-8">
          <div className="flex h-20 items-center pl-2">
            <h1 className="text-4xl font-extrabold">Water Drone Patrol</h1>
          </div>
          <Outlet />
        </div>
      </div>
    </>
  );
};
