class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy #dependent part indicated that the existence of line items is dependent on the existnece of the cart
    # if we destroy a cart, also destory any line items that are associated with that cart

    def add_product(product)
        current_item = line_items.find_by(product_id: product.id)
            if current_item
             current_item.quantity += 1
            else
             current_item = line_items.build(product_id: product.id)
            end
        current_item
    end

    def total_price
        line_items.to_a.sum { |item| item.total_price }
    end
end
