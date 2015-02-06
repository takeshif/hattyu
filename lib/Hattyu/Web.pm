package Hattyu::Web;
use Mojo::Base 'Mojolicious';

sub startup {
  my $self = shift;
  my $r = $self->routes;
	$r->namespaces([qw/Hattyu::Web::Controller/]);
	$r->get('/menu')->to('root#menu');
  $r->get('/')->to('root#index');
  $r->get('/new')->to('root#post');
  $r->post('/create')->to('root#create');
  $r->post('/filter')->to('root#index');
}

1;
