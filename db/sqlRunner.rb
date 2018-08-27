require('pg')

class SqlRunner

  def self.run( sql, values = [] )
    begin
      # db = PG.connect({ dbname: 'rentaswag', host: 'localhost' })
      # db.prepare("query", sql)
      # result = db.exec_prepared( "query", values )
      PG.connect( {dbname: 'd778be1f43pf4d',
        host: 'ec2-54-217-245-9.eu-west-1.compute.amazonaws.com',
        port: 5432, user: 'ejkhqxirbzskhe', password: '7c5e2ff38d93720c80192f1e128f3e49c8ca017161cb456eda54e9fc4861a322'})
      ensure
        db.close() if db != nil
      end
      return result
    end

  end
