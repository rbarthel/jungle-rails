class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user
    @review.save
    redirect_to @product
  end

  private

    def review_params
      params.require(:review).permit(:rating, :description, :user_id, :product_id)
    end
end
