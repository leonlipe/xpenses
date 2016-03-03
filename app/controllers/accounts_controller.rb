class AccountsController < ApplicationController
	def index

	end


	def import
	  Account.import(params[:file])
	  redirect_to root_url, notice: "Products imported."
	end
end
