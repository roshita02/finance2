class RecordsController < ApplicationController
    def index
 	@records= Record.all
 	@balance=Record.balance
	@debt=Record.debt
 	@total=Record.total
 	end
 	
 	def create
	@records= Record.create(record_params)
	if @records.valid?
		flash[:success] = "Your record has been posted!"
		redirect_to root_path
 	else
		flash[:alert] = "Woops! Looks like there has been an error!"
	end
 	end
 	
 	def new
 		@record=Record.new
 	end
 	def edit
		 @records = Record.find(params[:id])
	end
	def update
		@records = Record.find(params[:id])
			if @records.update(record_params)
				flash[:success] = "The record has been updated!"
				redirect_to root_path
			else
				flash[:alert] = "Woops! Looks like there has been an error!"
				redirect_to edit_account_path(params[:id])
    		end
	end
	def destroy
		@records=Record.find(params[:id])
		@records.destroy
		flash[:success] = "The record was successfully deleted!"
		redirect_to root_path
	end
	
	private
	def record_params
		params.require(:record).permit(:title, :date , :amount)
	end
end


