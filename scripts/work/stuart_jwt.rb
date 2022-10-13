require 'jwt'
require 'active_support/core_ext/digest/uuid'

class StuartJwt
  ENCRYPTION_ALGORITHM = 'ES256'.freeze

  attr_reader :identity, :owner_id, :options

  def initialize(identity:, owner_id:, options: {})
    @identity = identity
    @owner_id = owner_id
    @options = options
  end

  def encode
    JWT.encode(jwt_attributes, rsa_private_pem, ENCRYPTION_ALGORITHM)
  end

  private

  def jwt_attributes
    basic_attributes.merge(identity_attributes)
  end

  def identity_attributes
    case identity
    when :driver
      {
        'srt:features' => %w[
          courier
          courierEarnings
          courierDeliveries
          dma
          driverEarnings
          earningQuotes
          featureFlags
          privateReason
        ],
        'srt:driver_id' => owner_id.to_s,
        'srt:flags' => %w[pii],
        'srt:zone_codes' => [options[:zone_code]],
        'srt:mutations' => %w[
          confirmedWaitingPackages
          enteredPackagesGeofence
          package
          succeedPackages
        ] + extra_mutations,
        'srt:queries' => base_queries + %w[
          businessRules
          courier
          courierFeedbackCategories
          deliveries
          delivery
          driver
          driverFeedbackCategories
          featureFlags
          forecastDemandSupply
          invitation
          me
          package
          zone
        ] + extra_queries,
        'srt:subscriptions' => %w[
          area
        ]
      }
    when :client
      {
        'srt:client_id' => owner_id.to_s,
        'srt:client_ids' => [owner_id.to_s],
        'srt:zone_codes' => ['any'],
        'srt:flags' => %w[pii],
        'srt:fleet_ids' => options[:fleet_ids]&.map(&:to_s) || [],
        'srt:queries' => base_queries + %w[me package packages packageSearchResults zones] + extra_queries,
        'srt:mutations' => %w[package generateApiCredentials] + extra_mutations
      }
    when :admin_user
      {
        'srt:zone_codes' => ['any'],
        'srt:client_ids' => ['any'],
        'srt:fleet_ids' => ['any'],
        'srt:queries' => base_queries + %w[package packages zones fleets clients drivers] + extra_queries
      }
    end
  end

  def base_queries
    %w[__schema __typename whoami]
  end

  def basic_attributes
    {
      iss: 'stuart-api',
      iat: Time.now.to_i,
      jti: SecureRandom.uuid,
      'srt:environments' => [options[:env] || 'development'].flatten
    }
  end

  def extra_queries
    options[:extra_queries] || []
  end

  def extra_mutations
    options[:extra_mutations] || []
  end

  def rsa_private_pem
    OpenSSL::PKey::EC.new(File.read(rsa_private_pem_path))
  end

  def rsa_private_pem_path
    '/Users/m.manzanares/clones/work/stuart-api/tokens/doorkeerper_jwt_private_key.pem'
  end
end
