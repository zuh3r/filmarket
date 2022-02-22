require 'pg'

def run_sql(sql, sql_params=[]) #sql_params=[] = default parameters
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'filmarket_db'})
    results = db.exec_params(sql, sql_params)
    db.close
    results
  end