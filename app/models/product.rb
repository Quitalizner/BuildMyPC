class Product < ApplicationRecord
	belongs_to :product_type, :foreign_key => :value, :primary_key => :value
end
