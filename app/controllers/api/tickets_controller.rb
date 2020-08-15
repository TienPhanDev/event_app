class Api::TicketsController < ApplicationController
    # POST /tickets
    def create
        ticket = Ticket.create(user_id: params[:user_id], event_id: params[:event_id])
        render json: ticket.to_json(
            include: [:event],
            exclude: [:updated_at, :created_at]
        )
    end
end
