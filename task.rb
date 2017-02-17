class Task
  def initialize t, d
    @title = t
    @description = d
    @status = ""

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

  def not_done
    @status = "incomplete"
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

  def completed
    tasks.select { |task| task.status == "complete" }
  end

  def incomplete
    tasks.select {|task| task.status == "incomplete" }
  end

  def incomplete_due_today
    incomplete.select { |task|  task.day == Date.today.day.to_s }
  end

  def incomplete_ordered_by_day
    incomplete.sort_by { |a| [a.day] }
  end

  # def incomplete_tasks_ordered_by_day
  #   incomplete_tasks.sort_by {|a|
  #     if a.class == DueDateTask
  #       return [a.day]
  #     }
  #     end
  # end

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
