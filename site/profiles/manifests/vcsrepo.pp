# Use puppetlabs/vcsrepo to make some repositories
class profiles::vcsrepo {

  vcsrepo { '/tmp/git_repo_01':
    ensure   => present,
    provider => git,
  }
  vcsrepo { '/tmp/git_repo_02':
    ensure   => bare,
    provider => git,
  }
  vcsrepo { '/tmp/git_repo_03':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/natemccurdy/recipes.git',
  }
  vcsrepo { '/tmp/company_secrets':
    ensure   => present,
    provider => git,
  }

}
