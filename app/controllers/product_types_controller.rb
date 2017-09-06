class ProductTypesController < ApplicationController


	def index
		@types = ProductType.all 		#to get all the records to an instance variable(array in the case) lasts only until the scope lasts. Since the is defined in index, it lasts only till you are using the index view
	end

	def new
		@type = ProductType.new			#to create a new record into the respective model
	end

	def show
		@type = ProductType.find(params[:id])		#Finding the type of product click on
		@products = Product.where(value: @type.value)		#finding all the products whose value field is same as the type of product value(primary key) 
	end

	def create
		@type = ProductType.new(type_params)		#type params defined below in private class	
		if @type.save								#save the product created
			redirect_to root_url					#and redirect to root
		else										#if doesnt save and error occurs
			render 'new'							#error occurs and render 'new' view
		end
	end

	def edit
		@type = ProductType.find(params[:id])
	end

	def update
		@type = ProductType.find(params[:id])
		if @type.update(type_params)				#update the params
			redirect_to root_url					#if updated redirect to root
		else						
			render 'edit'							#else if error occurs render 'edit' view again
		end
	end

	def destroy
		ProductType.find(params[:id]).destroy		#destroy the record
		redirect_to root_url						#redirect to root 
	end

	private

		def type_params
			params.require(:product_type).permit(:name,:value)  	#used to only permit type and value thorugh request(to prevent hacking) used in create and update action above
		end
end
