Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0481CA8D
	for <distributions@lists.linux.dev>; Thu, 23 Jan 2025 14:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737643068; cv=none; b=Yecamvdg5+VMvzTx5IX13S8jbuDfjozIwqGR0gA42+c2tQG4UFM6AvoUPkpCOOq0UuGfTzJ6oyWP5NlzJMn0OFm3hNMYL+j17yPHygoALICBYloFvOEVSKPvyGmE1KeMrDsjuQQdeqy5UgJqNF/Ug/jc/Jl+cU+xGMYdx5dcbNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737643068; c=relaxed/simple;
	bh=DfXwwfR1Jmx0DpWvAfJaEjEWs6G+Ag1BFl7BtVUhTAY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UhGqJBkXQGNw0ICyR8xlo4s+YBewBCD8+QGsHrjXE0obMRAB8LSOhLIv79VMo3/zZK/Bf5G5MczQWuo75SSa7EdgEAe4Lwaskquu67OA7oYmcec7BDbDJkLDM362cxMTv3aQa5w3U3BAmmNdguAV4pQ1WjdmBxV8LxtEWP+5hlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [192.168.1.1] (c144-147.icpnet.pl [85.221.144.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mgorny)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 427EC343428;
	Thu, 23 Jan 2025 14:37:45 +0000 (UTC)
Message-ID: <b0552f23a76c470ba513275fc68a0a03252c137e.camel@gentoo.org>
Subject: Re: Standardizing NO_NETWORK and USE_SYSTEM_DEPS environment
 variables
From: =?UTF-8?Q?Micha=C5=82_G=C3=B3rny?= <mgorny@gentoo.org>
To: Simon Josefsson <simon@josefsson.org>
Cc: distributions@lists.linux.dev
Date: Thu, 23 Jan 2025 15:37:34 +0100
In-Reply-To: <8734h9ocuj.fsf@josefsson.org>
References: <b0726076ea438d59d8b7b5d0f44a4ed6ca11d418.camel@gentoo.org>
	 <8734h9ocuj.fsf@josefsson.org>
Organization: Gentoo
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-NapxduULrTMjwYMv7zCU"
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-NapxduULrTMjwYMv7zCU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-01-23 at 14:53 +0100, Simon Josefsson wrote:
> Micha=C5=82 G=C3=B3rny <mgorny@gentoo.org> writes:
>=20
> > 1) NO_NETWORK -- if it's set to a non-empty value, it requests that
> > programs don't access the (TCP/IP) network.
>=20
> To me this sounds like an obviously good idea, and would consider using
> both in my upstream and packaging work.
>=20
> > 2) USE_SYSTEM_DEPS -- if it's set to a non-empty value, it requests tha=
t
> > the build system does not use any vendored dependency for which it
> > supports using a system version instead, and that it links to shared
> > libraries whenever possible.
> ...
> > For USE_SYSTEM_DEPS, the primary goal is to build against system
> > dependencies.  For example, some upstreams either prefer using vendored
> > dependencies or fallback to them when the system dependencies aren't
> > found.  However, in Gentoo we really do want stuff to use system
> > dependencies -- and if we miss to specify them appropriately, we'd
> > rather see an error than an implicit fallback to a vendored dependency.
> > So if USE_SYSTEM_DEPS is set, the build system should enable using
> > system dependencies whenever supported, and disable all possible
> > fallbacks to vendored dependencies.
>=20
> This sounds really complicated, and speaking as an upstream that would
> receive a request like this, my initial reaction would be that an
> environment variable like that is a bad idea and that it is better to
> handle it by the packager for each distribution.  Why?  In many of my
> upstream packages, I have ./configure checks that inspects system
> characteristics and changes behaviour of my code as appropriate.  I
> believe this is the correct approach to handle system differences.  I
> also believe it is not possible to adhear to a variable like that,
> because it assumes there is one single ideal "system" version of
> dependencies.  This isn't the case for almost anything.  Even trivial
> functions like strverscmp() in low-level libc has had behavioural bugs
> in them.  Should a USE_SYSTEM_DEPS cause the project to assume that
> strverscmp() works correctly or not?  You can repeat this question for
> even more trivial matters up to big things where there is no single
> right answer at all, consider having to support multiple OpenSSL APIs
> for example.  What OpenSSL version is a "system dependency"?  The only
> reasonable response upstreams can do for this is to detect system
> differences, and act accordingly.  Distributions who package these
> packages usually just use the defaults, but if there is a bug for your
> particular system (like strverscmp() or OpenSSL check returns
> incorrectly), you have to patch things depending on how your environment
> looks like.  Upstreams doesn't have the context knowledge you do to do
> the right thing here.
>=20

Well, I haven't said it's going to be easy.  This will really need to be
decided on case-by-case basis.

Sure, if we are talking about things such as libc differences,
i.e. things that cannot be trivially fixed by installing a missing
dependency or upgrading one, USE_SYSTEM_DEPS wouldn't be applicable
here.

However, if I understand the OpenSSL case correctly, then it would fall
under USE_SYSTEM_DEPS.  If you determine that my system has a broken
OpenSSL library (or there is some other problem related to the check),=C2=
=A0
I want to know it, and explicitly decide how to address it.

If the problem is that our OpenSSL is too old, we probably need to bump
the dependency.  If there is something wrong with the check, we want to
look into fixing it.  All that is useful information, and if the package
chose to instead work around the problem, we may not even notice that
something is wrong.  And this is not just theory -- more than once I've
accidentally noticed bugs that were present in our packages for a long
time, but nobody noticed them because the build system chose to
workaround them.

And now imagine a situation where a problem with OpenSSL check results
in using a vendored vulnerable version of OpenSSL.

--=20
Best regards,
Micha=C5=82 G=C3=B3rny


--=-NapxduULrTMjwYMv7zCU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQFGBAABCgAwFiEEx2qEUJQJjSjMiybFY5ra4jKeJA4FAmeSVC4SHG1nb3JueUBn
ZW50b28ub3JnAAoJEGOa2uIyniQOwK0H/jLKjYuIbqL3SkfGbbeqgqDLjnwZMtUo
EXHnSXPPN9U/utH5/SAbvwSaa5q7JaxslRcJjOZo7IZM5C0HDrmYfQGXIdr/xRE8
sEwrq0yabBXHGz/xqg6BOuIkwnEtgWkbRhm3lbiS5vAwa6w7xiYGI5c+4xqTG4oD
LtDIRxzsfsAaH3+gQE9/1BXRrG3erpZ6Qghb/vwONbuKE6z0SIUhz8TvoAZYBSZc
2MekYfly0dj7gD7RjYLT2YXKpGrrj50slhIv/yUzSKxJUDl5DAlD35OF5qDy4r7N
EL5IkPxXRd0487QWLuKrsgWlynXVClXgMwTfKJAXQMCrbvDlCV3K+m8=
=/wjY
-----END PGP SIGNATURE-----

--=-NapxduULrTMjwYMv7zCU--
