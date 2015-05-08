class Stylist
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    all_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    all_stylists.each() do |stylist|
      name = stylist.fetch("name")
      stylist_id = stylist.fetch("id").to_i
      id = stylist.fetch("id").to_i
      stylists.push(Stylist.new({:name => name, :id => id}))
    end
    stylists
  end

  define_singleton_method(:find) do |person|
      all_stylists = Stylist.all()
      found_stylist = nil
      all_stylists.each do |stylist|
        if person == stylist
          found_stylist = stylist
        end
      end
      found_stylist
  end

  define_method(:==) do |other|
    (self.name == other.name) && (self.id == other.id)
  end

  define_method(:save) do
    new_stylist = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = new_stylist.first.fetch("id").to_i()
  end

   define_method(:clients) do
    stylists_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
    clients.each() do |client|
      name = client.fetch("name")
      client_id = client.fetch("id").to_i()
      stylist_id = client.fetch("stylist_id").to_i()
      stylists_clients.push(Client.new({:name => name, :stylist_id => stylist_id, :id => client_id}))
    end
    stylists_clients
  end

end
