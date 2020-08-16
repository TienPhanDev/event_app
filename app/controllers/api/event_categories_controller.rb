class Api::EventCategoriesController < ApplicationController
    def create
        event_categorie = EventCategorie.create(event_id: params[:event_id], categorie_id: params[:categorie_id])
        render json: event_categorie.to_json(
            include: [:event, :categorie],
            exclude: [:updated_at, :created_at]
        )
    end

    def index
        event_categorie= EventCategorie.all
        render json: event_categorie.to_json(
            include: [:event, :categorie],
            exclude: [:updated_at, :created_at]
        )
    end

    def show
        event_categorie = EventCategorie.find(params[:id])
        render json: event_categorie.to_json(
            include: [:event, :categorie],
            exclude: [:updated_at, :created_at]
        )
    end


end
