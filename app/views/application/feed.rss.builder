#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Remote Digital Marketing Jobs"
    xml.description "Remote Digital Marketing job listings."
    xml.link "https://remotedigitaljobs.com/"
    xml.language "en"

    for job in @jobs
      xml.item do
        if job.job_title
          xml.title job.job_title
        else
          xml.title ""
        end
        xml.pubDate job.created_at.to_s(:rfc822)
        xml.link job.bitly
        xml.guid job.id
        xml.description "A new job listing for a #{job.job_title} with #{job.company}. Learn more, and apply at #{job.bitly}."
      end
    end
  end
end
