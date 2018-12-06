require "sinderella/version"
require "datastore"

module Sinderella
  class Error < StandardError; end
  # Your code goes here...

  @@store = {}

  def self.transforms(data, till_midnight, &block)
    transformed_data = {}

    data.each do |key, value|
      transformed_data[key] = value.clone
    end

    yield(transformed_data)
    @@store["24e73d3a4f027ff81ed4f32c8a9b8713"] = {
      current: transformed_data,
      initial: data,
      transformed: transformed_data
    }

    "24e73d3a4f027ff81ed4f32c8a9b8713"
  end

  def self.reset_data_at(id)
    @@store[id][:current] = @@store[id][:initial]
  end

  def self.midnight(id)
    reset_data_at(id)
  end

  def self.check

  end

  def self.get(id)
    @@store[id][:current]
  end
end
