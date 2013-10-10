get '/' do
  erb :index
end

post '/urls' do
  new_url = Url.create(original_url: params[:original_url], 
          shortened_url: Url.shorten,
          click_counter: 0)
  unless new_url.valid?
    erb :invalid
  else
  redirect to '/'
  end
end


get '/:short_url' do
  url = Url.where(shortened_url: params[:short_url]).first
  url.click_counter += 1
  url.save
  redirect url.original_url
end

