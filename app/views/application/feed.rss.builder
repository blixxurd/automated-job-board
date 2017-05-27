#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Remote Social Media Jobs"
    xml.description "Remote Social Media Jobs listings."
    xml.link "https://mywebsite.com/"
    xml.language "en"

    for job in @jobs
      link = "https://mywebsite.com/job/" + job.slug
      xml.item do
        if job.job_title
          xml.title job.job_title
        else
          xml.title ""
        end
        xml.pubDate job.created_at.to_s(:rfc822)
        xml.link link
        xml.guid job.id
        xml.description "A new job listing for a #{job.job_title} with #{job.company}. Learn more, and apply at #{link}."
      end
    end
  end
end
