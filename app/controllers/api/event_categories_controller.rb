class Api::EventCategoriesController < ApplicationController
    def create
        event_categorie = EventCategorie.create(event_id: params[:event_id], categorie_id: params[:categorie_id])
        render json: event_categorie.to_json(
            include: [:event],
            exclude: [:updated_at, :created_at]
        )
    end

    def index
        event_categorie= EventCategories.all
        render json: event_categorie.to_json
    end

    def show
        event_categorie = EventCategories.find(params[:id])
        render json: event_categorie.to_json
    end


end
