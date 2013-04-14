##
## This file was generated by Google::ProtocolBuffers (0.08_01)
## on Sat Apr  6 19:42:06 2013 from file ql2.proto
##

use strict;
use warnings;
use Google::ProtocolBuffers;
{
    unless (VersionDummy::Version->can('_pb_fields_list')) {
        Google::ProtocolBuffers->create_enum(
            'VersionDummy::Version',
            [
               ['V0_1', 1063369270],

            ]
        );
    }
    
    unless (Response::ResponseType->can('_pb_fields_list')) {
        Google::ProtocolBuffers->create_enum(
            'Response::ResponseType',
            [
               ['SUCCESS_ATOM', 1],
               ['SUCCESS_SEQUENCE', 2],
               ['SUCCESS_PARTIAL', 3],
               ['CLIENT_ERROR', 16],
               ['COMPILE_ERROR', 17],
               ['RUNTIME_ERROR', 18],

            ]
        );
    }
    
    unless (Datum::DatumType->can('_pb_fields_list')) {
        Google::ProtocolBuffers->create_enum(
            'Datum::DatumType',
            [
               ['R_NULL', 1],
               ['R_BOOL', 2],
               ['R_NUM', 3],
               ['R_STR', 4],
               ['R_ARRAY', 5],
               ['R_OBJECT', 6],

            ]
        );
    }
    
    unless (Term::TermType->can('_pb_fields_list')) {
        Google::ProtocolBuffers->create_enum(
            'Term::TermType',
            [
               ['DATUM', 1],
               ['MAKE_ARRAY', 2],
               ['MAKE_OBJ', 3],
               ['VAR', 10],
               ['JAVASCRIPT', 11],
               ['ERROR', 12],
               ['IMPLICIT_VAR', 13],
               ['DB', 14],
               ['TABLE', 15],
               ['GET', 16],
               ['EQ', 17],
               ['NE', 18],
               ['LT', 19],
               ['LE', 20],
               ['GT', 21],
               ['GE', 22],
               ['NOT', 23],
               ['ADD', 24],
               ['SUB', 25],
               ['MUL', 26],
               ['DIV', 27],
               ['MOD', 28],
               ['APPEND', 29],
               ['SLICE', 30],
               ['SKIP', 70],
               ['LIMIT', 71],
               ['GETATTR', 31],
               ['CONTAINS', 32],
               ['PLUCK', 33],
               ['WITHOUT', 34],
               ['MERGE', 35],
               ['BETWEEN', 36],
               ['REDUCE', 37],
               ['MAP', 38],
               ['FILTER', 39],
               ['CONCATMAP', 40],
               ['ORDERBY', 41],
               ['DISTINCT', 42],
               ['COUNT', 43],
               ['UNION', 44],
               ['NTH', 45],
               ['GROUPED_MAP_REDUCE', 46],
               ['GROUPBY', 47],
               ['INNER_JOIN', 48],
               ['OUTER_JOIN', 49],
               ['EQ_JOIN', 50],
               ['ZIP', 72],
               ['COERCE_TO', 51],
               ['TYPEOF', 52],
               ['UPDATE', 53],
               ['DELETE', 54],
               ['REPLACE', 55],
               ['INSERT', 56],
               ['DB_CREATE', 57],
               ['DB_DROP', 58],
               ['DB_LIST', 59],
               ['TABLE_CREATE', 60],
               ['TABLE_DROP', 61],
               ['TABLE_LIST', 62],
               ['SINDEX_CREATE', 75],
               ['SINDEX_DROP', 76],
               ['SINDEX_LIST', 77],
               ['FUNCALL', 64],
               ['BRANCH', 65],
               ['ANY', 66],
               ['ALL', 67],
               ['FOREACH', 68],
               ['FUNC', 69],
               ['ASC', 73],
               ['DESC', 74],

            ]
        );
    }
    
    unless (Frame::FrameType->can('_pb_fields_list')) {
        Google::ProtocolBuffers->create_enum(
            'Frame::FrameType',
            [
               ['POS', 1],
               ['OPT', 2],

            ]
        );
    }
    
    unless (Query::QueryType->can('_pb_fields_list')) {
        Google::ProtocolBuffers->create_enum(
            'Query::QueryType',
            [
               ['START', 1],
               ['CONTINUE', 2],
               ['STOP', 3],

            ]
        );
    }
    
    unless (Datum::AssocPair->can('_pb_fields_list')) {
        Google::ProtocolBuffers->create_message(
            'Datum::AssocPair',
            [
                [
                    Google::ProtocolBuffers::Constants::LABEL_OPTIONAL(), 
                    Google::ProtocolBuffers::Constants::TYPE_STRING(), 
                    'key', 1, undef
                ],
                [
                    Google::ProtocolBuffers::Constants::LABEL_OPTIONAL(), 
                    'Datum', 
                    'val', 2, undef
                ],

            ],
            { 'create_accessors' => 1,  }
        );
    }

    unless (Query::AssocPair->can('_pb_fields_list')) {
        Google::ProtocolBuffers->create_message(
            'Query::AssocPair',
            [
                [
                    Google::ProtocolBuffers::Constants::LABEL_OPTIONAL(), 
                    Google::ProtocolBuffers::Constants::TYPE_STRING(), 
                    'key', 1, undef
                ],
                [
                    Google::ProtocolBuffers::Constants::LABEL_OPTIONAL(), 
                    'Term', 
                    'val', 2, undef
                ],

            ],
            { 'create_accessors' => 1,  }
        );
    }

    unless (VersionDummy->can('_pb_fields_list')) {
        Google::ProtocolBuffers->create_message(
            'VersionDummy',
            [

            ],
            { 'create_accessors' => 1,  }
        );
    }

    unless (Datum->can('_pb_fields_list')) {
        Google::ProtocolBuffers->create_message(
            'Datum',
            [
                [
                    Google::ProtocolBuffers::Constants::LABEL_OPTIONAL(), 
                    'Datum::DatumType', 
                    'type', 1, undef
                ],
                [
                    Google::ProtocolBuffers::Constants::LABEL_OPTIONAL(), 
                    Google::ProtocolBuffers::Constants::TYPE_BOOL(), 
                    'r_bool', 2, undef
                ],
                [
                    Google::ProtocolBuffers::Constants::LABEL_OPTIONAL(), 
                    Google::ProtocolBuffers::Constants::TYPE_DOUBLE(), 
                    'r_num', 3, undef
                ],
                [
                    Google::ProtocolBuffers::Constants::LABEL_OPTIONAL(), 
                    Google::ProtocolBuffers::Constants::TYPE_STRING(), 
                    'r_str', 4, undef
                ],
                [
                    Google::ProtocolBuffers::Constants::LABEL_REPEATED(), 
                    'Datum', 
                    'r_array', 5, undef
                ],
                [
                    Google::ProtocolBuffers::Constants::LABEL_REPEATED(), 
                    'Datum::AssocPair', 
                    'r_object', 6, undef
                ],

            ],
            { 'create_accessors' => 1,  }
        );
    }

    unless (Frame->can('_pb_fields_list')) {
        Google::ProtocolBuffers->create_message(
            'Frame',
            [
                [
                    Google::ProtocolBuffers::Constants::LABEL_OPTIONAL(), 
                    'Frame::FrameType', 
                    'type', 1, undef
                ],
                [
                    Google::ProtocolBuffers::Constants::LABEL_OPTIONAL(), 
                    Google::ProtocolBuffers::Constants::TYPE_INT64(), 
                    'pos', 2, undef
                ],
                [
                    Google::ProtocolBuffers::Constants::LABEL_OPTIONAL(), 
                    Google::ProtocolBuffers::Constants::TYPE_STRING(), 
                    'opt', 3, undef
                ],

            ],
            { 'create_accessors' => 1,  }
        );
    }

    unless (Term->can('_pb_fields_list')) {
        Google::ProtocolBuffers->create_message(
            'Term',
            [
                [
                    Google::ProtocolBuffers::Constants::LABEL_OPTIONAL(), 
                    'Term::TermType', 
                    'type', 1, undef
                ],
                [
                    Google::ProtocolBuffers::Constants::LABEL_OPTIONAL(), 
                    'Datum', 
                    'datum', 2, undef
                ],
                [
                    Google::ProtocolBuffers::Constants::LABEL_REPEATED(), 
                    'Term', 
                    'args', 3, undef
                ],
                [
                    Google::ProtocolBuffers::Constants::LABEL_REPEATED(), 
                    'Term::AssocPair', 
                    'optargs', 4, undef
                ],

            ],
            { 'create_accessors' => 1,  }
        );
    }

    unless (Response->can('_pb_fields_list')) {
        Google::ProtocolBuffers->create_message(
            'Response',
            [
                [
                    Google::ProtocolBuffers::Constants::LABEL_OPTIONAL(), 
                    'Response::ResponseType', 
                    'type', 1, undef
                ],
                [
                    Google::ProtocolBuffers::Constants::LABEL_OPTIONAL(), 
                    Google::ProtocolBuffers::Constants::TYPE_INT64(), 
                    'token', 2, undef
                ],
                [
                    Google::ProtocolBuffers::Constants::LABEL_REPEATED(), 
                    'Datum', 
                    'response', 3, undef
                ],
                [
                    Google::ProtocolBuffers::Constants::LABEL_OPTIONAL(), 
                    'Backtrace', 
                    'backtrace', 4, undef
                ],

            ],
            { 'create_accessors' => 1,  }
        );
    }

    unless (Query->can('_pb_fields_list')) {
        Google::ProtocolBuffers->create_message(
            'Query',
            [
                [
                    Google::ProtocolBuffers::Constants::LABEL_OPTIONAL(), 
                    'Query::QueryType', 
                    'type', 1, undef
                ],
                [
                    Google::ProtocolBuffers::Constants::LABEL_OPTIONAL(), 
                    'Term', 
                    'query', 2, undef
                ],
                [
                    Google::ProtocolBuffers::Constants::LABEL_OPTIONAL(), 
                    Google::ProtocolBuffers::Constants::TYPE_INT64(), 
                    'token', 3, undef
                ],
                [
                    Google::ProtocolBuffers::Constants::LABEL_OPTIONAL(), 
                    Google::ProtocolBuffers::Constants::TYPE_BOOL(), 
                    'noreply', 4, 0
                ],
                [
                    Google::ProtocolBuffers::Constants::LABEL_REPEATED(), 
                    'Query::AssocPair', 
                    'global_optargs', 6, undef
                ],

            ],
            { 'create_accessors' => 1,  }
        );
    }

    unless (Term::AssocPair->can('_pb_fields_list')) {
        Google::ProtocolBuffers->create_message(
            'Term::AssocPair',
            [
                [
                    Google::ProtocolBuffers::Constants::LABEL_OPTIONAL(), 
                    Google::ProtocolBuffers::Constants::TYPE_STRING(), 
                    'key', 1, undef
                ],
                [
                    Google::ProtocolBuffers::Constants::LABEL_OPTIONAL(), 
                    'Term', 
                    'val', 2, undef
                ],

            ],
            { 'create_accessors' => 1,  }
        );
    }

    unless (Backtrace->can('_pb_fields_list')) {
        Google::ProtocolBuffers->create_message(
            'Backtrace',
            [
                [
                    Google::ProtocolBuffers::Constants::LABEL_REPEATED(), 
                    'Frame', 
                    'frames', 1, undef
                ],

            ],
            { 'create_accessors' => 1,  }
        );
    }

}
1;
