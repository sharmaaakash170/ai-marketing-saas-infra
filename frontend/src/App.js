import { useEffect, useState } from "react";
import { pingBackend } from "./api";

function App() {
  const [msg, setMsg] = useState("Checking backend...");

  useEffect(() => {
    pingBackend()
      .then(data => setMsg(data.message))
      .catch(() => setMsg("Backend not reachable"));
  }, []);

  return (
    <div>
      <h1>AI Marketing SaaS</h1>
      <p>{msg}</p>
    </div>
  );
}

export default App;
