class Dashboard::Application::ClientsController < ApplicationController
  def create
    @client = Client.create!(params[:client])
    current_user.apps << @client
    # flash[:notice] = "current_user's id: #{current_user.id}"
    flash[:notice] = "A new Client Application has been submitted!"
    redirect_to '/dashboard'
  end
  def index
  	@clients = Client.all
<<<<<<< HEAD

=======
>>>>>>> 6b9379cc8db4bc1a98ea8200a22493d7e6231371
  end
end
