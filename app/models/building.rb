class Building
  attr_accessor :name, :address, :height, :construction_date, :architect, :id

  def initialize(input_options)
    @name = input_options["name"]
    @address  = input_options["address"]
    @height = input_options["height"]
    @id = input_options["id"]
    @construction_date = input_options["construction_date"]
    @architect = input_options["architect"] 
  end

  def self.find(input_id) 
    response = HTTP.get("http://localhost:3000/api/buildings/#{input_id}")
    Building.new(response.parse) 
  end 

  def self.all
    response = HTTP.get("http://localhost:3000/api/buildings/")
    response.parse.map { |building_hash| Building.new(building_hash) }
  end 

  def self.create(building_info)
    response = HTTP.post("http://localhost:3000/api/buildings/", form: building_info)
    Building.new(response.parse)
  end 

  def self.edit(input_id)
    response = HTTP.get("http://localhost:3000/api/buildings/#{input_id}")
    # response
    Building.new()
  end 

end