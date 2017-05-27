class InputController < ApplicationController

  def submit_lead
    if params[:lead] && params[:lead][:email]
      @lead = Lead.create(email: params[:lead][:email])
      flash[:completed] = @lead
    else
      flash[:error] = "There was a problem with your email. Please try again."
    end
    redirect_to :back
  end

end
