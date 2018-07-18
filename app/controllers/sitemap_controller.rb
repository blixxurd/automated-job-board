class SitemapController < ApplicationController

    before_action :constants!
  
    def index
        render xml: "<sitemapindex xmlns='http://www.sitemaps.org/schemas/sitemap/0.9'>
            <sitemap>
            <loc>#{@site_url}/sitemaps/pages.xml</loc>
            </sitemap>
            <sitemap>
            <loc>#{@site_url}/sitemaps/jobs.xml</loc>
            </sitemap>
        </sitemapindex>"
    end

    def pages

    end

    def jobs

    end

    private

    def constants! 
        @site_url = request.original_url
    end

  end