require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "hair_salon"})

get("/") do
  erb(:index)
end

get("/stylists") do
  @stylists = Stylist.all()
  erb(:stylists)
end

get("/clients") do
  @clients = Client.all()
  erb(:clients)
end

get("/clients/new") do
  @stylists = Stylist.all()
  erb(:client_form)
end

get("/stylists/new") do
  erb(:stylist_form)
end

post("/clients/new") do
  name = params.fetch('name')
  stylist_id = params.fetch('stylist_id').to_i()
  new_client = Client.new({:name => name, :stylist_id => stylist_id, :id => nil})
  new_client.save()
  redirect('/clients')
end

post("/stylists/new") do
  name = params.fetch('name')
  new_stylist = Stylist.new({:name => name, :id => nil})
  new_stylist.save()
  redirect('/stylists')
end

get('/clients/:id') do
  @client = Client.find(params.fetch("id"))
  erb(:client)
end

get("/client/:id/edit") do
  @client = Client.find(params.fetch("id"))
  erb(:client_edit)
end

patch("/clients/:id") do
  name = params.fetch("name")
  @client = Client.find(params.fetch("id").to_i())
  @client.update({:name => name})
  erb(:client)
end

delete("/client/:id") do
  @client = Client.find(params.fetch("id").to_i())
  @client.delete()
  @clients = Client.all()
  redirect to ('/clients')
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id"))
  @stylist_clients = @stylist.clients()
  erb(:stylist)
end

get("/stylists/:id/edit") do
  @stylist = Stylist.find(params.fetch("id"))
  erb(:stylist_edit)
end

patch("/stylists/:id") do
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
  redirect to('/stylists')
end

delete("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  redirect to('/stylists')
end
