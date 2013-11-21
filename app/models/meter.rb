class Meter < ActiveRecord::Base
  scope :close_to, -> (latitude, longitude, distance_in_meters = 2000) {
    where(%{
      ST_DWithin(
        ST_GeographyFromText(
          'SRID=4326;POINT(' || meters.longitude || ' ' || meters.latitude || ')'
        ),
        ST_GeographyFromText('SRID=4326;POINT(%f %f)'),
      %d
      )
    } % [longitude, latitude, distance_in_meters])
  }
end
