require 'spec_helper'

describe Spree::Config do
  before do
    @tenant1 = FactoryBot.create(:tenant)
    @tenant2 = FactoryBot.create(:tenant)

    SpreeMultiTenant.with_tenant @tenant1 do
      Spree::Config[:currency] = "CAD"
    end
    SpreeMultiTenant.with_tenant @tenant2 do
      Spree::Config[:currency] = "EUR"
    end
  end

  it "should have the right preference for the tenant" do
    SpreeMultiTenant.with_tenant @tenant1 do
      Spree::Config.currency.should == "CAD"
    end
    SpreeMultiTenant.with_tenant @tenant2 do
      Spree::Config.currency.should == "EUR"
    end
  end
end

describe Spree::Api::Config do
  before do
    @tenant1 = FactoryBot.create(:tenant)
    @tenant2 = FactoryBot.create(:tenant)

    SpreeMultiTenant.with_tenant @tenant1 do
      Spree::Api::Config[:api_v2_per_page_limit] = 1
    end
    SpreeMultiTenant.with_tenant @tenant2 do
      Spree::Api::Config[:api_v2_per_page_limit] = 2
    end
  end

  it "should have the right preference for the tenant" do
    SpreeMultiTenant.with_tenant @tenant1 do
      Spree::Api::Config.api_v2_per_page_limit.should == 1
    end
    SpreeMultiTenant.with_tenant @tenant2 do
      Spree::Api::Config.api_v2_per_page_limit.should == 2
    end
  end
end
