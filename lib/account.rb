require 'date'

class Account
    attr_reader :balance, :transaction_history

    def initialize
        @balance = 0
        @transaction_history = []
        @total_balance = 0
    end

    def deposit(amount)
        @balance += amount
        date = Date.today.to_s

        @transaction_history << {
            :date => date,
            :credit => amount
        }
       
    end

    def withdraw(amount)
        @balance -= amount
        date = Date.today.to_s

        @transaction_history << {
            :date => date,
            :debit => amount
        }
    end

    def print
       puts "date || credit || debit || balance"
       @transaction_history.reverse_each do |transaction|
            date = nil
            credit = nil
            debit = nil
            balance = 0

            transaction.each do |key, value|
                if key == :date
                    date = value
                elsif key == :credit
                    credit = '%.2f' % value
                elsif key == :debit
                    debit = '%.2f' % value
                end
            end

            if credit == nil
                @total_balance -= debit.to_i
                puts "#{date} || || #{debit} || #{'%.2f' % @total_balance}"
            else
                @total_balance += credit.to_i
                puts "#{date} || #{credit} || || #{'%.2f' % @total_balance}"
            end
        end

    end
end