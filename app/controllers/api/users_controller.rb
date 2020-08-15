class Api::UsersController < ApplicationController
    #Used to find specific user after login to persist ticket/bookmark details
    #GET /users/find_user/:id
    def find_user
        user = User.find_by(username: params[:username], password_digest: params[:password_digest])
        render json: user.to_json(
            :only => [:id, :username],
            :include => {
                :tickets => {
                    :include => [:event]
                },
                :bookmarks => {
                    :include => [:event]
                }
            },
            :methods => [:event_tickets, :bookmarked_events]
        )
    end

    # GET /users/:id
    def show
        user = User.find(params[:id])
        render json: user.to_json(
            :only => [:id, :username],
            :include => {
                :tickets => {
                    :include => [:event]
                },
                :bookmarks => {
                    :include => [:event]
                }
            },
            :methods => [:event_tickets, :bookmarked_events]
        )
    end

    # GET /users
    def index
        @users = User.all
        render json: @users
    end

    # POST /users
    def create
        user = User.create(username: params[:username], password_digest:[:password_digest])
        render json: user.to_json(
            :only => [:id, :username],
            :include => {
                :tickets => {
                    :include => [:event]
                },
                :bookmarks => {
                    :include => [:event]
                }
            },
            :methods => [:event_tickets, :bookmarked_events]
        )
    end

    # DELETE /users/delete_bookmark
    def delete_bookmark
        user = User.find(params[:id])
        bookmark = Bookmark.find_by(user_id: params[:id], event_id: params[:event_id])
        Bookmark.destroy(bookmark.id)

        render json: bookmark.event.to_json()
    end

end
