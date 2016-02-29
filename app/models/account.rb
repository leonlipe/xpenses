class Account < ActiveRecord::Base

	belongs_to :bank
	hasm_many :movements
end
