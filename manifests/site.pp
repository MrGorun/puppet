# servers

node 'bacula1.miraheze.org' {
    include base
    include bacula::director
    # mysql crashes
    # include role::dbreplication
    include role::salt::minions
}

node /^cp[234]\.miraheze\.org$/ {
    include base
    include role::varnish
    include role::salt::minions
    include role::vpncloud
}

node 'db4.miraheze.org' {
    include base
    include role::db
    include role::postgresql
    include puppetdb::database
    include bacula::client
    include role::salt::minions
    include prometheus::mysqld_exporter
    include role::vpncloud
}

node 'db5.miraheze.org' {
    include base
    include role::db
    include bacula::client
    include role::salt::minions
    include prometheus::mysqld_exporter
    include role::vpncloud
}

node /^es[1234]\.miraheze\.org$/ {
    include base
    include role::elasticsearch
    include role::salt::minions
    include role::vpncloud
}

node /^glusterfs[12]\.miraheze\.org$/ {
    include base
    include bacula::client
    include role::gluster
    include role::salt::minions
}

node /^lizardfs[45]\.miraheze\.org$/ {
    include base
    include bacula::client
    include role::lizardfs
    include role::salt::minions
}

node 'lizardfs6.miraheze.org' {
    include base
    include bacula::client
    include role::db
    include role::gluster
    include role::lizardfs
    include role::mediawiki
    include role::salt::minions
    include prometheus::php_fpm
}

node 'misc1.miraheze.org' {
    include base
    include role::dns
    include role::grafana
    include role::icinga2
    include role::irc
    include role::mail
    include role::roundcubemail
    include role::salt::minions
    include role::vpncloud
    include prometheus::php_fpm
}

node 'misc2.miraheze.org' {
    include base
    include role::redis
    include role::matomo
    include role::salt::minions
    include role::vpncloud
    include prometheus::php_fpm
    include prometheus::redis_exporter
}

node 'misc3.miraheze.org' {
    include base
    include role::services
    include role::salt::minions
}

node 'misc4.miraheze.org' {
    include base
    include bacula::client
    include role::phabricator
    include role::prometheus
    include role::salt::masters
    include role::salt::minions
    include role::services
    include role::vpncloud
    include prometheus::php_fpm
}

node /^mw[123]\.miraheze\.org$/ {
    include base
    include role::mediawiki
    include role::salt::minions
    include prometheus::php_fpm
}

node 'ns1.miraheze.org' {
    include base
    include role::dns
    include role::vpncloud
}

node 'puppet1.miraheze.org' {
    include base
    include bacula::client
    include role::puppetserver
    include role::salt::minions
    include role::vpncloud
}

node 'test1.miraheze.org' {
    include base
    include role::mediawiki
    include role::salt::minions
    include prometheus::php_fpm
    include role::vpncloud
}

# ensures all servers have basic class if puppet runs
node default {
    include base
    include role::salt::minions
}
