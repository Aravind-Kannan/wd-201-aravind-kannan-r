def get_command_line_argument
  # ARGV is an array that Ruby defines for us,
  # which contains all the arguments we passed to it
  # when invoking the script from the command line.
  # https://docs.ruby-lang.org/en/2.4.0/ARGF.html
  if ARGV.empty?
    puts "Usage: ruby lookup.rb <domain>"
    exit
  end
  ARGV.first
end

# `domain` contains the domain name we have to look up.
domain = get_command_line_argument

# File.readlines reads a file and returns an
# array of string, where each element is a line
# https://www.rubydoc.info/stdlib/core/IO:readlines
dns_raw = File.readlines("zone")

# ..
# ..
def parse_dns(lines)
  records = {
    :A => [],
    :CNAME => [],
  }
  lines.each do |line|
    mod = line.split(",")
    if mod.first == "A"
      records[:A].append({ "#{mod[1]}".strip => "#{mod[2]}".strip })
    elsif mod.first == "CNAME"
      records[:CNAME].append({ "#{mod[1]}".strip => "#{mod[2]}".strip })
    end
  end
  print(records)
  return records
end

def resolve(dns_records, lookup_chain, domain)
  puts
end

# ..
# ..

# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")
