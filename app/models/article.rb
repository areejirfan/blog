class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :title, :author, :body, presence:true
    validates :title, uniqueness: {scope: :author, message: 'Article must be unique against each author'}
    validates :body, length: { minimum: 10 }
end