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
	end

	def edit
		@product = Product.find(params[:id])
		@temp= Category.find(@product.category_id)
		@category = @temp.name
		@categories=Category.all
	end

	def create
		#Check to see if creating new comment
		if params['comment']
			Comment.new(:commenter=>params['commenter'], :comment=>params['comment'], :Product_id=>params['product_id']).save
    		@products = Product.all
    		redirect_to :controller=>'products', :action => 'show', :id => params['product_id']
    		return
    	end

    	if params['category']
			c = Category.find_by! name: params['category'].titlecase
			a = Product.new(:name=>params['name'], :description=>params['description'], :pricing=>params['pricing'], :category_id=>c.id)
			@categories = Category.all
		    if a.save
		      @message = "New product successfully created."
		      
		      		      
		    else
		      @message = "New product not created." 
		      @explain = a.errors.full_messages
		      @products = Product.all
		      render "new"
	        end
	    end
	    @products = Product.all
	    render "index"
	end

	def update
		@this_product = Product.find(params['id'])
		this_id = Category.find_by! name: params['category'].titlecase
	    if @this_product.update_attributes(:name=>params['name'], :description=>params['description'], :category_id=>this_id.id, :pricing=>params['pricing'])
	      @message = "Product successfully updated."
	      @products = Product.all
	      render "index"
	    else
	      @explain = @this_user.errors.full_messages
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
