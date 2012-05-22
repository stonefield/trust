require 'test_helper'

      # def can?(action, parent = nil)
      #   Judge::Authorization.authorized?(action, self, parent)
      # end

class Judge::ActiveRecordTest < ActiveSupport::TestCase
  context 'can?' do
    setup do
      class Record < ActiveRecord::Base
      end
      @record = Record.new
    end
    should 'support calls to athorized? on class level' do
      action = stub('action')
      parent = stub('parent')
      Judge::Authorization.expects(:authorized?).with(action,self,parent)
      Record.can? action,parent
    end
    should 'support calls to athorized? on instance' do
      action = stub('action')
      parent = stub('parent')
      Judge::Authorization.expects(:authorized?).with(action,self,parent)
      @record.can? action,parent
    end
    
  end
end