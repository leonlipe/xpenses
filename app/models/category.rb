class Category < ActiveRecord::Base
    has_many :movements
end
