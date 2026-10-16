# Kafka Connect Demo

MySQL → Debezium → Kafka, through Kafka Connect, running locally with Docker.

- [Kafka Confluent Documentation](https://docs.confluent.io/platform/current/connect/index.html#tasks)
- [Kafka Connect REST API](https://docs.confluent.io/platform/current/connect/references/restapi.html)
- [Debezium MySQL connector](https://debezium.io/documentation/reference/stable/connectors/mysql.html)

## What's running

| Service       | From your Mac    | From containers | Credentials                         |
|---------------|------------------|-----------------|-------------------------------------|
| Kafka (KRaft) | `localhost:9092` | `kafka:29092`   | -                                   |
| MySQL 8       | `localhost:3306` | `mysql:3306`    | `root/root`, `app/app`, `debezium/dbz` |
| Kafka Connect | `localhost:8083` | `connect:8083`  | -                                   |

## Run it

```bash
docker compose up -d --wait                    # 1. Kafka + MySQL (creates the network)
docker compose -f debezium.yml up -d --wait    # 2. Kafka Connect

docker compose -f debezium.yml down            # stop Connect only
docker compose down                            # stop Kafka + MySQL
docker compose down -v                         # also wipe data (mysql/init.sql runs again on next start)
```

## Use it

Open `test/kafka_connect_test.http` in VS Code with the
[REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) extension,
create the connector, then run the requests top to bottom.
