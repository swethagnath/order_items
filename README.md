Ruby version: 2.4.2

Rails version: 5.2.2

Database: sqlite3

API is tested through postman tool

Tables

# Items
# Orders

CRUD operations on items

Index

localhost:3000/api/v1/items
method: get

Create 

localhost:3000/api/v1/items
method: post

Update

localhost:3000/api/v1/items/1
method: patch

Destroy

localhost:3000/api/v1/items/1
method: delete


All items listing

localhost:3000/api/v1/items
method: get

Single & bulk ordering (Just consider the item, no. of items & email ids as params for ordering)

localhost:3000/api/v1/orders 
method: post

All orders

localhost:3000/api/v1/orders
method: get

# added stock and price 