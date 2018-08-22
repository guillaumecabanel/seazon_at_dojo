class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def slack
    @access_token = request_access_token

    logger.debug "@access_token is nil" unless @access_token
    redirect_to root_path and return unless @access_token

    auth = request_auth
    logger.debug "auth is nil" unless auth
    redirect_to root_path and return unless auth

    @user = User.from_omniauth(auth)

    if @user.persisted?
      logger.debug "User should be logged in"
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Slack") if is_navigational_format?
    else
      logger.debug "@user didn't persisted"
      redirect_to root_path
    end
  end

  def failure
    redirect_to root_path
  end

  private

  def request_access_token
    response = RestClient.get "#{ENV['SLACK_API_URL']}/oauth.access", params: {
      client_id:     ENV['SLACK_CLIENT_ID'],
      client_secret: ENV['SLACK_APP_SECRET'],
      code:          params[:code]
    }
    payload = JSON.parse(response.body)

    if payload['ok'] && payload['team']['id'] == ENV['SLACK_TEAM_ID']
      payload['access_token']
    else
      logger.debug payload
      nil
    end
  end

  def request_auth
    response = RestClient.get "#{ENV['SLACK_API_URL']}/users.identity", params: {
      token: @access_token
    }
    payload = JSON.parse(response.body)

    if payload['ok']
      payload
    else
      logger.debug payload
      nil
    end
  end
end
