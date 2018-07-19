class SitemapController < ApplicationController

    before_action :constants!
  
    def index
        render xml: "<sitemapindex xmlns='http://www.sitemaps.org/schemas/sitemap/0.9'>
            <sitemap>
            <loc>#{@site_url}/sitemap/pages.xml</loc>
            </sitemap>
            <sitemap>
            <loc>#{@site_url}/sitemap/jobs.xml</loc>
            </sitemap>
        </sitemapindex>"
    end

    def pages
        str = "<url><loc>#{@site_url + '/'}</loc><lastmod>#{Date.parse('July 18 2018').strftime('%m-%d-%Y')}</lastmod></url>"
        render xml: "<urlset xmlns='http://www.sitemaps.org/schemas/sitemap/0.9'>#{str}</urlset>"
    end

    def jobs
        str = ''
        @jobs = JobListing.recent
        @jobs.each do |job|
            str << "<url>"
            str << "<loc>#{@site_url + '/job/' + job.slug}</loc>"
            str << "<lastmod>#{job.created_at.strftime('%m-%d-%Y')}</lastmod>"
            str << "</url>"
        end
        render xml: "<urlset xmlns='http://www.sitemaps.org/schemas/sitemap/0.9'>#{str}</urlset>"
    end

    private

    def constants! 
        uri = URI.parse(request.original_url)
        uri.scheme = "https"
        @site_url = uri.scheme + "://" + uri.hostname
    end

  end