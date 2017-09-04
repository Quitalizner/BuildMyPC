class ProductType < ApplicationRecord
	has_many :products , dependent: :destroy, :foreign_key => :value, :primary_key => :value
end
