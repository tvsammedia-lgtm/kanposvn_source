$env:PGPASSWORD="password"
psql -U postgres -c "CREATE DATABASE kanposvn_local;"
psql -U postgres -d kanposvn_local -f database\schema.sql
npm start
