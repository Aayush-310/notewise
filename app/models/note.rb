class Note < ApplicationRecord
    belongs_to :user
    serialize :tags, Array
    def self.search(query)
        where("title LIKE :query OR body LIKE :query OR tags LIKE :query", query: "%#{query}%")
    end
end
