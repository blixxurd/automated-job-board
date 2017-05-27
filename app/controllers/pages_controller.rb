class PagesController < ApplicationController

  def index
    @jobs = JobListing.where(active: 1).order({ created_at: :desc }).limit(25)
  end

  def listing
    @jobs = JobListing.where(active: 1).order({ created_at: :desc }).limit(10)
    @listing = JobListing.find_by(slug: params[:page])
  end

end
