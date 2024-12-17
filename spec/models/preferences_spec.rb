require 'spec_helper'

describe Spree::Config do
  before do
    @tenant1 = FactoryBot.create(:tenant)
    @tenant2 = FactoryBot.create(:tenant)

    SpreeMultiTenant.with_tenant @tenant1 do
      Spree::Config[:storefront_products_path] = "mock_storefront_products_path_1"
    end
    SpreeMultiTenant.with_tenant @tenant2 do
      Spree::Config[:storefront_products_path] = "mock_storefront_products_path_2"
    end
  end

  it "should have the right preference for the tenant" do
    SpreeMultiTenant.with_tenant @tenant1 do
      Spree::Config.storefront_products_path.should == "mock_storefront_products_path_1"
    end
    SpreeMultiTenant.with_tenant @tenant2 do
      Spree::Config.storefront_products_path.should == "mock_storefront_products_path_2"
    end
  end
end

describe Spree::Api::Config do
  before do
    @tenant1 = FactoryBot.create(:tenant)
    @tenant2 = FactoryBot.create(:tenant)
  end

  it "should have the right preference for the tenant" do
    SpreeMultiTenant.with_tenant @tenant1 do
      Spree::Api::Config.api_v2_per_page_limit.should == 500 # default
      Spree::Api::Config[:api_v2_per_page_limit] = 1
      Spree::Api::Config.api_v2_per_page_limit.should == 1
    end
    SpreeMultiTenant.with_tenant @tenant2 do
      Spree::Api::Config.api_v2_per_page_limit.should == 500 # default
      Spree::Api::Config[:api_v2_per_page_limit] = 2
      Spree::Api::Config.api_v2_per_page_limit.should == 2
    end
  end
end
