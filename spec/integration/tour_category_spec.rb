require 'rails_helper'

describe 'Tour Category API' do
  before(:each) do
    @api_key = APP_CONFIG[:api_key]
    @user = create(:user)
    @tour_categories = create_list(:tour_category, 5)
  end

  it "get all tour categories" do
    get '/api/tour_categories', :format => :json, :api_key => @api_key, :auth_token => @user
    expect(response.status).to eq(200)
    json = json(response.body)
    expect(json.class).to eq(Hash)
    tour_categories = json[:tour_categories]
    expect(tour_categories.length).to eq(5)
    expect(json[:total_page].class).to eq(Fixnum)
    expect(json[:current_page].class).to eq(Fixnum)
    for i in 0..(tour_categories.length - 1)
      expect(tour_categories[i][:id].class).to eq(Fixnum)
      expect(tour_categories[i][:name].class).to eq(String)
    end
  end
  
  it "get tour categories by keyword" do
    get '/api/tour_categories', :format => :json, :api_key => @api_key, :auth_token => @user, :keyword => "Tour Category-1"
    expect(response.status).to eq(200)
    json = json(response.body)
    expect(json.class).to eq(Hash)
    tour_categories = json[:tour_categories]
    expect(tour_categories.length).to eq(1)
    expect(json[:total_page].class).to eq(Fixnum)
    expect(json[:current_page].class).to eq(Fixnum)
    for i in 0..(tour_categories.length - 1)
      expect(tour_categories[i][:id].class).to eq(Fixnum)
      expect(tour_categories[i][:name].class).to eq(String)
    end
  end
  
  it "create tour categories successful" do
    count_before_create = TourCategory.count
    post '/api/tour_categories', :format => :json, :api_key => @api_key, :auth_token => @user, :tour_category => {:name => "Tour Category Name"}
    expect(response.status).to eq(200)
    json = json(response.body)
    count_after_create = TourCategory.count
    expect(count_after_create).to eq(count_before_create + 1)
    expect(json[:status]).to eq('successful')
  end
  
  it "create tour categories will be error if not supplied tour category name" do
    post '/api/tour_categories', :format => :json, :api_key => @api_key, :auth_token => @user, :tour_category => {:attribute => "Tour Category Name"}
    expect(response.status).to eq(422)
    json = json(response.body)
    expect(json[:status]).to eq('failed')
  end
  
  it "edit tour categories with valid id" do
    get '/api/tour_categories/' + TourCategory.first.id.to_s + '/edit', :format => :json, :api_key => @api_key, :auth_token => @user
    expect(response.status).to eq(200)
    json = json(response.body)
    expect(json.class).to eq(Hash)
    expect(json[:id].class).to eq(Fixnum)
    expect(json[:name].class).to eq(String)
  end
  
  it "edit tour categories with invalid id" do
    get '/api/tour_categories/100/edit', :format => :json, :api_key => @api_key, :auth_token => @user
    expect(response.status).to eq(422)
    json = json(response.body)
    expect(json.class).to eq(Hash)
    expect(json[:status]).to eq('failed')
    expect(json[:errors]).to eq('No such Tour Category')
  end
  
  it "update tour categories successful" do
    put '/api/tour_categories/' + TourCategory.first.id.to_s, :format => :json, :api_key => @api_key, :auth_token => @user, :tour_category => {:name => "Tour Category Name"}
    expect(response.status).to eq(200)
    json = json(response.body)
    expect(json[:status]).to eq('successful')
  end
  
  it "update tour categories with invalid id" do
    put '/api/tour_categories/100', :format => :json, :api_key => @api_key, :auth_token => @user, :tour_category => {:name => "Tour Category Name"}
    expect(response.status).to eq(422)
    json = json(response.body)
    expect(json[:status]).to eq('failed')
    expect(json[:errors]).to eq('No such Tour Category')
  end
  
end