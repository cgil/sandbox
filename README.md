# Tote Sandbox

A collection of examples and tests to use with Tote.

## Kit
A playful app to showcase the power of embedded Tote Stores.
Each view contains different approaches to displaying your Tote Store.
Included are examples of:
  * A full store
  * Filtering products in a store
  * A header banner
  * A product embedded in a news feed

<img src="https://raw.githubusercontent.com/cgil/tote-sandbox/master/Kit/assets/kit-preview.png" alt="Kit app" width="350px">

Use one of our example stores or create your own.
In the following examples clutch is the subdomain housing our collection of stores.

Given that your store id is STORE_ID
Your embedded store url will be https://CLUTCH_HOST/#/STORE_ID

If you wish to only show a filtered set of products from your store, we allow product filtering.
Given that your store id is STORE_ID, with products PRODUCT1_ID and PRODUCT2_ID; your embedded store url will be:
https://CLUTCH_HOST/#/STORE_ID/?filter[product]=PRODUCT1_ID,PRODUCT2_ID
