class CommentsController < ApplicationController
  def index
  end

  def new
    @Product = Product.new
  end

  def show
  end

  def edit
  end

  def create
    #Seemed a little silly to have 3 controllers, so comments and categories share one, with custom routing so the url is consistent with the action being taken.
    #Check to see if creating new comment
    if params['comment']
        Comment.new(:commenter=>params['commenter'], :comment=>params['comment'], :Product_id=>params['product_id']).save
        @products = Product.all
        redirect_to :back
        return
    end
    if params['category']
        Category.new(:name=>params['category']).save
        @products = Product.all
        redirect_to controller: :products, action: :index
        return
    end


  end

  def destroy
  end

  def update
  end
end


#redirect_to :controller => 'products', :action => 'show', :id => params['product_id']