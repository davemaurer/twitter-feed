require 'rails_helper'

RSpec.feature "the user" do
  before(:each) {
    stub_omniauth
  }

  it "logs in" do
    visit "/"

    expect(page.status_code).to eq(200)

    click_on("Login with Twitter")

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("dmaurer")
  end

  it "logs out" do
    visit "/"

    click_on("Login with Twitter")

    expect(current_path).to eq("/dashboard")

    within(".nav") do
    click_link("Logout")
    end

    expect(current_path).to eq("/")
  end

  it "sees tweets" do
    visit "/"

    click_on("Login with Twitter")

    expect(page).to have_content("Feeding...Forever")
    expect(page).to have_content("1")
    expect(page).to have_content("20")
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
