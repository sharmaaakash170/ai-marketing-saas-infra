# AI Marketing SaaS – Backend

This repository contains the **backend service** for the AI Marketing SaaS platform.  
The backend is built with **Ruby on Rails**, containerized with **Docker**, and designed to run both locally and on **AWS EC2**.

---

## Tech Stack

- **Ruby on Rails** (API backend)
- **Ruby 3.2**
- **Bundler**
- **Docker**
- **Nginx (optional, for production)**
- **AWS EC2**
- **MySQL / PostgreSQL** (configurable)

---

## Project Structure

```bash
backend/
├── app/
├── config/
├── db/
├── Gemfile
├── Gemfile.lock
├── Dockerfile
├── docker-compose.yml
├── README.md
```

---

## API Health Check

The backend exposes a simple health endpoint to verify connectivity.

### Ping API

```bash
GET /api/ping
```

**Response**
```json
{
  "message": "Backend connected"
}
```

Test locally or on EC2:

```bash
curl http://localhost/api/ping
```

---

## Rails Routes Configuration

Make sure your routes are defined **inside** `Rails.application.routes.draw`:

```ruby
Rails.application.routes.draw do
  get "up" => "rails/health#show"
  get "/health", to: "health#index"

  namespace :api do
    get "/ping", to: "test#ping"
  end
end
```

---

## Running Locally (Without Ruby Installed)

If Ruby/Bundler is **not installed locally**, use Docker.

### Install Dependencies Using Docker

```bash
docker run --rm   -v "D:/DevOps/ai-marketing-saas-infra/backend":/app   -w /app   ruby:3.2   bash -c "gem install bundler && bundle install"
```

> ⚠️ On Windows (Git Bash), always use **absolute Windows paths** (e.g. `D:/...`) when mounting volumes.

---

## Running the Backend with Docker Compose

```bash
docker-compose up --build
```

The backend will be available at:

```
http://localhost
```

---

## Production (EC2) Verification

On the EC2 instance:

```bash
curl http://localhost/api/ping
```

Expected output:

```json
{"message":"Backend connected"}
```

If the UI shows **“Backend not reachable”** but this works:
- Check **frontend API base URL**
- Verify **security group inbound rules**
- Confirm **Nginx reverse proxy configuration**
- Ensure backend is binding to `0.0.0.0`, not `127.0.0.1`

---

## Common Issues & Fixes

### `bundle: command not found`
✔ Use Docker-based bundler install (recommended)

### `working directory is invalid` (Windows)
✔ Use full Windows path instead of `$(pwd)`

### UI says backend not reachable
✔ Backend is running, but frontend cannot reach it  
✔ Check:
- API URL in frontend env
- EC2 security groups
- Port mapping in Docker

---

## Author

**Aakash Sharma**  
DevOps Engineer | AWS | Terraform | Docker | Kubernetes

---

## Status

✅ Backend API working  
🚧 Frontend integration in progress  
🚀 Production-ready infrastructure

