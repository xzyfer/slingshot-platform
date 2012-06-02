require 'mongo'

module Slingshot
  module Helpers
    class Mongo

      attr_reader :conn, :db
      def initialize
        # Don't lazy init connection, we're not called until needed anyway
        @conn = ::Mongo::Connection.new
        @db   = @conn.db("slingshot")
      end
    end

    class MongoCollection

      attr_reader :db, :coll
      def initialize(name)
        @mongo = ::Slingshot::Helpers::Mongo.new
        @coll = @mongo.db[name]
      end

      def find(query)
        @coll.find(query).to_a
      end

      def insert(row)
        @coll.insert(row)
      end
    end

  end
end

COLLECTIONS={}
def mongo(collection_name)
  COLLECTIONS[collection_name] ||= Slingshot::Helpers::MongoCollection.new(collection_name)
end
