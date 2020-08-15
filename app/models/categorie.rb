class Categorie < ApplicationRecord
    has_many :event_categories
    has_many :events, through: :event_categories
    validates :name, uniqueness: true

    def ordered_by_name
        self.events.order(:name)
    end

    def ordered_events
        self.events.order(:date)
    end
end
