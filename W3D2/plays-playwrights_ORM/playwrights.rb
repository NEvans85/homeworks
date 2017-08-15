require 'byebug'
require 'sqlite3'
require 'singleton'
require_relative 'plays'

class Playwright

  def self.all
    entries = PlaysDBConnection.instance.execute(<<-SQL)
      SELECT * FROM playwrights
    SQL
    entries.map { |entry| Playwright.new(entry) }
  end

  def self.find_by_name(name)
    entry = PlaysDBConnection.instance.execute(<<-SQL, name)
      SELECT *
      FROM playwrights
      WHERE name = ?
    SQL
    Playwright.new(entry.first)
  end

  attr_reader :name, :birth_year, :id

  def initialize(options)
    @name = options['name']
    @brith_year = options['birth_year']
    @id = options['id']
  end

  def create
    raise "#{@name} is already in the database" if @id
    PlaysDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwrights(name, birth_year)
      VALUES
        (?, ?)
    SQL
  end

  def update
    raise "#{@name} is not present in database" unless @id
    PlaysDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
      UPDATE
        playwrights(name, birth_year)
      VALUES
        ?, ?
      WHERE
        id = ?
    SQL
  end

  def get_plays
    raise "#{@name} is not present in database" unless @id
    plays_data = PlaysDBConnection.instance.execute(<<-SQL, @id)
      SELECT
        id, title, year
      FROM
        plays
      WHERE
        playwright_id = ?
    SQL
    plays_data.map { |play_data| Play.new(play_data) }
  end
end
