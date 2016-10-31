module UrlsHelper

    def link(url)
      resp = HTTParty.get(url)
      doc = Nokogiri::HTML(resp.body)

      sitename    = doc.at('meta[property="og:site_name"]')['content']
      title       = doc.at('meta[property="og:title"]')['content']
      description = doc.at('meta[property="og:description"]')['content']
      image       = doc.at('meta[property="og:image"]')['content']
      return title
      
  end
end
