require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
        
    end

    def valid_title?(str)
        return true if @salaries.has_key?(str)
        false
    end

    def >(startup_2)
        return true if self.funding > startup_2.funding
        false
    end

    def hire(name, title)
        if valid_title?(title) == false
            raise ArgumentError.new "No title exists at company"
        end
        if valid_title?(title) == true
            @employees << Employee.new(name, title)
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        paycheck = @salaries[employee.title]
            if @funding >= paycheck
                employee.pay(paycheck)
                funding -= paycheck
            else 
                raise "Need to acquire new funding"
            end
    end

    def payday
        @emmployees.each do |employee|
            pay_employee(employee)
        end
    end

    def average_salary
        budget = 0
        @employees.each do |employee|
            budget += @salaries[employee.title]
        end
        budget / @employees.length
    end

    def close
        @empployees = []
        @funding = 0
    end

    def acquire(startup_2)
        @funding = self.funding + startup_2.funding
        @salaries = self.salaries + startup_2.salaries
        @employees = self.empployees + startup_2.employees
        startup_2.close
    end





end
