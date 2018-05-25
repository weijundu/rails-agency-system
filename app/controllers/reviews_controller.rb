class ReviewsController < ApplicationController
  def create
    @profile = Profile.find(params[:profile_id])
    @review = Review.new(review_params)
    authorize @review
    @review.profile = @profile
    if @review.save
      redirect_to profile_path(@profile)
    else
      render 'profiles/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
