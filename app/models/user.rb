class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    if user = find_by(uid: auth_info.uid)
      user
    else
      create({name: auth_info.extra.raw_info.name,
          screen_name: auth_info.extra.raw_info.screen_name,
          uid: auth_info.uid,
          profile_picture: auth_info.extra.raw_info.profile_image_url,
          oauth_token: auth_info.credentials.token,
          oauth_token_secret: auth_info.credentials.secret
          })
    end
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

  def description
    twitter_client.user.description
  end
end
