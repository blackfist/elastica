require 'elasticsearch'
require 'multi_json'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [search term]"
  opts.on("-v", "--verbose") do |v|
    options[:verbose] = v
  end
end.parse!

if ARGV.size == 0
  raise ArgumentError, "No search term provided"
end

client = Elasticsearch::Client.new log: false, host: "10.190.30.124"

if options[:verbose]
  puts MultiJson.dump(client.cluster.health, pretty: true)
  puts MultiJson.dump(client.cat.indices, pretty:true)
end

results = []
ARGV.each do |term|
  resp = client.search index: 'vcdb', body: {query: {match: {summary:ARGV[0]}}}
  results += resp['hits']['hits']
end

puts "Found #{results.size} incidents"

results.each_with_index do |value, idx|
  incident = value['_source']
  puts "#{idx+1}: #{incident['victim']['victim_id']}: #{incident['timeline']['incident']['year']}"
end
