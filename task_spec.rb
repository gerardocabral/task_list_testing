require 'rspec'
require_relative 'task'

# Story: As a developer, I can create a Task.
describe Task do
  it "must create a task object" do
    expect{Task.new("Title: Buy Food", "Description: milk, eggs")}.to_not raise_error
  end
  # Story: As a developer, I can give a Task a title and print it.
  it "must create a title and retrieve it" do
    task = Task.new("Title: Buy Food", "Description: milk, eggs")
    expect(task.title).to eq("Title: Buy Food")
  end
  # Story: As a developer, I can give a Task a description and print it.
  it "must give a description and retrieve it" do
    task = Task.new("Title: Buy Food", "Description: milk, eggs")
    expect(task.description).to eq("Description: milk, eggs")
  end
  # Story: As a developer, I can mark a Task done.
  it "must be able to mark a task as done" do
    #make the new task with Task.new(t,d)
    task = Task.new("Title: Buy Food", "Description: milk, eggs")
    #create a method that will change the task status to done "complete"
    task.done
    #create a method that returns the status of the task
    expect(task.status).to eq("complete")
    #expecting to have task.status to return task marked as "complete"
  end
  # Story: As a developer, when I print a Task that is done, its status is shown.
  # Hint: Implement to_s have it return the features of a Task with labels (for instance, "Title: Buy Food Description: Bananas, milk").
  it "must print task status and what the task is" do
    task = Task.new("Title: Buy Food", "Description: milk, eggs")
    task.done
    expect(task.to_s).to eq("Title: Buy Food, Description: milk, eggs - complete")
  end
end
# Story: As a developer, I can add all of my Tasks to a TaskList.
# Hint: A TaskList has-many Tasks
describe TaskList do
  it "must create a task list object" do
    expect{TaskList.new}.to_not raise_error
  end
  # Story: As a developer with a TaskList, I can get the completed items.
  it "must return the completed items from TaskList" do
    #create multiple tasks with status as done or unfinished
    task = Task.new("Title: Buy Food", "Description: milk, eggs")
    task.done
    task_1 = Task.new("Title: Laundry", "Description: Wash, dry, fold")
    task_1.done
    task_2 = Task.new("Title: Car Main.", "Description: change oil, wash, get gas")
    task_2.status
    task_list = TaskList.new
    # create a method that goes through all tasks and pulls out complete items
    task_list.store(task)
    task_list.store(task_1)
    task_list.store(task_2)
    task_list.tasks
    task_list.completed_tasks
    expect(task_list.completed_tasks).to include(task, task_1)
  end
  it "must return the completed items from TaskList" do
    #create multiple tasks with status as done or unfinished
    # Story: As a developer with a TaskList, I can get the incomplete items.
    task = Task.new("Title: Buy Food", "Description: milk, eggs")
    task.done
    task_1 = Task.new("Title: Laundry", "Description: Wash, dry, fold")
    task_1.done
    task_2 = Task.new("Title: Car Main.", "Description: change oil, wash, get gas")
    task_2.status
    task_list = TaskList.new
    # create a method that goes through all tasks and pulls out incomplete items
    task_list.store(task)
    task_list.store(task_1)
    task_list.store(task_2)
    task_list.tasks
    task_list.incomplete_tasks
    expect(task_list.incomplete_tasks).to include(task_2)
  end
end

# Story: As a developer, I can create a DueDateTask, which is-a Task that has-a due date.
# Hint: Use the built-in Ruby Date class
describe DueDateTask do
  it "has to create a Due Date object" do
    expect{DueDateTask.new("Title: Buy Food", "Description: milk, eggs", "17", "2017", "2")}.to_not raise_error
  end
  # Story: As a developer, I can print an item with a due date with labels and values.
  # Hint: When implementing to_s, use super to call to_s on the super class.
  it "must print an item with a due date w/ labels & values" do
    due_date = DueDateTask.new("Title: Buy Food", "Description: milk, eggs", "17", "2017", "2")
    expect(due_date.print_date).to eq("2/17/2017")
  end
  # Story: As a developer, I can add items with due dates to my TaskList.
  # Hint: Consider keeping items with due dates separate from the other items.
  it "has to add items with due dates to my TaskList" do
    task = Task.new("Title: Buy Food", "Description: milk, eggs")
    task.done
    task_list = TaskList.new
    task_list.store(task)
    task_due_date = DueDateTask.new("Title: Buy Food", "Description: milk, eggs", "17", "2017", "2")
    task_list.store(task_due_date)
    expect(task_list.tasks).to include(task, task_due_date)
  end
  # Story: As a developer with a TaskList, I can list all the not completed items that are due today.
  it "has to provide a list of not completed items due today" do
    #create tasks and tasks with due dates, have tasks not complete due today
  end
end







# Story: As a developer with a TaskList, I can list all the not completed items in order of due date.


# Story: As a developer with a TaskList with and without due dates, I can list all the not completed items in order of due date, and then the items without due dates.
