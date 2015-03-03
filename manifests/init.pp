# == Define: postgresql_extensions
#
# === Authors
#
# David James <david@mego22.net>
#
# === Copyright
#
# Copyright 2015 David James,  unless otherwise noted.
#
define postgresql_extensions(
  $extension    = $name,
  $psql_command = '/usr/bin/psql',
  $psql_user         = 'postgres',
){

  exec { "Adding extension ${extension}.":
    command => "${psql_command} -d template1 -c 'CREATE EXTENSION \"${extension}\";'",
    user    => "${psql_user}",
    unless  => "${psql_command} -d template1 -c '\\dx' | grep ${extension}",
  }

}
