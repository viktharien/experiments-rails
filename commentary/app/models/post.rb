class Post < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: { minimum: 3, maximum: 50 }
    validates :body, presence: true, length: { length: 10, maximum: 300 }
    validates :user_id, presence: true
    validates :category_id, presence: true
end
