class Task
  def initialize t, d
    @title = t
    @description = d
    @status = "unfinished"
  end

  def title
    @title
  end

  def description
    @description
  end

  def status
    @status
  end

  def done
    @status = "complete"
  end

  def to_s
    # title + description + status
    "#{title}, #{description} - #{status}"
  end
end

class TaskList < Task
  def initialize t, d
    super
   @tasks = []
  end

  def store(task)
    @tasks << task
  end

  def tasks
    @tasks
  end

  def completed_tasks
    tasks.select { |task| task.done }
  end

  def incomplete_tasks
    tasks.select {|task| task.status}
  end

end






# def finished
#   @finished
# end

# def finished
#   if @status == "complete"
#     "#{title}, #{description} - #{status}"
#   end
# end
