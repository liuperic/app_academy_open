require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(employee_name, title)
        if self.valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "Invalid title"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = salaries[employee.title]
        if funding >= salary
            employee.pay(salary)
            @funding -= salary
        else
            raise "Not enough funds to pay salary"
        end
    end

    def payday
        @employees.each do |employee|
            self.pay_employee(employee)
        end
    end

    def average_salary
        total_salary = 0.0
        @salaries.keys.each do |title|
            number_of = @employees.count { |employee| employee.title == title }
            total_salary = total_salary + (number_of * @salaries[title])
        end
        total_salary / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding

        startup.salaries.each do |title, amount|
            if !valid_title?(title)
                @salaries[title] = amount
            end
        end

        @employees += startup.employees
        
        startup.close
    end

end