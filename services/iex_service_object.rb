class IEXServiceObject
  def client
    return(
      IEX::Api::Client.new(
        publishable_token: iex_publishable_token,
        secret_token: iex_secret_token,
        endpoint: 'https://cloud.iexapis.com/v1',
      )
    )
  end

  private

  def iex_publishable_token
    return 'pk_714d506665774bd4911a522edde00754'
  end

  def iex_secret_token
    return 'sk_5a1c52d71b9a4d1d880b1f44646e44af'
  end
end
