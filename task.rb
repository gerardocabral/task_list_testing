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

class TaskList
  def initialize
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

class DueDateTask < Task #Date.today.month

   def initialize t, d, day, year, month
     super(t,d)
     @day = day
     @year = year
     @month = month
   end

   def day
     @day
   end

   def year
     @year
   end

   def month
     @month
   end

   def print_date
     "#{@month}/#{@day}/#{@year}"
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
