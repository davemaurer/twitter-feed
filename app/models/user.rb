class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    user = find_or_create_by(uid: auth_info.uid)
    #so we can make sure changes are reflected. update_attributes and find_or_create_by are built in methods
    user.update_attributes(
      name:               auth_info.extra.raw_info.name,
      screen_name:        auth_info.extra.raw_info.screen_name,
      profile_picture:    auth_info.extra.raw_info.profile_image_url,
      oauth_token:        auth_info.credentials.token,
      oauth_token_secret: auth_info.credentials.secret
    )

    user
  end

  def twitter_client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['twitter_key']
      config.consumer_secret = ENV['twitter_secret']
      config.access_token = oauth_token
      config.access_token_secret = oauth_token_secret
    end
  end

  def twitter_timeline
    twitter_client.home_timeline
  end

  def follower_count
    twitter_client.user.followers_count
  end

  def following_count
    twitter_client.user.friends_count
  end

  def background_picture
    twitter_client.user.profile_background_image_url_https
  end

  def location
    twitter_client.user.location
  end
end
