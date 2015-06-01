class Movement < ActiveRecord::Base
    belongs_to :bank
    belongs_to :category
end
