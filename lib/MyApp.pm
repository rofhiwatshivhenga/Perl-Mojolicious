package MyApp;
use Mojo::Base 'Mojolicious';
use DBI;

sub startup {
  my $self = shift;

  # Set the secret passphrase
  $self->secrets(['7Gz2!Lk#h3QwR4d@8Mn$Vp9Tx*ZpF']);

  # Database connection
  $self->helper(db => sub {
    state $dbh = DBI->connect("dbi:mysql:dbname=user_registration", "root", "123456", {RaiseError => 1, AutoCommit => 1, mysql_enable_utf8 => 1});
    return $dbh;
  });

  # Router
  my $r = $self->routes;

  # Routes for registration and search
  # Routes for registration and search
  $r->get('/')->to('example#welcome');  # Make sure this route exists in your controller
  $r->get('/register')->to('user#register_form')->name('register_form');
  $r->post('/register')->to('user#register')->name('register');
  $r->get('/search')->to('user#search_form')->name('search_form');
  $r->post('/search')->to('user#search')->name('search');
}

1;

