feature 'Basic Feature Test' do
  scenario 'Hello sinatra on screen' do
    visit '/'
    expect(page). to have_content("Hello Sinatra")
  end
end
