# require 'rails_helper'
#
# RSpec.feature "the user" do
#   before(:each) do
#     stub_omniauth
#   end
#
#   xit "stubs request using VCR" do
#     VCR.use_cassette("j3_data") do
#       post :create, :twitter_handle => "j3"
#       assert_response :success
#       assert_not_nil assigns(:tweets)
#       assert_select "li.tweet"
#     end
#   end
#
#   def stub_omniauth
#     def stub_omniauth
#       # first, set OmniAuth to run in test mode
#       OmniAuth.config.test_mode = true
#       # then, provide a set of fake oauth data that
#       # omniauth will use when a user tries to authenticate:
#       OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
#           provider: 'twitter',
#           extra: {
#             raw_info: {
#               user_id: "88",
#               name: "Dave",
#               screen_name: "dave",
#             }
#           },
#           credentials: {
#             token: ENV["SAMPLE_OAUTH_TOKEN"],
#             secret: ENV["SAMPLE_OAUTH_TOKEN_SECRET"]
#           }
#         })
#     end
#   end
# end

# stub_request(:post, "https://api.twitter.com/oauth/request_token").
#   with(:headers => {'Accept' => '*/*', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization' => 'OAuth oauth_callback="http%3A%2F%2Flocalhost%3A3000%2Fauth%2Ftwitter%2Fcallback", oauth_consumer_key="tX2eekIsiFpULRkK1YWrdCHhK", oauth_nonce="oTsa94rAslBicEyiNYJUBIyRHzJRwBnhAP589rkKnY", oauth_signature="wMIKET0Zzp8PfsApp5hKa0%2BVEsY%3D", oauth_signature_method="HMAC-SHA1", oauth_timestamp="1437664324", oauth_version="1.0"', 'Content-Length' => '0', 'Content-Type' => 'application/x-www-form-urlencoded', 'User-Agent' => 'OAuth gem v0.4.7'}).
#   to_return(:status => 200, :body => "", :headers => {})
