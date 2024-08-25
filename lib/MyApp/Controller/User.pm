package MyApp::Controller::User;
use Mojo::Base 'Mojolicious::Controller';

sub register {
    my $self = shift;
    
    # Get form data
    my $email = $self->param('email');
    my $password = $self->param('password');

    # Get the database handle
    my $dbh = $self->db;

    # Check if $dbh is defined
    unless ($dbh) {
        return $self->render(text => "Database connection failed.");
    }

    # Perform the registration operation
    eval {
        $dbh->do('INSERT INTO users (email, password) VALUES (?, ?)', undef, $email, $password);
    };
    if ($@) {
        return $self->render(text => "Registration failed: $@");
    }

    return $self->render(text => "User registered successfully.");
}

1;
