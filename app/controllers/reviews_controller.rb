class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy, :edit, :update]
  def create
    @profile = Profile.find(params[:profile_id])
    @review = Review.new(review_params)
    authorize @review
    @review.profile = @profile
    @review.user = current_user
    if @review.save
      respond_to do |format|
        format.html { redirect_to profile_path(@profile) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      raise
      respond_to do |format|
        format.html { render 'profiles/show' }
        format.js
      end
    end
  end

  def destroy
    @review.destroy
  end

  def edit

  end

  def update
    @review.update(review_params)
    redirect_to profile_path(params[:profile_id])
  end

  private

  def set_review
    @review = Review.find(params[:id])
    authorize @review
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
