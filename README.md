Repository for Pupilfirst WD-201 Course Assignments

## L2: Introduction to ruby

Assignment: Recursive DNS resolver

Location: <code>l2/</code>

Files:

- <code>lookup.rb</code> contains the code for:
  - <code>parse_dns</code> function converts the file into a source-destination hash along with record type tag
  - <code>resolve</code> function appends canonical records' destination to lookup_chain and calls itself recursively on the target. If the record is address, then it returns the lookup chain with final IPv4 address.
- <code>zone</code> contains various address and canonical records of diffrent domains

## L3: Object-oriented programming

Assignment: Implement a todo list using classes

Location: <code>l3/</code>

Files:

- <code>todos.rb</code> contains the code for:
  - <code>class Todo</code> contains the data members and related methods to check for status of each todo from(overdue, due_today, due_later) and also has a formatter method which formats the string into displayable todo in a list of todos
  - <code>class TodosList</code> contains data memeber to store the list of todos and methods to display the entire list and also to filter the tasks with a particular status from (overdue, due_today, due_later).
