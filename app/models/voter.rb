class Voter < ActiveRecord::Base
  require 'securerandom'

    validates :name, presence: true
    validates :party, presence: true

    before_save :add_token

    def as_json(options)
      hash = {id: id,
              name: name,
              party: party}

      if options[:include_token]
        hash.merge!(token: token)
      end

      {person: hash}

    end

    private

    def add_token
      self.token ||= SecureRandom.uuid
    end
  end
