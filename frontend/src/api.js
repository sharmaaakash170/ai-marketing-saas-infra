export async function pingBackend() {
  const res = await fetch(
    `${process.env.REACT_APP_API_URL}/api/ping`
  );
  return res.json();
}
