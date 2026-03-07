Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641253876C6
	for <distributions@lists.linux.dev>; Sat,  7 Mar 2026 10:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772879890; cv=none; b=GCGzUMsj54JkPHGy8S+ma8aaUA0U5ejnp29YXa1QGRMnqptMwZDjfSTEgAjVNSwv+DdZZM0Nl0EEM4vC6+rG6Qafjvu46vp3UzEhDOQwmgGB3FwYed9qOVHxofUczYZE4gMGaKCF2Ij+Zuu9DICu9888V8iXwJrf7qYnHjRJrGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772879890; c=relaxed/simple;
	bh=FHuHju2Dx6F1m66ZAFlJ3XdjPa1oltqhMK0HsJjaVMQ=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=QqQAbrWBwr9AWU893FqE5qx6kb9bH18zeI8Wa6mS1QDBZ+noIeReiCRy6mVZrCiI3h8oVR8uFhFqXVjyNGbO7pojOFbYJZvBWME6MPIBYzdtvbtA2PFDoZoIsf7l4gWOs/xt5wwxM20qchA24IXOaVf4wM/LrDBtUjUXSbxN6O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [192.168.0.1] (c144-199.icpnet.pl [85.221.144.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mgorny)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 10267340F06;
	Sat, 07 Mar 2026 10:38:06 +0000 (UTC)
Message-ID: <a3f792e918674e208492a077679ae6ffc88ce0c9.camel@gentoo.org>
Subject: Looking for advice on how to deal with potential slop packages
From: =?UTF-8?Q?Micha=C5=82_G=C3=B3rny?= <mgorny@gentoo.org>
To: distributions@lists.linux.dev
Date: Sat, 07 Mar 2026 11:38:03 +0100
Organization: Gentoo
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-z1azW52OSxmOzGbU7N3x"
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-z1azW52OSxmOzGbU7N3x
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, everyone.

Seeing more and more packages embracing LLM-driven development (to the
point of "vibe coding" or slopware), I'm looking for your ideas on how
distributions should deal with that.  I'm basically torn between three
things:

1. My duty towards the users to deliver up-to-date versions of software.

2. My duty towards the users to deliver *good* and *secure* software.

3. My ethical concerns, both directly related to LLM use, and to what
people are using them for.


As you may recall, Gentoo has already a strong policy prohibiting "AI"
contributions [1].  However, this policy applies merely to contributions
to the Gentoo projects themselves, and it does not affect the software
we package.  In fact, compared to binary distributions, Gentoo has had
rather relaxed approach to what's acceptable, that could be summarized
as "as long as it's not outright malicious and somebody is going to
maintain the package".  But over time, I'm having more and more concerns
about the state of FLOSS in general.


The first really doubtful case I've hit was the autobahn project.  I've
learned that it started using LLM-backend coding after it had a series
of releases with *really weird* issues (like "how that could even
happen?!" kind of issues) [2,3,4], and my bug reports were met with lots
of AI slop generated replies, and pull requests that were also complete
slop.  I've eventually called the problem out, and upstream pretty much
lashed at me [5].  Since then, I haven't pushed any new autobahn
versions.  While the issues I've hit were largely related to packaging,
I have no reason to believe that the actual code is any better.  So this
is a case of rejecting slop on basis of low quality.

The second big issue which you probably heard of is one of the
maintainers of chardet using an LLM to rewrite the code while erasing
the original autorship and changing the license, and then being an
asshole about it [6] (you don't want to read that thread, it's complete
shitshow with almost everyone cosplaying lawyers).  Here the primary
concern is copyright and ethics, but it also makes you wonder what the
actual code quality is.

Of course there are just two examples.  There is a lot of projects using
LLMs to various degree, and raising different concerns.  On the other
hand, I feel like a lot of these concerns existed before already, and it
is just that we previously didn't pay attention that much.  I mean, it's
easier to say "they're using an LLM, it must be slop" than actually
inspect the code and say "it's really bad quality".  And people were
being assholes long before LLMs.


What are your experiences, thoughts and ideas how to deal with this?  I
mean, staying on old software versions and hoping people will change
their minds (or more precisely, LLMs will stop being subsidized and
people will have to start paying serious money for their usage) is not
exactly a good idea.  Going around and telling people "please switch
from dependency X to Y because X is slop (and Y isn't yet)" doesn't
sound like the best use of our time either.  And forking?  With the
depressing state of FLOSS these days, I can't even find energy to
maintain my own projects, let alone take anything else.


[1] https://wiki.gentoo.org/wiki/Project:Council/AI_policy
[2] https://github.com/crossbario/autobahn-python/issues/1716
[3] https://github.com/crossbario/autobahn-python/issues/1735
[4] https://github.com/crossbario/autobahn-python/issues/1782
[5] https://github.com/crossbario/autobahn-python/discussions/1818
[6] https://github.com/chardet/chardet/issues/327

--=20
Best regards,
Micha=C5=82 G=C3=B3rny


--=-z1azW52OSxmOzGbU7N3x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iKQEABYKAEwWIQQcFD0bEK7NPNmWHtiOMjR69AVa6AUCaawACxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDISHG1nb3JueUBnZW50b28ub3JnAAoJEI4yNHr0BVro
GmcBAIZogGljsf33qn7MTnXSQ+B82Zm8YnW+bNABAiyet3imAP0ZBg99Y6hoRxex
UDPzsCgLSYEFYX07sKTmQV7gtZu3BA==
=ZqZr
-----END PGP SIGNATURE-----

--=-z1azW52OSxmOzGbU7N3x--
