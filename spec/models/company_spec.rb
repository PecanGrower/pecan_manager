require 'spec_helper'

describe Company do

  before (:each) do
    @attr = {
        :name => "John Doe Farm"
    }
  end

  it "creates a new instance given valid attributes" do
    lambda do
      Company.create!(@attr)
    end.should change(Company, :count).by(1)
  end

  describe "has attr_accessible" do

    %w(name).each do |field|

      it "for :#{field}" do
        c = Company.new(@attr)
        c[field].should_not be_nil
      end
    end
  end

  describe "validates" do

    describe "presence" do
      %w(name).each do |field|

        it "of :#{field}" do
          Company.new(@attr.merge(field.to_sym => '')).should_not be_valid

        end
      end
    end
  end
end
