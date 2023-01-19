# Frontend

To build the frontend container execute

```
docker build -t sof_con_frontend .
```
in ./frontend/

To run the frontend container execute

```
docker run -p 3000:80 sof_con_frontend
```
in ./frontend/

Frontend will be available at localhost:3000

# Backend

To build the backend container execute

```
docker build -t sof_con_backend .
```
in ./backend/

To run the backend container execute

```
docker run -p 4000:4000 sof_con_backend
```
in ./backend/

Backend will be available at localhost:4000

