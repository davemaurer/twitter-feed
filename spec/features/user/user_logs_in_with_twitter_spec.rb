require 'rails_helper'

RSpec.feature "the user" do
  before(:each) {
    stub_omniauth
  }

  it "logs in" do
    visit "/"

    expect(page.status_code).to eq(200)

    click_on("Login")

    expect(current_path).to eq("/")
    expect(page).to have_content("Dave")
    expect(page).to have_link("Logout")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
        provider: 'twitter',
        extra: {
          raw_info: {
            user_id: "007",
            name: "Dave",
            screen_name: "dmaurer",
          }
        },
        credentials: {
          token: "dogs",
          secret: "goldens"
        }
      })
  end
end
