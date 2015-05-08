class Client
  attr_reader(:name, :stylist_id, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    all_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    all_clients.each() do |client|
      name = client.fetch("name")
      stylist_id = client.fetch("stylist_id").to_i
      id = client.fetch("id").to_i
      clients.push(Client.new({:name => name, :stylist_id => stylist_id, :id => id}))
    end
    clients
  end

  define_singleton_method(:find) do |person|
      all_clients = Client.all()
      found_client = nil
      all_clients.each do |client|
        if person == client
          found_client = client
        end
      end
      found_client
  end

  define_method(:==) do |other|
    (self.name == other.name) && (self.stylist_id == other.stylist_id) && (self.id == other.id)
  end

  define_method(:save) do
    new_client = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
    @id = new_client.first.fetch("id").to_i()
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name)
    @id = self.id
    DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  end

end
