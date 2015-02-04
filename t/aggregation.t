use Test::More;

use Rethinkdb;

# setup
my $conn = r->connect->repl;
r->db('test')->drop->run;
r->db('test')->create->run;
r->db('test')->table('marvel')->create( primary_key => 'superhero' )->run;
r->table('marvel')->insert(
  [
    {
      user_id    => 1,
      superhero  => 'Iron Man',
      superpower => 'Arc Reactor',
      active     => 1,
      age        => 35,
      strength   => 1000,
      dc_buddies => [ 'Superman', 'Batman' ],
    },
    {
      user_id    => 2,
      superhero  => 'Hulk',
      superpower => 'Smash',
      active     => 1,
      age        => 35,
      strength   => 2012,
      dc_buddies => [ 'Superman', 'Flash' ],
    },
    {
      user_id    => 3,
      superhero  => 'Captain America',
      superpower => 'Super Strength',
      active     => 1,
      age        => 135,
      strength   => 1035,
      dc_buddies => [ 'Superman', 'Green Lantern' ],
    },
    {
      user_id    => 4,
      superhero  => 'Thor',
      superpower => 'God-like powers',
      active     => 1,
      age        => 1035,
      strength   => 2035,
      dc_buddies => [ 'Flash', 'Batman' ],
    },
    {
      user_id    => 5,
      superhero  => 'Hawk-Eye',
      superpower => 'Bow-n-arrow',
      active     => 0,
      age        => 35,
      strength   => 10,
      dc_buddies => [ 'Aquaman', 'Wonder Women' ],
    },
    {
      user_id    => 6,
      superhero  => 'Wasp',
      superpower => 'Bio-lasers',
      active     => 0,
      age        => 35,
      strength   => 52,
      dc_buddies => [ 'Superman', 'Batman' ],
    },
    {
      user_id    => 7,
      superhero  => 'Ant-Man',
      superpower => 'Size',
      active     => 1,
      age        => 35,
      strength   => 50,
      dc_buddies => [ 'Green Lantern', 'Aquaman' ],
      extra      => 1,
    },
    {
      user_id    => 8,
      superhero  => 'Wolverine',
      superpower => 'Adamantium',
      active     => 0,
      age        => 35,
      strength   => 135,
      dc_buddies => [ 'Hawkman', 'Batman' ],
      extra      => 1,
    },
    {
      user_id    => 9,
      superhero  => 'Spider-Man',
      superpower => 'Spidy Sense',
      active     => 0,
      age        => 20,
      strength   => 200,
      dc_buddies => [ 'Wonder Women', 'Martian Manhunter' ],
      extra      => 1,
    }
  ]
)->run;

r->db('test')->table('dc')->create( primary_key => 'superhero' )->run;
r->table('dc')->insert(
  [
    {
      user_id    => 10,
      superhero  => 'Superman',
      superpower => 'Alien',
      active     => 1,
      age        => 35
    },
    {
      user_id    => 11,
      superhero  => 'Batman',
      superpower => 'Cunning',
      active     => 1,
      age        => 35
    },
    {
      user_id    => 12,
      superhero  => 'Flash',
      superpower => 'Super Speed',
      active     => 1,
      age        => 135
    },
    {
      user_id    => 13,
      superhero  => 'Wonder Women',
      superpower => 'Super Stregth',
      active     => 1,
      age        => 1035
    },
    {
      user_id    => 14,
      superhero  => 'Green Lantern',
      superpower => 'Ring',
      active     => 0,
      age        => 35
    },
    {
      user_id    => 15,
      superhero  => 'Aquaman',
      superpower => 'Hydrokinesis',
      active     => 0,
      age        => 35
    },
    {
      user_id    => 16,
      superhero  => 'Hawkman',
      superpower => 'Ninth Metal',
      active     => 1,
      age        => 35
    },
    {
      user_id    => 17,
      superhero  => 'Martian Manhunter',
      superpower => 'Shapeshifting',
      active     => 0,
      age        => 35
    },
  ]
)->run;

# reduce
$res = r->table('marvel')->map( r->row->attr('age') )->reduce(
  sub ($$) {
    my ( $acc, $val ) = @_;
    $acc->add($val);
  }
)->default(0)->run;

is $res->type,     1,      'Correct response type';
is $res->response, '1400', 'Correct number of documents';

# count
$res = r->table('marvel')->count->run;

is $res->type,     1,   'Correct response type';
is $res->response, '9', 'Correct number of documents';

# count (with parameter)
$res = r->table('marvel')->concat_map(
  sub {
    my $row = shift;
    $row->attr('dc_buddies');
  }
)->count('Batman')->run;

is $res->type,     1,   'Correct response type';
is $res->response, '4', 'Correct number of documents';

$res = r->table('marvel')->count(
  sub {
    my $hero = shift;
    $hero->attr('dc_buddies')->contains('Batman');
  }
)->run;

is $res->type,     1,   'Correct response type';
is $res->response, '4', 'Correct number of documents';

# distinct (on table)
$res = r->table('marvel')->distinct->run;

is $res->type, 2, 'Correct response type';
is scalar @{ $res->response }, 9, 'Correct number of documents';

# distinct (on query)
$res = r->expr( [ 1, 1, 1, 1, 1, 2, 3 ] )->distinct->run($conn);

is $res->type, 1, 'Correct response type';
is scalar @{ $res->response }, 3, 'Correct number of documents';

# group_by
$res = r->table('marvel')->group('age')->avg('strength')->run;

is $res->type, 1, 'Correct response type';
is_deeply $res->response,
  {
  '1035' => '2035',
  '35'   => '543.166666666667',
  '135'  => '1035',
  '20'   => '200',
  },
  'Correct response';

# contains
$res = r->table('marvel')->get('Iron Man')->attr('dc_buddies')
  ->contains('Superman')->run;

is $res->type, 1, 'Correct response type';
is $res->response, r->true, 'Correct response value';

# clean up
r->db('test')->drop->run;

done_testing();