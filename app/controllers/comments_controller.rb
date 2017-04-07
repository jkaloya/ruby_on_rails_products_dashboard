class CommentsController < ApplicationController
    def create
        @product = Product.find(params[:id])
        @product.comments.create(comments_params)
        redirect_to "/products/#{@product.id}"
    end

    def show
        @comments = Comment.all
    end

    private
    def comments_params
        params.require(:form).permit(:comment, :product)
    end
end
