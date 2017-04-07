class ProductsController < ApplicationController
    def index
        @categories = Category.all
        @products = Product.all
    end

    def new
        @categories = Category.all
        render "/products/new"
    end

    def all_comments
        redirect_to "/comments"
    end

    def create
        category = Category.find( product_params[:category] )
        product = Product.create(name: product_params[:name], description: product_params[:description], pricing: product_params[:pricing], category: category)
        if product.save
            redirect_to "/products"
        else
            flash[:errors] = []
            flash[:errors] = product.errors.full_messages
            redirect_to "/products/new"
        end
    end

    def show
        @product = Product.find( params[:id] )
    end

    def edit
        @product = Product.find( params[:id] )
        @categories = Category.all
    end

    def update
        category = Category.find( product_params[:category])
        product = Product.find( params[:id] )
        product.update(name: product_params[:name], description: product_params[:description], pricing: product_params[:pricing], category: category)
        if product.update(name: product_params[:name], description: product_params[:description], pricing: product_params[:pricing], category: category)
            redirect_to "/products"
        else
            flash[:errors] = []
            flash[:errors] = @product.errors.full_messages
            redirect_to "/products/#{@product.id}/edit"
        end
    end

    def destroy
        user = Product.find( params[:id] )
        user.destroy
        redirect_to "/products"
    end

    def back
        redirect_to "/products"
    end

    private
    def product_params
        params.require(:form).permit(:name, :description, :pricing, :category)
    end

end
