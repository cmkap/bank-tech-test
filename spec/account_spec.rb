require 'account'

describe Account do
    subject(:account){ Account.new }
    it { is_expected.to respond_to(:balance, :deposit, :withdraw, :transaction_history) }

    it "has a starting balance of zero" do
        expect(account.balance).to eq(0)
    end

    it "can have deposits made on the account" do
        account.deposit(1000)
        expect(account.balance).to eq(1000)
    end

    it "can have withdrawals made on the account" do
        account.deposit(1000)
        account.withdraw(500)
        expect(account.balance).to eq(500)
    end

    describe '#transaction_history' do
        context 'when money deposited' do
            it 'returns the transaction history' do
                account.deposit(1000)
                expect(account.transaction_history).to eq([{
                    :date => Date.today.to_s,
                    :credit => 1000
                }])
            end
        end

        context 'when money is withdrawn' do
            it 'returns the transaction history' do
                account.deposit(1000)
                account.withdraw(500)
                expect(account.transaction_history).to include({
                    :date => Date.today.to_s,
                    :debit => 500
                })
            end
        end

    end

    describe '#print' do
        it 'prints the transaction history' do
            account.deposit(1000)
            account.deposit(2000)
            account.withdraw(500)
            expect { account.print }.to output("date || credit || debit || balance\n#{Date.today.to_s} || || 500.00 || 2500.00\n#{Date.today.to_s} || 2000.00 || || 3000.00\n#{Date.today.to_s} || 1000.00 || || 1000.00\n").to_stdout
        end
    end


end