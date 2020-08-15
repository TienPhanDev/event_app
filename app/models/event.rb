class Event < ApplicationRecord
    has_many :tickets
    has_many :bookmarks
    has_many :reviews
    has_many :event_categories
    has_many :categories, through: :event_categories
    has_many :users, through: :tickets
    has_many :users, through: :bookmarks
end
