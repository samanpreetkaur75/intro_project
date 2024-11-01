require 'net/http'
require 'json'

# Fetch the list of breeds
url = 'https://dog.ceo/api/breeds/list/all'
response = Net::HTTP.get(URI(url))
breed_data = JSON.parse(response)["message"]

# Create Breeds and fetch random images
breed_data.each do |breed, sub_breeds|
  if sub_breeds.empty?
    breed_record = Breed.create!(name: breed)
    image_response = Net::HTTP.get(URI("https://dog.ceo/api/breed/#{breed}/images/random"))
    image_url = JSON.parse(image_response)["message"]
    Image.create!(url: image_url, breed: breed_record)
  else
    sub_breeds.each do |sub_breed|
      breed_record = Breed.create!(name: breed, sub_breed: sub_breed)
      image_response = Net::HTTP.get(URI("https://dog.ceo/api/breed/#{breed}/#{sub_breed}/images/random"))
      image_url = JSON.parse(image_response)["message"]
      Image.create!(url: image_url, breed: breed_record)
    end
  end
end
