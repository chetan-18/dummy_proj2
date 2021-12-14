class User < ApplicationRecord 
    before_save {self.email = email.downcase}       # here self refers to current object
    has_many :articles
    validates :username, presence: true,
                         uniqueness: {case_sensitive: false},
                         length: {minimum: 4, maximum: 15}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                    uniqueness: true, 
                    length: {minimum: 8, maximum: 25},
                    format: {with: VALID_EMAIL_REGEX}
end     
