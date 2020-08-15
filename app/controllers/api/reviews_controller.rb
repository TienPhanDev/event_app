class Api::ReviewsController < ApplicationController
    # POST /reviews/:id
    def create
        review = Review.create(
            event_id: params[:event_id],
            user_id: params[:user_id],
            description: params[:description]
        )

        render json: review.to_json(
            :include => [:event],
            :only => [:id, :description]
        )
    end

    # DELETE /reviews/:id
    def destroy
        review = Review.find(params[:review_id])
        review.destroy

        render json: review
    end
end
