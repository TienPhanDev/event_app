class Review < ApplicationRecord
    belongs_to :user
    belongs_to :event

    def reviewed_event
        self.class.select('events.*').joins(:event).where("reviews.id = #{self.id}")
    end
end
