Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA9F631
	for <distributions@lists.linux.dev>; Wed, 12 Apr 2023 05:00:02 +0000 (UTC)
References: <6614772.670kD7asE2@nimes> <5343648.xEiunlC7Kx@nimes>
 <9636462e-920f-2e6e-3d2c-ec58e43021a2@cs.ucla.edu>
 <9797572.lZ1qq7WqSs@nimes>
User-agent: mu4e 1.10.1; emacs 29.0.90
From: Sam James <sam@gentoo.org>
To: Bruno Haible <bruno@clisp.org>
Cc: Zack Weinberg <zack@owlfolio.org>, =?utf-8?Q?P=C3=A1draig?= Brady
 <P@draigbrady.com>,
 bug-gnulib@gnu.org, Paul Eggert <eggert@cs.ucla.edu>,
 distributions@lists.linux.dev
Subject: Re: recommending AC_SYS_YEAR2038_REQUIRED ?
Date: Wed, 12 Apr 2023 05:49:24 +0100
In-reply-to: <9797572.lZ1qq7WqSs@nimes>
Message-ID: <87jzyhem84.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Bruno Haible <bruno@clisp.org> writes:

> Paul Eggert wrote:
>> > How about a middle ground between the two macros? A macro, say
>> > AC_SYS_YEAR2038_UNLESS_OPT_OUT (*), that
>> >    - like AC_SYS_YEAR2038, has the option --disable-year2038,
>> >    - like AC_SYS_YEAR2038_REQUIRED, fails if a large 'time_t' is
>> >      unavailable and --disable-year2038 was not specified.
>>=20
>> Even simpler, let's have just one new macro instead of two. I.e., let's=
=20
>> change Autoconf to remove AC_SYS_YEAR2038_REQUIRED and to define instead=
=20
>> a macro AC_SYS_YEAR2038_OPT_OUT that acts like AC_SYS_YEAR2038 except it=
=20
>> errors out if wide time_t and --disable-year2038 are both missing.
>>=20
>> Then let's propagate this change into Gnulib, and rename Gnulib's=20
>> year2030-required module to year2038-opt-out.
>
> I like this. Thanks.

Thanks for bringing this up Bruno. This is a reasonable compromise to me
=2D not just in the change here, but in the documentation/phrasing tweak
as I was concerned about the rather forthright recommendation & presentatio=
n of
year2038-required.

>
> And if the package would very much like to assume a wide time_t and
> therefore has some test suite failures if --disable-year2038 was specifie=
d,
> so be it. It's better to be able to build a package at all, with some
> test suite failures, than not being able to build it at all.
>

I feel on the fence about this bit: I think it's reasonable to provide
a macro to require it as a last resort for people, but on the other
hand, providing it might be seen to encourage it as a reasonable
solution, when in most cases, it's not that way at all,
so I'll go with however the majority feels on that.

>> Similarly for AC_SYS_LARGEFILE_REQUIRED.

... and this.

>
> For the sake of symmetry between the two, that makes sense.
>

Thanks Paul as well.

best,
sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZDY4/F8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZDD1AD7BVrCTdZHM7G1l7peqYS758eW45GZDC/T52ea
ydX+h4ABAPDedScQC4jyv6h9cKk1RBIt4PYtp0XbqpIUtX5KbfwK
=9nU+
-----END PGP SIGNATURE-----
--=-=-=--
