require 'sqlite3'
require_relative '../config'

db = SQLite3::Database.new(DB_PATH)

puts "Använder databasen: #{DB_PATH}"
puts "🧹 Tar bort gamla tabeller..."
db.execute('DROP TABLE IF EXISTS todos')

puts "🧱 Skapar tabeller..."
db.execute('CREATE TABLE todos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            namn TEXT NOT NULL, 
            beskrivning TEXT,
            status INTEGER DEFAULT 0,
            kategori_id )')

db.execute('CREATE TABLE kategorier (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            namn TEXT NOT NULL )')

puts "🍎 Fyller på med data..."
db.execute('INSERT INTO todos (namn, beskrivning, status, kategori_id) VALUES ("Köp mjölk", "3 lite mellanmjölk, eko", 1, 2)')
db.execute('INSERT INTO todos (namn, beskrivning, status, kategori_id) VALUES ("Köp julgran", "En rödgran", 0, 2)')
db.execute('INSERT INTO todos (namn, beskrivning, status, kategori_id) VALUES ("Pynta gran", "Glöm inte lamporna i granen och tomten", 0, 1)')
db.execute('INSERT INTO kategorier (namn) VALUES ("privat")')
db.execute('INSERT INTO kategorier (namn) VALUES ("köp")')
db.execute('INSERT INTO kategorier (namn) VALUES ("jobb")')


puts "✅ Databasen är seedad!"