class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :redirect_subdomain

  def feed
    @jobs = JobListing.where(active: 1).order({ created_at: :desc }).limit(25)
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def redirect_subdomain
    if request.host == 'www.remotedigitaljobs.com'
      redirect_to 'https://remotedigitaljobs.com' + request.fullpath, :status => 301
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
