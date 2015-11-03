WIP Dockerfile for creating a mongodb database containing Best Buy data from the Bulk Download API

https://developer.bestbuy.com/documentation/bulkDownload-api

```
docker build -t bestbuydb .
docker run -d --name bestbuydb_1 -e BESTBUY_API_KEY=<api_key> -e BESTBUY_ARCHIVE=products bestbuydb
docker exec -it bestbuydb_1 import.sh
```
