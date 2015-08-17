class Pokemon
  # attr_accessor :id, :name, :type 

  # def initialize(db)
  #   @id = id
  #   @name = name 
  #   @db = db
  #   @type = type 
  # end 

#   def self.save 
#     db  = SQLite3::Database.new('pokemon.db')
#     ins = db.prepare('INSERT INTO pokemon (name, type ) values (?, ?)')
# string.each { |s| ins.execute(s) }
#   end 

  def self.save(name, type, db) 
  sql = " INSERT INTO pokemon (name, type) VALUES (?, ?) "
    db.execute(sql, name, type)
  end
end