require("pg")

class SqlRunner

  def self.run(sql, values = []) # values array by default is empty is nothing is passed in.
      begin
        # begin
        db = PG.connect ({   dbname: "music_manager", host: "localhost"})
        db.prepare("query", sql)
        result = db.exec_prepared("query", values)
      ensure
        # This ensures the database is closed if it isn't already
        db.close() if db != nil
      end
      return result
  end

end
