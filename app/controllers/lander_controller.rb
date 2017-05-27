class LanderController < ApplicationController

  def show
    @page = Lander.find_by(url_slug: params[:page])
    if @page.nil?
      render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    end
  end

end
