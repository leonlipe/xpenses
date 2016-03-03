class Movement < ActiveRecord::Base
    belongs_to :account
    belongs_to :category

	def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
	    Movement.create! row.to_hash
	  end
	end

    def print_kind
    	if self.kind == 0
    		"Cargo"
    	else
    		"Abono"
    	end
    end
end
