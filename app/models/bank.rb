class Bank < ActiveRecord::Base
    has_many :movements
end
