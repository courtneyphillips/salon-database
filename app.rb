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
#  @thisclient = Client.find(params.fetch("id").to_i())
  erb(:client)
end

get('/stylists/:id') do
#  @stylist = Stylist.find(params.fetch('id').to_i())
  erb(:stylist)
end
