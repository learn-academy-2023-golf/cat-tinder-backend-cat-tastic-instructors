# REQUESTS

require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do 
      # Create an active record entry to the test database
      Cat.create(
        name: 'Tobey',
        age: 7,
        enjoys: 'Teasing the dogs',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )
      # Make a request to the specific endpoint
      get '/cats'

      cat = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1

    end
  end

  describe "POST /create" do 
    it "creates a cat" do 
      # The params we are going to send with the request
      cat_params = {
        cat: {
          name: 'Tobey',
          age: 7,
          enjoys: 'Teasing the dogs',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }

      # Send the request to server and pass params
      post '/cats', params: cat_params 

      expect(response).to have_http_status(200)

      cat = Cat.first

      expect(cat.name).to eq 'Tobey'
      expect(cat.age).to eq 7
      expect(cat.enjoys).to eq 'Teasing the dogs'
      expect(cat.image).to eq 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
    end
  end

  describe "PATCH /update" do 
    it "updates a cat" do 
      cat_params = {
        cat: {
          name: 'Tobey',
          age: 7,
          enjoys: 'Teasing the dogs',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }

      post '/cats', params: cat_params 

      cat = Cat.first 

      updated_cat_params = {
        cat: {
          name: 'Tobey',
          age: 8,
          enjoys: 'Teasing the dogs and eating cheese',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }

      patch "/cats/#{cat.id}", params: updated_cat_params

      expect(response).to have_http_status(200)

      updated_cat = Cat.find(cat.id)
      expect(updated_cat.age).to eq 8
      expect(updated_cat.enjoys).to eq 'Teasing the dogs and eating cheese'
    end
  end

  describe "DELETE /destroy" do 
    it "deletes a cat" do 
      cat_params = {
        cat: {
          name: 'Tobey',
          age: 7,
          enjoys: 'Teasing the dogs',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }

      post '/cats', params: cat_params

      cat = Cat.first 

      delete "/cats/#{cat.id}"

      expect(response).to have_http_status(200)
      cats = Cat.all 
      expect(cats).to be_empty
    end
  end
end
