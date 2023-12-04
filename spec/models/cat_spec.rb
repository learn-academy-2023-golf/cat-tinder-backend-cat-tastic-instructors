# Model Specs

# name: 'Tobey', age: 7, enjoys: 'Teasing the dogs and eating cheese', image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'


require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should validate name" do 
    cat = Cat.create(age: 7, enjoys:'Teasing the dogs and eating cheese', image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80')

    expect(cat.errors[:name]).to_not be_empty
  end

  it "should have an age" do 
    cat = Cat.create(name: 'Tobey', enjoys: 'Teasing the dogs and eating cheese', image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80')

    expect(cat.errors[:age]).to_not be_empty
  end

  it "should enjoy stuff" do
    cat = Cat.create(name: 'Tobey', age: 7, image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80')

    expect(cat.errors[:enjoys]).to_not be_empty
  end
end
