# Generated by generate.rb
require 'helper'

describe_moneta "transformer_json" do
  def new_store
    Moneta.build do
      use :Transformer, :key => :json, :value => :json
      adapter :Memory
    end
  end

  def load_value(value)
    ::MultiJson.load(value).first
  end

  include_context 'setup_store'
  it_should_behave_like 'null_hashkey_hashvalue'
  it_should_behave_like 'null_hashkey_stringvalue'
  it_should_behave_like 'null_stringkey_hashvalue'
  it_should_behave_like 'null_stringkey_stringvalue'
  it_should_behave_like 'store_hashkey_hashvalue'
  it_should_behave_like 'store_hashkey_stringvalue'
  it_should_behave_like 'store_stringkey_hashvalue'
  it_should_behave_like 'store_stringkey_stringvalue'
  it_should_behave_like 'returndifferent_hashkey_hashvalue'
  it_should_behave_like 'returndifferent_hashkey_stringvalue'
  it_should_behave_like 'returndifferent_stringkey_hashvalue'
  it_should_behave_like 'returndifferent_stringkey_stringvalue'
  it_should_behave_like 'transform_value'
end
