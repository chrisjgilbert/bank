require 'spec_helper'
require 'statement'

describe('statment') do
  it('prints out a statement') do
    statement = Statement.new
    expect { statement.print }.not_to raise_error
  end
end
