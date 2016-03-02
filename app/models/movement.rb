class Movement < ActiveRecord::Base
    belongs_to :account
    belongs_to :category



    def print_kind
    	if self.kind == 0
    		"Cargo"
    	else
    		"Abono"
    	end
    end
end
