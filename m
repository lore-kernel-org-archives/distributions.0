Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F5A2F3B
	for <distributions@lists.linux.dev>; Thu, 23 Jan 2025 13:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737638083; cv=none; b=i4ayi5zPPAtUTe1NJ5EfjaGVAHDHWjHlA7VeWKf/3JekRQ3FuL6daAhn5nvgx5IKYc5cpj2cjPwFC35ICVzHHdeUToRhPilNVqUoV82iSBzfyF6echeyxbypHWhSr3mePnAKeLsS9W3A2is9ZacY6CtenWi6/P3jYojT4JX592o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737638083; c=relaxed/simple;
	bh=Vl1fxaE4Ed5QqsHqACtOTcP8cEh4QSBTLCRYlbfgKV8=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=H3VTPN3aYLnPYMmSHP/9E3B9wJ4LRLpGEat++K3Ldfbn+FBMiEHZy7fXL0gyJ923aoTvwC37qRpldPk50f76KxPjF2c4HryRNY5omqMenym2FtyYXDGhgMaxL0r95zXMgXspXwef2UX7jvmbyImmRCAIdtxUVCAbEvveN4kBPc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [192.168.1.1] (c144-147.icpnet.pl [85.221.144.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mgorny)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 680373434F4;
	Thu, 23 Jan 2025 13:14:40 +0000 (UTC)
Message-ID: <b0726076ea438d59d8b7b5d0f44a4ed6ca11d418.camel@gentoo.org>
Subject: Standardizing NO_NETWORK and USE_SYSTEM_DEPS environment variables
From: =?UTF-8?Q?Micha=C5=82_G=C3=B3rny?= <mgorny@gentoo.org>
To: distributions@lists.linux.dev
Date: Thu, 23 Jan 2025 14:14:36 +0100
Organization: Gentoo
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-10Rmr3sqU/Jf3MH200AM"
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-10Rmr3sqU/Jf3MH200AM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

As a packager, I often find it necessary to ensure two important aspects
of the build process:

1) that the build process itself doesn't access the Internet,
in particular that it doesn't download any files on its own,

2) that the build process uses system shared libraries and other
dependencies whenever possible, rather than vendored (or downloaded)
copies.

Unfortunately, these requirements don't always align with what
the upstream considers best for their own use and what they consider
the best defaults for their users.  Fortunately, we are often able to
reach an agreement and get the options to adjust the build system
behavior.  However, these options are often defined per project
and they aren't necessarily consistent across different projects.

Given the recent success of how the NO_COLOR variable [1] became a de-
facto standard, I was wondering if we could perhaps attempt to
standardize environment variables for these two aspects as well.
I suppose many other distribution packagers are facing the same
problems, so I think this mailing list is a good place to discuss this.

What I'd like to propose are two environment variables:

1) NO_NETWORK -- if it's set to a non-empty value, it requests that
programs don't access the (TCP/IP) network.

2) USE_SYSTEM_DEPS -- if it's set to a non-empty value, it requests that
the build system does not use any vendored dependency for which it
supports using a system version instead, and that it links to shared
libraries whenever possible.

Some examples and thoughts below, followed by rationale.


For NO_NETWORK, my primary goal is to have build systems not issue
commands that fetch stuff from the Internet.  For example, if a build
system supports automatically fetching and building missing
dependencies, setting NO_NETWORK would imply that it would fail instead.
Technically, this could also be extended to tools like wget, effectively
blocking Internet access on multiple layers -- but that's not strictly
necessary.

Another use case would be test suites with tests accessing remote
servers -- the variable could automatically cause them to be skipped.=20
It could be also used e.g. by pytest-socket plugin to automatically cut
the test suite from the Internet when loaded.

I think it would also make sense to imply not accessing local network
services, in particular local system services.  An example of that are
test suites that connect to the local database daemons rather than
starting their own isolated copies.

As for the rationale, my focus would be on security,=C2=A0
and reliability.  Package management systems in general implement
streamlined procedures for fetching resources, including verification of
authenticity, use of local mirrors, caching and so on.  Fetching
resources directly bypasses this.  This could expose information about
what is happening on a particular machine, cause unnecessary server
load, cause fees due to data plan use, cause failures due to shoddy
Internet connection -- similarly for tests.  I've written a more
detailed explanation once in the Gentoo devmanual [1].


For USE_SYSTEM_DEPS, the primary goal is to build against system
dependencies.  For example, some upstreams either prefer using vendored
dependencies or fallback to them when the system dependencies aren't
found.  However, in Gentoo we really do want stuff to use system
dependencies -- and if we miss to specify them appropriately, we'd
rather see an error than an implicit fallback to a vendored dependency.
So if USE_SYSTEM_DEPS is set, the build system should enable using
system dependencies whenever supported, and disable all possible
fallbacks to vendored dependencies.

The wording proposed above tries to account for the special case when
the package does not support a system dependency version at all -- e.g.
when they are patching the vendored dependency.  It's not ideal, but I'd
like to avoid blocking a major improvement just because we can't get it
perfect.

The rationale for avoiding vendored dependencies have been repeated many
times, we have one on Gentoo Wiki [2], Fedora has one as well [3].
The main focus is ensuring that our security team is able to address
security issues, but being able to fix bugs and simply avoiding
duplication is also helpful.

I've included mention of shared libraries since some upstreams seem to
prefer static linking for similar reasons that they prefer vendoring.=20
While technically this could be considered a separate issue (and perhaps
deserving a separate flag), I don't think there really are distributions
who want unvendoring but not dynamic linking, so it's simpler to have
a single "distro packager mode" variable.  Again, it assumes that there
will be cases when dynamic linking isn't possible, particularly when
there are no shared libraries.


[1] https://devmanual.gentoo.org/ebuild-writing/functions/src_test/index.ht=
ml#tests-that-require-network-or-service-access
[2] https://wiki.gentoo.org/wiki/Why_not_bundle_dependencies
[3] https://fedoraproject.org/wiki/Bundled_Libraries

--=20
Best regards,
Micha=C5=82 G=C3=B3rny


--=-10Rmr3sqU/Jf3MH200AM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQFGBAABCgAwFiEEx2qEUJQJjSjMiybFY5ra4jKeJA4FAmeSQLwSHG1nb3JueUBn
ZW50b28ub3JnAAoJEGOa2uIyniQOzRcH/AjoJgZUH7FEQ/aYhJ68r81jMPdsHBAg
+WEV2ZyxrKLXrEJ0PAH39Rd8evCPzje7fH5ey6YhuFwJK3ynQd9WRLe6gF9r6L45
QhfA3bb57ahxOqhaYzem4CugQDHbjPmNrWi2UmriIqi5Lo3kxlGbp3Q17kzw7nEE
NOG19sjKBHsl3IMOPr7leSh1qapJdoNLtjXn2GL0MEHL7tQRffOMKRWyTkQqUI0j
ReNEM6Zd5a8YeV7mcIpnduRUF1/ALMAb1OObo7iPceppj8/41LBdD1dqDvvzKMbu
NXoJzZcweuNSF6xs7++L4eZT7ummX683fpvnoMQIPIiGmlVrahcyAgo=
=fpPW
-----END PGP SIGNATURE-----

--=-10Rmr3sqU/Jf3MH200AM--
