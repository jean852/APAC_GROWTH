class RefreshtokenJob < ApplicationJob
  queue_as :default

  def perform(domain, location, name)


    require "uri"
    require "net/http"
    require "json"


    # LOOKUP FOR LINKEDIN URL

    company_domain = 'openai.com'
    company_location = ''
    company_name = 'OpenAI'

    url = URI("https://nubela.co/proxycurl/api/linkedin/company/resolve?company_location=#{company_location}&company_domain=#{company_domain}&company_name=#{company_name}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Accept"] = "application/json"
    request["Authorization"] = "Bearer #{ENV["NUBELA_BEARER"]}"

    response = https.request(request)
    # response.read_body

    data = JSON.parse(response.read_body)
    p data["url"]
    p "---"
    p "---"
    p "---"
    p "---"

    # LOOKUP LINKEDIN PROFILE / IF WE RECEIVED SOMETHING


    unless data["url"].nil?

      url = URI("https://nubela.co/proxycurl/api/linkedin/company?resolve_numeric_id=true&categories=include&funding_data=include&extra=include&exit_data=include&acquisitions=include&url=#{data["url"]}&use_cache=if-present")

      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true

      request = Net::HTTP::Get.new(url)
      request["Accept"] = "application/json"
      request["Authorization"] = "Bearer #{ENV["NUBELA_BEARER"]}"

      response = https.request(request)
      response.read_body

      data = JSON.parse(response.read_body)
      p "---"
      p data["name"]
      p "---"
      p data["description"]
      p "---"
      p data["website"]
      p "---"
      p data["industry"]
      p "---"
      p data["hq"]["city"]
      p "---"
      p data["specialities"]
      p "---"
      p "---"

      return data
    end
  end
end
