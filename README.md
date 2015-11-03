A mongoDb database containing Best Buy product data from the Bulk Download API

https://developer.bestbuy.com/documentation/bulkDownload-api

```
docker run -d --name bestbuy_mongodb -e BESTBUY_API_KEY=<your_api_key> bigwednesdayio/bestbuy_mongodb

// create your indexes here before importing data
// e.g. docker exec -it bestbuy_mongodb mongo bestbuy --eval "db.products.createIndex({sku: 1})"

docker exec -it bestbuy_mongodb import.sh
```

`import.sh` will download the productsActive dataset from Best Buy using your API key and import it into a `products` collection in the `bestbuy` database. The database contains almost 2 million documents so don't forget to add your own indexes!
