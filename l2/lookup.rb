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

def parse_dns(lines)
  records = {}
  lines.each do |line|
    mod = line.split(",")
    if mod.first == "A"
      records["#{mod[1]}".strip] = ["#{mod[2]}".strip, "A"]
    elsif mod.first == "CNAME"
      records["#{mod[1]}".strip] = ["#{mod[2]}".strip, "CNAME"]
    end
  end
  return records
end

def resolve(dns_records, lookup_chain, domain)
  if dns_records[domain] != nil
    dest = dns_records[domain]
    lookup_chain.append(dest.first)
    if dest.last == "A"
      return lookup_chain
    elsif dest.last == "CNAME"
      resolve(dns_records, lookup_chain, dest.first)
    end
  else
    puts "Error: record not found for #{domain}"
    exit
  end
end

# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")