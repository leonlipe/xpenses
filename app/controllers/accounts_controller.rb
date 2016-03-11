class AccountsController < ApplicationController
	def index

		@active_menu_item = 'accounts'
	    @fecha_actual = DateTime.current
	    respond_to do |format|
	        format.html
	        format.json { render json: AccountsDatatable.new(view_context) }
	    end

	end


	def import
	  Account.import(params[:file])
	  redirect_to root_url, notice: "Products imported."
	end
end
