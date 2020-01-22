class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy #dependent part indicated that the existence of line items is dependent on the existnece of the cart
    # if we destroy a cart, also destory any line items that are associated with that cart
end
