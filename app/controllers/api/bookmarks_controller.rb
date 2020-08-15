class Api::BookmarksController < ApplicationController
    # GET /bookmarks
    def index
        bookmark = bookmark.first
        render json: bookmark.to_json(
            include: [:event],
            exclude: [:updated_at, :created_at]
        )
    end

    # POST /bookmarks
    def create
        bookmark = Bookmark.create(user_id: params[:user_id], event_id: params[:event_id], )
        render json: bookmark.to_json(
            include: [:event],
            exclude: [:updated_at, :created_at]
        )
    end
end
