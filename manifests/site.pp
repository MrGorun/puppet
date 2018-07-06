# servers

node 'bacula1.miraheze.org' {
    include base
    include bacula::director
    # mysql crashes
    # include role::dbreplication
    include role::salt::minions
}

node /^cp[245]\.miraheze\.org$/ {
    include base
    include role::varnish
    include role::salt::minions
}

node 'nfs1.miraheze.org' {
    include base
    include bacula::client
    include role::staticserver
    include role::salt::minions
    include role::swift
}

node 'db4.miraheze.org' {
    include base
    include role::db
    include role::postgresql
    include bacula::client
    include role::salt::minions
}

node 'misc1.miraheze.org' {
    include base
    include role::icinga
    include role::irc
    include role::mail
    include role::dns
    include role::salt::minions
}

node 'misc2.miraheze.org' {
    include base
    include role::redis
    include role::grafana
    include role::piwik
    include role::salt::minions
}

node 'misc3.miraheze.org' {
    include base
    include role::parsoid
    include role::electron
    include role::mathoid
    include role::restbase
    include role::salt::masters
    include role::salt::minions
}

node 'misc4.miraheze.org' {
    include base
    include bacula::client
    include role::phabricator
    include role::swift
    include role::salt::minions
}

node /^mw[123]\.miraheze\.org$/ {
    include base
    include role::mediawiki
    include role::salt::minions
}

node 'ns1.miraheze.org' {
    include base
    include role::dns
}

node 'puppet1.miraheze.org' {
    include base
    include bacula::client
    include puppetmaster
    include role::salt::minions
}

node 'swift1.miraheze.org' {
    include base
    include role::swift
    include role::salt::minions
}

node 'test1.miraheze.org' {
    include base
    include role::mediawiki
    include role::salt::minions
}

# ensures all servers have basic class if puppet runs
node default {
    include base
    include role::salt::minions
}
