class Api::CategoriesController < ApplicationController
    # GET /categories
    def index
        categorie = Categories.order(:name)

        render json: categorie.to_json(
            methods: [:ordered_by_name],
            except: [:created_at, :updated_at]
        )
    end
    
    # GET /categories/:id
    def show
        categorie = Categories.find(params[:id])

        render json: categorie.to_json(
            methods: [:ordered_events],
            except: [:created_at, :updated_at]
        )
    end
end
