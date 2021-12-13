class Article < ApplicationRecord
    validates :title, presence: true, length: { minimum: 4, maximum: 15 } 
    validates :description, presence: true
end
