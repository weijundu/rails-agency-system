class ReviewsController < ApplicationController
  def create
    @profile = Profile.find(params[:profile_id])
    @review = Review.new(review_params)
    authorize @review
    @review.profile = @profile
    if @review.save
      respond_to do |format|
        format.html { redirect_to profile_path(@profile) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'profiless/show' }
        format.js
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
