class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
		@temp= Category.find(@product.category_id)
		@category = @temp.name
	end

	def new
		@categories = Category.all
		@product = Product.new
	end

	def edit
		@product = Product.find(params[:id])
		
	end

	def create	
    	
		a = Product.new(:name=>params['product']['name'], :description=>params['product']['description'], :pricing=>params['product']['pricing'], :category_id=>params['product']['category_id'])
		
	    if a.save
	      @message = "New product successfully created."	      
	      		      
	    else
	      @message = "New product not created." 
	      @explain = a.errors.full_messages
	      @products = Product.all
	      render "new"
        end
	    
	    @products = Product.all
	    render "index"
	end

	def update
		@product = Product.find(params['id'])
		
	    if @product.update_attributes(:name=>params['product']['name'], :description=>params['product']['description'], :category_id=>params['product']['category_id'], :pricing=>params['product']['pricing'])
	      @message = "Product successfully updated."
	      @products = Product.all
	      render "index"
	    else
	      @explain = @product.errors.full_messages
	      render "edit"
	    end
	end

	def destroy
		@name = params['name'] 
		if Product.find(params['id']).destroy
	    	@message = "The product #{@name} has been successfully deleted."
		end
		@products = Product.all
		render "index"
	end
end
