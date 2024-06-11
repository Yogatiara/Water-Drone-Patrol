import { BrowserRouter as Router, Routes, Route } from "react-router-dom";

import { MainLayout } from "./components/MainLayout";
import { WaterMonitoringDetail } from "./pages/water_monitoring_detail/WaterMonitoringDetail";
import { History } from "./pages/history/History";

export const App = () => {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<MainLayout />}>
          <Route path="water-monitoring" element={<WaterMonitoringDetail />} />
          <Route path="history" element={<History />} />
        </Route>
      </Routes>
    </Router>
  );
};
