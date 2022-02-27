require 'bank_statement'

describe Bank_Statement do
    subject(:bank_statement){ Bank_Statement.new }
    it { is_expected.to respond_to(:transaction_history) }
   
    it 'has starts with no transaction history' do
        expect(bank_statement.transaction_history).to eq []
    end

    # describe '#add' do
    #     it 'it adds a  transaction to a bank_statement'
    #     expect(bank_statement.add(transaction)).to
    # end

    # describe '#print' do
    #     it 'prints the transaction history' do

    # end
end