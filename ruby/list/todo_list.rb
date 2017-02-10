class TodoList 

  def initialize(task_list)
    @task_list = task_list
  end

  def get_items 
    @task_list
  end

  def add_item(new_task)
    @task_list << new_task
  end

  def delete_item(task_to_delete)
    @task_list.delete(task_to_delete)
  end 

  def get_item(index)
    @task_list[index]
  end


end