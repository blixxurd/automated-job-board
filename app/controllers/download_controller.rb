class DownloadController < ApplicationController

  def page
    @dl = Download.find_by(slug: params[:page])
    if @dl.nil?
      render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    end
  end

end
