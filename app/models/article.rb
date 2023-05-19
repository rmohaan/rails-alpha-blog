class Article < ApplicationRecord
    validates :title, presence: true, length: {minimum: 6, maximum: 100}
    validates :description, presence: true, length: {minimum: 10, maximum: 3000}
    validates :genre, presence: true
end