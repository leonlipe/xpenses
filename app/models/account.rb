class Account < ActiveRecord::Base

	belongs_to :bank
	has_many :movements


	def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
	    Account.create! row.to_hash
	  end
	end
end
