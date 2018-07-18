class PagesController < ApplicationController

  before_action :register_globals!

  def index
    @page = (params[:page] && params[:page]).to_i > 0 ? params[:page].to_i : 1
    @per_page = 25
    @offset = (@page-1)*@per_page
    @jobs = JobListing.where(active: 1).offset(@offset).order({ created_at: :desc }).limit(@per_page)
    @seo_title = "Remote Digital Marketing & Social Media Jobs - Remote Digital"
  end

  def listing
    @jobs = JobListing.where(active: 1).order({ created_at: :desc }).limit(10)
    @listing = JobListing.find_by(slug: params[:page])
    @seo_title = "#{@listing.job_title} (Job Listing) - Remote Digital"
  end

  def redirect
    @seo_title = "Redirecting..."
  end

  def page
    @jobs = JobListing.where(active: 1).order({ created_at: :desc }).limit(10)
    @page = Page.find_by(slug: params[:page])
    render_404! unless @page
  end

  private

  def register_globals!
    @fields = CustomField.all
    @seo = SeoSetting.find_by(route: request.env['PATH_INFO'])
  end

  def render_404!
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end

end
