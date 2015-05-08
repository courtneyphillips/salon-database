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

end
