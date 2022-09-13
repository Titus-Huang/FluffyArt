require 'pg'

def run_sql(sql, sql_params = [])
    db = PG.connect(ENV['DATABASE URL'] || {dbname: 'kasuns_donuts'})
    results = db. exec_params(sql, sql_params)
    db.close
    results
end
