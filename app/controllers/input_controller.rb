class InputController < ApplicationController

  def submit_lead
    if params[:lead] && params[:lead][:email]
      @lead = Lead.create(email: params[:lead][:email])
      if @lead.valid?
        flash[:success] = "Thank you! We will begin emailing you weekly job alerts shortly."
      else
        flash[:error] = "We couldn't save your email address. Usually this is because you are already part of our mailing list."
      end
    else
      flash[:error] = "There was a problem with your email. Please try again."
    end
    redirect_to "/"
  end

end
