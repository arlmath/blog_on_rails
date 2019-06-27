class Article < ApplicationRecord   
    
    validates :name,:text, 
    presence: true,
    length: { minimum: 3 ,maximum:10}
    has_many :comments,dependent: :destroy
    validates :name,presence:true,
    length: { minimum: 3}
end
