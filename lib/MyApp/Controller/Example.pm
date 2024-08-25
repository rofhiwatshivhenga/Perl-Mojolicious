package MyApp::Controller::Example;
use Mojo::Base 'Mojolicious::Controller';

sub welcome {
  my $self = shift;
  $self->render(template => 'example/welcome');  # Ensure this matches the template name
}

1;
