class ProductsController < ApplicationController

	def index
		@products = Product.all 		#All products or each and every type
	end

	def allitems
		@product = Product.new			#For the new action in the view listing products of all types
	end

	def new
		@product = Product.new   		#For the new action for a specific type of product
	end

	def edit
		@product = Product.find(params[:id])
	end

	def show
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			if params[:val] == "true"
				redirect_to product_path 		#Show action view
			else
				redirect_to products_path		#Index action view
			end
		else
			render 'edit'
		end
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			if params[:val] == "true"
				product_id = ProductType.find_by(value: @product.value)
				redirect_to product_type_path(product_id.id)
			else
				redirect_to products_path
			end
		else
			redirect_to new_product_path
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		if params[:val] == "true"
			product_id = ProductType.find_by(value: @product.value)
			redirect_to product_type_path(product_id.id)
		else
			redirect_to products_path
		end
	end

	private

	def product_params
		params.require(:product).permit(:name,:value,:description,:specification,:price)
	end
end
