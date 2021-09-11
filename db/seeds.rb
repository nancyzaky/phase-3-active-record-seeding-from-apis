# Add seed data in this file
require 'pry'
puts "Seeding spells..."

spells = ["acid-arrow", "animal-messenger", "calm-emotions", "charm-person"]

spells.each do |spell|
resp = RestClient.get "https://www.dnd5eapi.co/api/spells/#{spell}"
spell_hash = JSON.parse(resp)

Spell.create(
  name: spell_hash["name"],
  level: spell_hash["level"],
  description: spell_hash["desc"][0]
)
end

puts"Done seeding!"