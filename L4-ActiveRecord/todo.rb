require "active_record"

class Todo < ActiveRecord::Base
  def due_today?
    due_date == Date.today
  end

  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date
    "#{id}. #{display_status} #{todo_text} #{display_date}"
  end

  def self.to_displayable_list
    all.map { |todo| todo.to_displayable_string }
  end

  def self.show_list
    puts "My Todo-list"
    puts
    puts "Overdue"
    puts where("due_date < ?", Date.today).to_displayable_list
    puts
    puts "Due Today"
    puts where("due_date = ?", Date.today).to_displayable_list
    puts
    puts "Due Later"
    puts where("due_date > ?", Date.today).to_displayable_list
  end

  def self.add_task(taskDetails)
    Todo.create!(
      todo_text: taskDetails[:todo_text],
      due_date: Date.today + taskDetails[:due_in_days],
      completed: false,
    )
  end

  def self.mark_as_complete(todo_id)
    todo = find_by(id: todo_id)
    todo.completed = true
    todo.save
    find_by(id: todo_id)
  end
end
