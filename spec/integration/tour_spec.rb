require 'rails_helper'

describe 'Tour API' do
  before(:each) do
    @api_key = APP_CONFIG[:api_key]
    @user = create(:user)
    @tour_categories = create(:tour_category)
    @tours = create_list(:tour, 5)
  end

  it "get all tour" do
    get '/api/tours', :format => :json, :api_key => @api_key, :auth_token => @user
    expect(response.status).to eq(200)
    json = json(response.body)
    expect(json.class).to eq(Hash)
    tours = json[:tours]
    expect(tours.length).to eq(5)
    expect(json[:total_page].class).to eq(Fixnum)
    expect(json[:current_page].class).to eq(Fixnum)
    for i in 0..(tours.length - 1)
      expect(tours[i][:id].class).to eq(Fixnum)
      expect(tours[i][:name].class).to eq(String)
    end
  end
  
  it "get tour by keyword" do
    get '/api/tours', :format => :json, :api_key => @api_key, :auth_token => @user, :keyword => "Tour-1"
    expect(response.status).to eq(200)
    json = json(response.body)
    expect(json.class).to eq(Hash)
    tours = json[:tours]
    expect(tours.length).to eq(1)
    expect(json[:total_page].class).to eq(Fixnum)
    expect(json[:current_page].class).to eq(Fixnum)
    for i in 0..(tours.length - 1)
      expect(tours[i][:id].class).to eq(Fixnum)
      expect(tours[i][:name].class).to eq(String)
    end
  end
  
  it "get tour by tour category id" do
    get '/api/tours', :format => :json, :api_key => @api_key, :auth_token => @user, :tour_category_id => TourCategory.first.id
    expect(response.status).to eq(200)
    json = json(response.body)
    expect(json.class).to eq(Hash)
    tours = json[:tours]
    expect(tours.length).to eq(5)
    expect(json[:total_page].class).to eq(Fixnum)
    expect(json[:current_page].class).to eq(Fixnum)
    for i in 0..(tours.length - 1)
      expect(tours[i][:id].class).to eq(Fixnum)
      expect(tours[i][:name].class).to eq(String)
    end
  end
  
  it "create tour successful" do
    count_before_create = Tour.count
    post '/api/tours', :format => :json, :api_key => @api_key, :auth_token => @user, :tour => {:name => "Tour Name", code: "1234", tour_category_id: TourCategory.first.id}
    expect(response.status).to eq(200)
    json = json(response.body)
    count_after_create = Tour.count
    expect(count_after_create).to eq(count_before_create + 1)
    expect(json[:status]).to eq('successful')
  end
  
  it "create tour categories will be error if not supplied tour category name" do
    post '/api/tours', :format => :json, :api_key => @api_key, :auth_token => @user, :tour => {:attribute => "Tour Name"}
    expect(response.status).to eq(422)
    json = json(response.body)
    expect(json[:status]).to eq('failed')
  end
  
  it "edit tour categories with valid id" do
    get '/api/tours/' + Tour.first.id.to_s + '/edit', :format => :json, :api_key => @api_key, :auth_token => @user
    expect(response.status).to eq(200)
    json = json(response.body)
    expect(json.class).to eq(Hash)
    expect(json[:id].class).to eq(Fixnum)
    expect(json[:name].class).to eq(String)
  end
  
  it "edit tour with invalid id" do
    get '/api/tours/100/edit', :format => :json, :api_key => @api_key, :auth_token => @user, :keyword => "Tour Category-1"
    expect(response.status).to eq(422)
    json = json(response.body)
    expect(json.class).to eq(Hash)
    expect(json[:status]).to eq('failed')
    expect(json[:errors]).to eq('No such Tour')
  end
  
  it "update tour successful" do
    put '/api/tours/' + Tour.first.id.to_s, :format => :json, :api_key => @api_key, :auth_token => @user, :tour => {:name => "Tour Name"}
    expect(response.status).to eq(200)
    json = json(response.body)
    expect(json[:status]).to eq('successful')
  end
  
  it "update tour with invalid id" do
    put '/api/tours/100', :format => :json, :api_key => @api_key, :auth_token => @user, :tour => {:name => "Tour Name"}
    expect(response.status).to eq(422)
    json = json(response.body)
    expect(json[:status]).to eq('failed')
    expect(json[:errors]).to eq('No such Tour')
  end
  
end