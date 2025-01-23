Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDC2F4F1
	for <distributions@lists.linux.dev>; Thu, 23 Jan 2025 15:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737646695; cv=none; b=Ttcdlfgl67jfuuEQ3cv4WU/HEfEEEu+vtxesSbpEcLAx7CZ8L0CEr16p/Bs+yF9+3wWO1enRhi/iH2/Q3y+Lhs24JFThWwAfNUhAKRMl2vfqy3WdB94vMCaoYvTo8SdSDIfcAG99F1Zb5Y0+wUZf8LPXULEGqOZnBlb5hKnv31Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737646695; c=relaxed/simple;
	bh=ub5zjoNDUgpWVvbHyrWK7lauqtw7Z4tfC+P0+M/To0I=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UAjwvSXYh4p+FQ0kP/kfNVysMs9R7GbKSlhunu5onyF2VapU6pF2sc1QCs7Q3eoNoNBks1Fl+EDosvAxAv7qv9Qw6RkF0o+6XgO7QGKaeoelwow5qZ7lY2FYEy9t+mi4MCNOQPQVts2noP/O3XvsGTJjYb8Z5aqssE/VLK5yueM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [192.168.1.1] (c144-147.icpnet.pl [85.221.144.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mgorny)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 4B713343442;
	Thu, 23 Jan 2025 15:38:12 +0000 (UTC)
Message-ID: <3fcbe4eccdb6b6a3ca966ef935261be29f54cb45.camel@gentoo.org>
Subject: Re: Standardizing NO_NETWORK and USE_SYSTEM_DEPS environment
 variables
From: =?UTF-8?Q?Micha=C5=82_G=C3=B3rny?= <mgorny@gentoo.org>
To: Celeste Liu <uwu@coelacanthus.name>, distributions@lists.linux.dev
Date: Thu, 23 Jan 2025 16:38:08 +0100
In-Reply-To: <20250123151916.476793-2-uwu@coelacanthus.name>
References: <b0726076ea438d59d8b7b5d0f44a4ed6ca11d418.camel@gentoo.org>
	 <20250123151916.476793-2-uwu@coelacanthus.name>
Organization: Gentoo
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-wyTbwNcjZ3OKcN/f86Nz"
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-wyTbwNcjZ3OKcN/f86Nz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-01-23 at 23:19 +0800, Celeste Liu wrote:
> On 2025-01-23 21:14, Micha=C5=82 G=C3=B3rny wrote:
> > 1) NO_NETWORK -- if it's set to a non-empty value, it requests that
> > programs don't access the (TCP/IP) network.
>=20
> It may be better to be named NO_INTERNET. Network is a confusing word in =
Linux=20
> world. They can refer to something from only Internet to any protocols in=
=20
> network subsystem, even include AF_NETLINK... I have been asked why my ud=
ev is=20
> broken when my program is in a netns many times. Systemd also have to inf=
orm=20
> this point in their document of PrivateNetwork. So use more limited word=
=20
> Internet to avoid this.

To be honest, I've been trying to follow the term I've subjectively
judged to be the most common.  Some projects also use "socket".

On the other hand, as network namespacing shows, this isn't really
limited to Internet =E2=80=94 we also want to cut stuff from accessing serv=
ices
on local network as well.

> >=20
> > 2) USE_SYSTEM_DEPS -- if it's set to a non-empty value, it requests tha=
t
> > the build system does not use any vendored dependency for which it
> > supports using a system version instead, and that it links to shared
> > libraries whenever possible.
> > [=E2=80=A6]
>=20
> Some build system (e.g. Meson) have infrastructure of switch between syst=
em=20
> library and vendor library, it's good, we only need to expose the switch =
via=20
> environment variable.
>=20
> But in many build system, especially in "modern" build system like Go, Ca=
rgo=20
> (Rust) and NPM (Node.js), they are not good on this infrastructure:
>=20
> Cargo users normally use feature gate to control whether use system libra=
ry, but=20
> the gate name and the gate direction are not standardized, someone use=
=20
> 'vendored-xxx' and some others use 'system-xxx', and in Cargo we can only=
=20
> control the package behavior we faced directly, not indirect dependencies=
. if we=20
> want to control the bahavior of dependencies, the only way is hoping ALL =
the=20
> package author make a feature gate to pass this switch to its dependency.

Well, I have some Cargo experience, so I'm going to focus on this.
In my experience, feature-gating is not the only way this is done.  Some
packages (e.g. zstd-sys) use custom environment variables instead.=20
Others just default to using a system library, with fallback to vendored
version.

> In NPM, the situation is even worse. NPM ecosystem prefer to bundle every=
thing.=20
> They have a --build-from-source in node-gyp, but not all package use it a=
nd it=20
> only affect the library that will be load by nodejs. In fact, many nodejs=
=20
> packages, especially which have some web contents, may download a copy of=
=20
> chromium. The switch for it is not standardized and even not existed in s=
ome=20
> projects.
>=20
> For Golang, it doesn't have any infrastructure for switch. Their library =
is like=20
> an union: either use system library or use vendored version.
>=20
> So the first step may be to build a basic standardized way to use system=
=20
> resources (include link library and use some executable files) in these l=
anguage=20
> and build system's ecosystem.

I am thinking of this proposal as a prelude to that.  What I really
would like to achieve here is to set some standard variable names, so we
could work on individual ecosystems and build systems with standards to
back that work.  In other words, I'd like to avoid having every package
come up with their own custom ways of doing this =E2=80=94 and I'm worried =
that
if there's no "standard" behind my effort, different projects will be
more likely to choose their own variable names (say, NO_INTERNET vs.
NO_NETWORK vs. DISABLE_INTERNET=E2=80=A6), or go for project-local variable
(FROBNICATE_NO_NETWORK).


--=20
Best regards,
Micha=C5=82 G=C3=B3rny


--=-wyTbwNcjZ3OKcN/f86Nz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQFGBAABCgAwFiEEx2qEUJQJjSjMiybFY5ra4jKeJA4FAmeSYmASHG1nb3JueUBn
ZW50b28ub3JnAAoJEGOa2uIyniQO+xIH/jz42Oo2bLlYiJPen1VdreaFklNhAHEm
4ViXokR1/xGcHhspXJIGKU6w1y/fyWB1GLA1vTbZJB0oCBpU3VpR6JCON4jHUk/R
LTUT97JpXmEZfv+IZWpqoZNHEKTlluvoKWvSfU30K5QxQsimt6D7A2u+QVdhnq5O
dmWRtLyAz10exDur4U7zvLFOAklOenqo5cAzCXpi/03jZMzJQe74iR+zPf+fjwwQ
YW6pOZ4urhAdGdDPHG7JWXmGld9zTWMayJyC6T/9s8aNu4W9pzcM+1rABw0GHwjK
a64Z/17nMnsEM5e8AdYrdEjbmZaMUpj68zRYZKrn3r7tTPASf3s8x4Q=
=UJlM
-----END PGP SIGNATURE-----

--=-wyTbwNcjZ3OKcN/f86Nz--
