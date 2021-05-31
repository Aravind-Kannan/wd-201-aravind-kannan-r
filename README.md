Repository for Pupilfirst WD-201 Course Assignments

## L2: Introduction to ruby

Assignment: Recursive DNS resolver

Location: <code>l2/</code>

Files:

- <code>lookup.rb</code> contains the code for:
  - <code>parse_dns</code> function converts the file into a source-destination hash along with record type tag
  - <code>resolve</code> fucntion appends canonical records' destination to lookup_chain and calls itself recursively on the target. If the record is address, then it returns the lookup chain with final IPv4 address.
- <code>zone</code> contains various address and canonical records of diffrent domains
