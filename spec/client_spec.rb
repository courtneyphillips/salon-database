require('spec_helper')

describe(Client) do

  describe('#==') do
    it("recognizes equivalency between objects") do
      test_client  = Client.new({:name => "Scary Spice", :stylist_id => nil, :id => nil})
      test_client2 = Client.new({:name => "Scary Spice", :stylist_id => nil, :id => nil})
      expect(test_client).to(eq(test_client2))
    end
  end

  describe('#save') do
    it("records record of the client") do
      test_client  = Client.new({:name => "Scary Spice", :stylist_id => 1, :id => nil})
      test_client.save()
      expect(Client.all).to(eq([test_client]))
    end
  end

  describe('.find') do
    it("locates and returns a specific client record") do
      test_client  = Client.new({:name => "Scary Spice", :stylist_id => 1, :id => nil})
      test_client.save()
      expect(Client.find(test_client)).to(eq(test_client))
    end
  end

  describe('#name') do
    it("returns a clients name") do
      test_client  = Client.new({:name => "Scary Spice", :stylist_id => 1, :id => nil})
      test_client.save()
      expect(test_client.name()).to(eq("Scary Spice"))
    end
  end

  describe('#stylist_id') do
    it("returns the id of the clients stylist") do
      test_client  = Client.new({:name => "Scary Spice", :stylist_id => 1, :id => nil})
      test_client.save()
      expect(test_client.stylist_id()).to(eq(1))
    end
  end

  describe('#id')  do
    it("returns a clients unique id") do
      test_client  = Client.new({:name => "Scary Spice", :stylist_id => 1, :id => nil})
      test_client.save()
      expect(test_client.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#update") do
    it("updates a clients entry in the database") do
      test_client = Client.new({:name => "Scary Spice", :stylist_id => 1, :id => nil})
      test_client.save()
      test_client.update({:name => "Baby Spice"})
      expect(test_client.name()).to(eq("Baby Spice"))
    end
  end

  describe("#delete") do
    it("removes a clients entry from the database") do
      test_client  = Client.new({:name => "Scary Spice", :stylist_id => 1, :id => nil})
      test_client.save()
      test_client2 = Client.new({:name => "Baby Spice", :stylist_id => 1, :id => nil})
      test_client2.save()
      test_client.delete()
      expect(Client.all()).to(eq([test_client2]))
    end
  end
  
end
