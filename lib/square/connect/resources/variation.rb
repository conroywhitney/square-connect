module Square
  module Connect
    module Resource
      class Variation
        attr_reader :id, :name, :inventory_alert_type, :track_inventory, :pricing_type,
                    :price, :sku, :ordinal, :item_id
        def initialize(variation)
          @id = variation['id']
          @name = variation['name']
          @inventory_alert_type = variation['inventory_alert_type']
          @track_inventory = variation['track_inventory']
          @pricing_type = variation['pricing_type']
          @price = Money.new(
            variation['price_money']['amount'],
            variation['price_money']['currency_code']
          ) if variation['price_money']
          @sku = variation['sku']
          @ordinal = variation['ordinal']
          @item_id = variation['item_id']
        end
      end
    end
  end
end
