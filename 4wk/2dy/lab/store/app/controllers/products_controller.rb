class ProductsController < ApplicationController
	def index
  		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		new_product = params.require(:product).permit(:name, :price)
    	product = Product.create(new_product)
    	new_category_ids = params[:product][:category_ids].select { |c| c != ""}

    	new_category_ids.each do |new_cat_id|
    		unless product.category_ids.include?(new_cat_id.to_i)
    			product.categories << Category.find(new_cat_id)
    		end
    	end
    	
		redirect_to product_path(product.id)    
	end


	def show
  		id = params.require(:id)
  		@product = Product.find(id)
 		@categories = @product.categories
	end

	 def edit
    	id = params[:id]
    	@product = Product.find(id)
    	@categories = Category.all
    	@filtered_categories = @categories - @product.categories
    	#binding.pry
    end

    def update
    	id = params[:id]
    	updated_info = params.require(:product).permit(:name, :price)
    	product = Product.find(id)
    	product.update_attributes(updated_info)

    	new_category_ids = params[:product][:category_ids].select { |c| c != ""}


    	product.category_ids.each do |id|
    		unless new_category_ids.include?(id)
    			product.categories.delete(id)
    		end
    	end

    	new_category_ids.each do |new_cat_id|
    		unless product.category_ids.include?(new_cat_id.to_i)
    			product.categories << Category.find(new_cat_id)
    		end
    	end

    	redirect_to product_path(product.id)
    end

    def destroy
        id = params[:id]
        #binding.pry
        @product = Product.find(id)
        #binding.pry
        @product.destroy
        redirect_to root_path
    end


end
