# coding: binary
# Generated by generate-specs
require 'helper'

describe_moneta "adapter_mongo_moped" do
  def features
    [:create, :expires, :increment]
  end

  def new_store
    Moneta::Adapters::MongoMoped.new(:db => "adapter_mongo")
  end

  def load_value(value)
    Marshal.load(value)
  end

  include_context 'setup_store'
  it_should_behave_like 'concurrent_create'
  it_should_behave_like 'concurrent_increment'
  it_should_behave_like 'create'
  it_should_behave_like 'create_expires'
  it_should_behave_like 'expires'
  it_should_behave_like 'features'
  it_should_behave_like 'increment'
  it_should_behave_like 'multiprocess'
  it_should_behave_like 'null_stringkey_stringvalue'
  it_should_behave_like 'null_stringkey_hashvalue'
  it_should_behave_like 'null_stringkey_integervalue'
  it_should_behave_like 'null_pathkey_stringvalue'
  it_should_behave_like 'null_pathkey_hashvalue'
  it_should_behave_like 'null_pathkey_integervalue'
  it_should_behave_like 'persist_stringkey_stringvalue'
  it_should_behave_like 'persist_stringkey_hashvalue'
  it_should_behave_like 'persist_stringkey_integervalue'
  it_should_behave_like 'persist_pathkey_stringvalue'
  it_should_behave_like 'persist_pathkey_hashvalue'
  it_should_behave_like 'persist_pathkey_integervalue'
  it_should_behave_like 'returndifferent_stringkey_stringvalue'
  it_should_behave_like 'returndifferent_stringkey_hashvalue'
  it_should_behave_like 'returndifferent_pathkey_stringvalue'
  it_should_behave_like 'returndifferent_pathkey_hashvalue'
  it_should_behave_like 'store_stringkey_stringvalue'
  it_should_behave_like 'store_stringkey_hashvalue'
  it_should_behave_like 'store_stringkey_integervalue'
  it_should_behave_like 'store_pathkey_stringvalue'
  it_should_behave_like 'store_pathkey_hashvalue'
  it_should_behave_like 'store_pathkey_integervalue'
  it_should_behave_like 'store_large'
  it 'automatically deletes expired document' do
    store.store('key', 'val', :expires => 5)
    store.instance_variable_get(:@collection).find('_id' => ::Moped::BSON::Binary.new(:generic, 'key')).one.should_not be_nil
    sleep 70 # Mongo needs up to 60 seconds
    store.instance_variable_get(:@collection).find('_id' => ::Moped::BSON::Binary.new(:generic, 'key')).one.should be_nil
  end
end
