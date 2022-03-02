class IEXServiceObject
  def client
    return(
      IEX::Api::Client.new(
        publishable_token:
          Rails.application.credentials.iex[:publishable_token],
        secret_token: Rails.application.credentials.iex[:secret_token],
        endpoint: 'https://cloud.iexapis.com/v1',
      )
    )
  end
end
