class Product < ApplicationRecord
    validates :title, :description, :image_url, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }
    validates :title, uniqueness: true, length: {minimum: 10}
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png)\Z}i,
        message: 'must be a URL for GIF, JPG or PNG image.'
        }
end

# The title, description, and image URL fields aren’t empty.
# The price is a valid number not less than $0.01.
# The title is unique among all products.
# The image URL looks reasonable