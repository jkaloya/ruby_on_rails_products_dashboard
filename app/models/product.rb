class Product < ActiveRecord::Base
    belongs_to :category
    has_many :comments, dependent: :destroy
    validates :name, :description, :pricing, presence: true
    validates :pricing, numericality: true
end
