#!/bin/bash

function cleanup {
    kill "$ACCOUNTS_PID"
    kill "$PRODUCTS_PID"
    kill "$REVIEWS_PID"
    kill "$RATINGS_PID"
}
trap cleanup EXIT

go build -o /tmp/srv-gateway ./gateway
go build -o /tmp/srv-accounts ./accounts
go build -o /tmp/srv-products ./products
go build -o /tmp/srv-reviews ./reviews
go build -o /tmp/srv-ratings ./ratings

/tmp/srv-accounts &
ACCOUNTS_PID=$!

/tmp/srv-products &
PRODUCTS_PID=$!

/tmp/srv-ratings &
RATINGS_PID=$!

/tmp/srv-reviews
#/tmp/srv-reviews &
#REVIEWS_PID=$!


#/tmp/srv-gateway
