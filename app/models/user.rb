class User < ApplicationRecord
    has_many :tickets
    has_many :bookmarks
    has_many :reviews
    has_many :events, through: :tickets
    has_many :events, through: :bookmarks
    has_secure_password

    validates :username, uniqueness: true

    def event_tickets
        self.tickets.map {|ticket| ticket.event}
    end

    def bookmarked_events
        self.bookmarks.map {|bookmark| bookmark.event}
    end
end
