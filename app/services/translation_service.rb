require 'rest-client'

class TranslationService

  def self.translate_message(message, dialect)
    url = "http://api.funtranslations.com/translate/#{dialect}.json?text=#{URI.encode(message)}"

    response = RestClient.get url
    body = JSON.parse(response.body)
    body.dig('contents', 'translated')
  end
end