Ransack.configure do |config|
  config.add_predicate 'has_every_term',
    arel_predicate: 'matches_all',
    formatter: proc {|v| "%#{v}%"}
end