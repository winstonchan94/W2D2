require_relative "employee"

class Manager < Employee

  attr_reader :employees

  def initialize(name, title, salary, boss, employees=[])
    @employees = employees
    super(name, title, salary, boss)
  end

  def bonus(multiplier)
    payroll.reduce(:+) * multiplier
  end

  def payroll
    return [self.salary] unless self.is_a?(Manager)

    payroll = []

    employees.each do |worker|
      if worker.is_a?(Manager)
        payroll += (worker.payroll << worker.salary)
      else
        payroll << worker.salary
      end
    end

    payroll
  end
end
