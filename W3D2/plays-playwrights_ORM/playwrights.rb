require 'sqlite3'
require 'singleton'
require_relative 'plays'

class Playwright

  def self.all
    entries = PlaywrightDBConnection.instance.execute(<<-SQL)
      SELECT * FROM playwrights
    SQL
    entries.map { |entry| Playwright.new(entry) }
  end

  def self.find_by_name(name)
    entry = PlaywrightDBConnection.instance.execute(<<-SQL, name)
      SELECT *
      FROM playwrights
      WHERE name = ?
    SQL
    Playwright.new(entry)
  end

  def initialize(entry)
    
  end
end
