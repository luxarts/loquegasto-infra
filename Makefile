backend:
	docker compose -f ../loquegasto-backend/compose.yaml up --build -d

up:
	docker compose -f ../loquegasto-backend/compose.yaml -f compose.yaml up --build -d