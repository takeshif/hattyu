package Hattyu::Web::Controller::Root;
use Mojo::Base 'Mojolicious::Controller';
use Hattyu::DB;
use DateTime;
use Encode;
use DDP { deparse => 1 };
use utf8;

my $teng = Hattyu::DB->new( connect_info => [ 'dbi:mysql:Hattyu:localhost', 'root', undef ] );

sub index {
  my $self = shift;
	my @hinrui = $self->param('hinrui');
	my $itr;
	if ($#hinrui == -1) {
		$itr = $teng->search('m_item', {} );	
	} else {
		$itr = $teng->search('m_item',+{ hinrui => \@hinrui }, +{ order_by => ['imsir','sales_start_date'] } );
	}
	my $entries = [];
	while ( my $data = $itr->next ) {
					$data->{row_data}{item_name} = decode_utf8($data->{row_data}{item_name});
					my $order;
					$order = $teng->single('j_order',+{ shop_cd => 5002, item_cd => $data->{row_data}{item_cd}});
					$data->{row_data}{suryo} = $order->{row_data}{suryo};
					push @$entries, $data;
	}
	$self->stash->{entries} = $entries;
  $self->render();
}

sub menu {
				my $self = shift;
				my $row = $teng->single( 'm_shop',{ shop_cd => 5002 } );
				$row->{row_data}{shop_name} = decode_utf8($row->{row_data}{shop_name});
				$self->stash->{shop} = $row;
				$self->render();
}

1;
