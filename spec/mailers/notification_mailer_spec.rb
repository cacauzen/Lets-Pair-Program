require "rails_helper"

RSpec.describe NotificationMailer, type: :mailer do
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post, :user => @user)
    NotificationMailer.post_created(@post).deliver_now
  end
  after(:each) do
    ActionMailer::Base.deliveries.clear
  end
  it 'sends an email' do
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
  it 'generates multipart headers' do
    expect(ActionMailer::Base.deliveries.first.content_type).to start_with('text/html')
  end
  it 'renders correct receiver email' do
    expect(ActionMailer::Base.deliveries.first.to).to contain_exactly(@post.user.email)
  end
  it 'sets the correct subject' do
    expect(ActionMailer::Base.deliveries.first.subject).to eq("You created Post #{@post.title} at #{@post.created_at}")
  end
  it 'renders correct sender email' do  
    expect(ActionMailer::Base.deliveries.first.from).to contain_exactly('no-reply@thefirehoseproject.com')
  end
end
