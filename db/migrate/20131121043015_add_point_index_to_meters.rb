class AddPointIndexToMeters < ActiveRecord::Migration
  def up
    execute %{
      create index index_on_meters_location ON meters using gist (
        ST_GeographyFromText(
          'SRID=4326;POINT(' || meters.longitude || ' ' || meters.latitude || ')'
        )
      )
    }
  end

  def down
    execute %{drop index index_on_meters_location}
  end
end
