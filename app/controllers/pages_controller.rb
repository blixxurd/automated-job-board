class PagesController < ApplicationController

  def index
    @page = (params[:page] && params[:page]).to_i > 0 ? params[:page].to_i : 1
    @per_page = 25
    @offset = (@page-1)*@per_page
    @jobs = JobListing.where(active: 1).offset(@offset).order({ created_at: :desc }).limit(@per_page)
  end

  def listing
    @jobs = JobListing.where(active: 1).order({ created_at: :desc }).limit(10)
    @listing = JobListing.find_by(slug: params[:page])
  end

end
