u:Gem::Specification{[I"
2.0.7:ETi	I"mime-types; TU:Gem::Version[I"1.25.1; TIu:	Time k�    :@_zoneI"UTC; TI"TThis library allows for the identification of a file's likely MIME content type; TU:Gem::Requirement[[[I">=; TU;[I"0; TU;	[[[I">=; TU;[I"0; TI"	ruby; F[o:Gem::Dependency
:
@nameI"rubyforge; T:@requirementU;	[[[I">=; TU;[I"
2.0.4; T:
@type:development:@prereleaseF:@version_requirementsU;	[[[I">=; TU;[I"
2.0.4; To;

;I"minitest; T;U;	[[[I"~>; TU;[I"5.0; T;;;F;U;	[[[I"~>; TU;[I"5.0; To;

;I"	rdoc; T;U;	[[[I"~>; TU;[I"4.0; T;;;F;U;	[[[I"~>; TU;[I"4.0; To;

;I"hoe-bundler; T;U;	[[[I"~>; TU;[I"1.2; T;;;F;U;	[[[I"~>; TU;[I"1.2; To;

;I"hoe-doofus; T;U;	[[[I"~>; TU;[I"1.0; T;;;F;U;	[[[I"~>; TU;[I"1.0; To;

;I"hoe-gemspec2; T;U;	[[[I"~>; TU;[I"1.1; T;;;F;U;	[[[I"~>; TU;[I"1.1; To;

;I"hoe-git; T;U;	[[[I"~>; TU;[I"1.5; T;;;F;U;	[[[I"~>; TU;[I"1.5; To;

;I"hoe-rubygems; T;U;	[[[I"~>; TU;[I"1.0; T;;;F;U;	[[[I"~>; TU;[I"1.0; To;

;I"hoe-travis; T;U;	[[[I"~>; TU;[I"1.2; T;;;F;U;	[[[I"~>; TU;[I"1.2; To;

;I"	rake; T;U;	[[[I"~>; TU;[I"	10.0; T;;;F;U;	[[[I"~>; TU;[I"	10.0; To;

;I"hoe; T;U;	[[[I"~>; TU;[I"3.7; T;;;F;U;	[[[I"~>; TU;[I"3.7; TI"mime-types; T[I"austin@rubyforge.org; T[I"Austin Ziegler; TI"3This library allows for the identification of a file's likely MIME content
type. This is release 1.25.1, fixing an issue with priority comparison for
mime-types 1.x. The current release is 2.0, which only supports Ruby 1.9 or
later.

Release 1.25.1 contains all features of 1.25, including the experimental
caching and lazy loading functionality. The caching and lazy loading features
were initially implemented by Greg Brockman (gdb). As these features are
experimental, they are disabled by default and must be enabled through the use
of environment variables. The cache is invalidated on a per-version basis; the
cache for version 1.25 will not be reused for any later version.

To use lazy loading, set the environment variable +RUBY_MIME_TYPES_LAZY_LOAD+
to any value other than 'false'. When using lazy loading, the initial startup
of MIME::Types is around 12–25× faster than normal startup (on my system,
normal startup is about 90 ms; lazy startup is about 4 ms). This isn't
generally useful, however, as the MIME::Types database has not been loaded.
Lazy startup and load is just *slightly* faster—around 1 ms. The real advantage
comes from using the cache.

To enable the cache, set the environment variable +RUBY_MIME_TYPES_CACHE+ to a
filename where MIME::Types will have read-write access. The first time a new
version of MIME::Types is run using this file, it will be created, taking a
little longer than normal. Subsequent loads using the same cache file will be
approximately 3½× faster (25 ms) than normal loads. This can be combined with
+RUBY_MIME_TYPES_LAZY_LOAD+, but this is *not* recommended in a multithreaded
or multiprocess environment where all threads or processes will be using the
same cache file.

As the caching interface is still experimental, the only values cached are the
default MIME::Types database, not any custom MIME::Types added by users.

MIME types are used in MIME-compliant communications, as in e-mail or HTTP
traffic, to indicate the type of content which is transmitted. MIME::Types
provides the ability for detailed information about MIME entities (provided as
a set of MIME::Type objects) to be determined and used programmatically. There
are many types defined by RFCs and vendors, so the list is long but not
complete; don't hesitate to ask to add additional information. This library
follows the IANA collection of MIME types (see below for reference).

MIME::Types for Ruby was originally based on MIME::Types for Perl by Mark
Overmeer, copyright 2001 - 2009.

MIME::Types is built to conform to the MIME types of RFCs 2045 and 2231. It
tracks the {IANA registry}[http://www.iana.org/assignments/media-types/]
({ftp}[ftp://ftp.iana.org/assignments/media-types]) with some unofficial types
added from the {LTSW collection}[http://www.ltsw.se/knbase/internet/mime.htp]
and added by the users of MIME::Types.; TI"%http://mime-types.rubyforge.org/; TT@[I"MIT; TI"Artistic 2.0; TI"
GPL-2; T