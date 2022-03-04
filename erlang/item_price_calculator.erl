-module(item_price_calculator).
-export([calculate_item_prices/1]).

calculate_item_prices(Cart) -> [ { Item, Quantity * Price } || { Item, Quantity, Price } <- Cart ].
