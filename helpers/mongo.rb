require 'mongo'

module Slingshot
  module Helpers
    class Mongo

      attr_reader :conn, :db
      def initialize
        # Don't lazy init connection, we're not called until needed anyway
        @conn = Mongo::Connection.new
        @db   = @conn.db("slingshot")
      end

    end
  end
end

def mongo
  @mongo_helper ||= Slingshot::Helpers::Mongo.new
end
