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
        str = "<url>Pages</url>"
        render xml: str
    end

    def jobs
        str = "<url>Jobs</url>"
        render xml: str
    end

    private

    def constants! 
        uri = URI.parse(request.original_url)
        uri.scheme = "https"
        @site_url = uri.scheme + "://" + uri.hostname
    end

  end