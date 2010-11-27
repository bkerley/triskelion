Factory.define :party do |p|
end

Factory.define :player do |p|
  p.name 'Friendo'
  p.tripcode 'asdf'
end

Factory.define :roll do |r|
  # party_id:integer player_id:integer count:integer sides:integer result:integer description:text
  r.association :party
  r.association :player
  r.count 2
  r.sides 6
  r.result 7
  r.description '3 4'
end

Factory.define :chat do |c|
  # party_id:integer player_id:integer content:text
  c.association :party
  c.association :player
  c.content 'an awesome chat'
end
