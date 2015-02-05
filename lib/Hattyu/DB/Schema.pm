package Hattyu::DB::Schema;
use Teng::Schema::Declare;
use DateTime::Format::Mysql;

table {
				name 'j_order';
				pk 'id';
				columns qw/id item_cd shop_cd suryo preferred_date preferred_kbn status created_at updated_at/;
				inflate qr/created_at/ => sub {
								my $value = shift;
								return DateTime::Format::Mysql->parse_datetime($value);
				};
				deflate qr/created_at/ => sub {
								my $value = shift;
								return DateTime::Format::Mysql->format_datetime($value);
				};
};


table {
				name 'm_item';
				pk 'id';
				columns qw/id item_cd item_name jyodai gedai shiire hattan sales_start_date rank hinrui hinsyu imsir card created_at updated_at/;
				inflate qr/created_at/ => sub {
								my $value = shift;
								return DateTime::Format::Mysql->parse_datetime($value);
				};
				deflate qr/created_at/ => sub {
								my $value = shift;
								return DateTime::Format::Mysql->format_datetime($value);
				};
};


table {
				name 'm_shop';
				pk 'id';
				columns qw/id shop_cd shop_name password created_at updated_at/;
				inflate qr/created_at/ => sub {
								my $value = shift;
								return DateTime::Format::Mysql->parse_datetime($value);
				};
				deflate qr/created_at/ => sub {
								my $value = shift;
								return DateTime::Format::Mysql->format_datetime($value);
				};
};
1;

