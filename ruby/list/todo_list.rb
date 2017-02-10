class TodoList 
# this class has one attribute: an array that holds a list of tasks to do

  def initialize(task_list)
    # accept an array of initial tasks to do
    # make that task list an instance variable so it can be accessed from all methods in this class
    @task_list = task_list
    # return array of initial tasks
  end

  def get_items 
    # return current task list array
    @task_list
  end

  def add_item(new_task)
    # accept a new task that will be added to the task list array
    @task_list << new_task
    # return revised task list array
  end

  def delete_item(task_to_delete)
    # delete a specific item from the task list array
    @task_list.delete(task_to_delete)
    # return revised task list
  end 

  def get_item(index)
    # get a task list item that corresponds to the given index
    @task_list[index]
    # return task list item that was found
  end


end