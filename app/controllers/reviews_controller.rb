class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user
    @review.save
    redirect_to :back
  end

  def destroy
    p 'test'
    @review = Review.find(params[:id])
    if @review.user == current_user
      if @review.destroy
        redirect_to :back
      end
    end
  end

  private

    def review_params
      params.require(:review).permit(:rating, :description, :user_id, :product_id)
    end
end
