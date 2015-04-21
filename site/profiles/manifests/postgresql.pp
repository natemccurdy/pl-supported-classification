# Setup a basic, unsecure, postgresql server using puppetlabs/postgresql
class profiles::postgresql {

  $postgres_password = hiera('pgsql::password',       'TPSrep0rt!')
  $db_name           = hiera('pgsql::db::name',       'testdb')
  $db_user           = hiera('pgsql::db::user',       'testuser')
  $db_user_pass      = hiera('pgsql::db::user::pass', 'password')
  $db_role           = hiera('pgsql::role',           'testrole')
  $db_role_pass      = hiera('pgsql::role::pass',     'password')

  validate_string($postgres_password)

  class { '::postgresql::server':
    ip_mask_deny_postgres_user => '0.0.0.0/32',
    ip_mask_allow_all_users    => '0.0.0.0/0',
    listen_addresses           => '*',
    postgres_password          => $postgres_password,
  }

  ::postgresql::server::db { $db_name:
    user     => $db_user,
    password => postgresql_password($db_user, $db_user_pass),
  }

  ::postgresql::server::role { $db_role:
    password_hash => postgresql_password($db_role, $db_role_pass),
  }

  ::postgresql::server::database_grant { $db_name:
    privilege => 'ALL',
    db        => $db_name,
    role      => $db_role,
  }

}
