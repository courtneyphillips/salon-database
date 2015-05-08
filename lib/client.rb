class Client
  attr_reader(:name, :stylist_id, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)
    @id = attributes.fetch(:id)
  end

  define_method(:==) do |other|
    (self.name == other.name) && (self.stylist_id == other.stylist_id) && (self.id == other.id)
  end



end
