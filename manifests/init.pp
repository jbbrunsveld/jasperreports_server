# == Class: jasperreports_server
#
# Install and configures JasperReports Server 
#
# === Parameters
#
# [*pkg_version*]
#   server version
# [*source_url*]
#   URL to download the source .zip defaults to sourceforge using the $pkg_version variable
#   http://kent.dl.sourceforge.net/project/jasperserver/JasperServer/JasperReports%20Server%20Community%20Edition%20${pkg_version}/jasperreports-server-cp-${pkg_version}-bin.zip
#
# === Examples
#
# === Authors
#
# Steven Bambling <smbambling@arin.net>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class jasperreports_server (
  $pkg_version               = undef,
  $external_ad_auth          = false,
  $source_url                = undef,
  $nexus_url                 = undef,
  $nexus_repository          = undef,
  $nexus_gav                 = undef,
  $nexus_packaging           = undef,
  $nexus_classifier          = undef,
  $buildomatic_user          = $jasperreports_server::params::buildomatic_user,
  $buildomatic_appservertype = $jasperreports_server::params::buildomatic_appservertype,
  $buildomatic_appserverdir  = $jasperreports_server::params::buildomatic_appserverdir,
  $buildomatic_catalina_home = $jasperreports_server::params::buildomatic_catalina_home,
  $buildomatic_catalina_base = $jasperreports_server::params::buildomatic_catalina_base,
  $buildomatic_jboss_profile = $jasperreports_server::params::buildomatic_jboss_profile,
  $buildomatic_dbtype        = $jasperreports_server::params::buildomatic_dbtype,
  $buildomatic_dbhost        = $jasperreports_server::params::buildomatic_dbhost,
  $buildomatic_dbusername    = $jasperreports_server::params::buildomatic_dbusername,
  $buildomatic_dbpassword    = $jasperreports_server::params::buildomatic_dbpassword,
  $buildomatic_extras        = $jasperreports_server::params::buildomatic_extras,
  $ad_connection_source      = $jasperreports_server::params::ad_connection_source,
  $ad_userdn                 = $jasperreports_server::params::ad_userdn,
  $ad_password               = $jasperreports_server::params::ad_password,
  $ad_group_base             = $jasperreports_server::params::ad_group_base,
  $ad_user_base              = $jasperreports_server::params::ad_user_base,
  $ad_org_roles              = $jasperreports_server::params::ad_org_roles,
  $sql_validation            = $jasperreports_server::params::sql_validation,
) inherits jasperreports_server::params {

  anchor { 'jasperreports_server::start': }
  anchor { 'jasperreports_server::end': }

  Anchor['jasperreports_server::start'] ->
  class { 'jasperreports_server::install':
    pkg_version => $pkg_version,
  } ->
  class { 'jasperreports_server::config': } ->
  Anchor['jasperreports_server::end']

}
