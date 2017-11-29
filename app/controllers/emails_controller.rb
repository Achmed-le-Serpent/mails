class EmailsController < ApplicationController
	before_action :set_email, only: [:show, :edit, :update, :destroy]

	def index
		@emails = Email.all
	end

	def show
	end

	def new
		@email = Email.new
	end

	def edit
	end

	def create
		@email = Email.new(email_params)

		respond_to do |format|
			if @email.save
				format.html { redirect_to @email, notice: 'L\'email a été créé avec succès !' }
				format.json { render :show, status: :created, location: @email }
			else
				format.html { render :new }
				format.json { render json: @email.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @email.update(email_params)
				format.html { redirect_to @email, notice: 'L\'email a été modifié avec succès !' }
				format.json { render :show, status: :ok, location: @email }
			else
				format.html { render :edit }
				format.json { render json: @email.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@email.destroy
		respond_to do |format|
			format.html { redirect_to emails_url, notice: 'L\'email a été supprimé avec succès !' }
			format.json { head :no_content }
		end
	end

	private

	def set_email
		@email = Email.find(params[:id])
	end

	def email_params
		params.require(:email).permit(:object, :body)
	end
end
