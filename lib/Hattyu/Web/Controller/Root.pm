package Hattyu::Web::Controller::Root;
use Mojo::Base 'Mojolicious::Controller';
use Hattyu::DB;
use DateTime;
use Encode;

my $teng = Hattyu::DB->new( connect_info => [ 'dbi:mysql:Hattyu:localhost', 'root', undef ] );

sub index {
  my $self = shift;
	#my $hinrui = $self->param('hinrui');
	#my $itr = $teng->search('m_item',{ hinrui => $hinrui }, { order_by => ['imsir','sales_start_date'] } );
	my $itr = $teng->search('m_item', {} );
	my $entries = [];
	while ( my $data = $itr->next ) {
					$data->{row_data}{item_name} = decode_utf8($data->{row_data}{item_name});
					push @$entries, $data;
	}
	$self->stash->{entries} = $entries;
  $self->render();
}

1;
