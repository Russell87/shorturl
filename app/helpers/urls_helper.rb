module UrlsHelper
#This only works if the document has OpenGraph title. Need to add additional tags, validation that
#a tag is present, and error messaging

    def link(url)
      resp = HTTParty.get(url)
      doc = Nokogiri::HTML(resp.body)


    return doc.at('meta[property="og:title"]')['content']


  end
end
