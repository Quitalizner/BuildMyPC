class ProductTypesController < ApplicationController


	def index
		@products = Product.all 		#to get all the records to an instance variable(array in the case) lasts only until the scope lasts. Since the is defined in index, it lasts only till you are using the index view
	end


end
