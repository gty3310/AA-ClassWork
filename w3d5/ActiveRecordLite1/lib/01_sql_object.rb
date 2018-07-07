require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    if @cols.nil?
      @cols = DBConnection.execute2(<<-SQL)
        SELECT
        *
        FROM 
        cats
      SQL
      @cols = @cols.first.map{|col| col.to_sym}
    end
    
    @cols
  end

  def self.finalize!
    
    self.columns.each do |col|
      define_method(col) {self.attributes[col]}
      
      define_method("#{col}=") do |value| 
        self.attributes[col] = value
      end 
      
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
    
  end

  def self.table_name
    # ...
    @table_name || @table_name = 'cats'
  end

  def self.all
    # ...
    DBConnection.execute(<<-SQL)
      SELECT * 
      FROM "#{self.table_name}"
    SQL
    
    # self.parse_all(results)
  end

  def self.parse_all(results)
    # ...
    # new_cats = []
    results.each do |result|
      new_cat = self.new(result)
      new_cat.class.finalize!
    end 
    
    # new_cats
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    cols = self.class.columns
    params.each do |key, value|
      raise "unknown attribute '#{key}'" unless cols.include?(key.to_sym)
      self.send("#{key}=", value)
    end
  end

  def attributes
    @attributes || @attributes = Hash.new { |hash, key| hash[key] = 0 }
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
