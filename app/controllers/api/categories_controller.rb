class Api::CategoriesController < ApplicationController
    # GET /categories
    def index
        categorie = Categorie.order(:name)

        render json: categorie.to_json
    end
    
    # GET /categories/:id
    def show
        categorie = Categorie.find(params[:id])

        render json: categorie.to_json(
            :only => [:id, :name],
            :include => {
                :event_categories => {
                    :include => [:event]
                }
            },
        )
    end

end
