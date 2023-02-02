require 'pg'

class DatabaseConnection

  def self.connect(database_name)
    @connection = PG.connect({host:'127.0.0.1', dbname:database_name})
  end

  def self.exec_params(query, params)
    if @connection.nil?
      raise 'Something wrong with the database'
    end

  @connection.exec_params(query,params)
  end
end
