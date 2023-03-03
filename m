Received: from vlhl.dev (vlhl.dev [216.238.110.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52928F42
	for <distributions@lists.linux.dev>; Fri,  3 Mar 2023 20:15:55 +0000 (UTC)
Date: Fri, 3 Mar 2023 17:09:24 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vlhl.dev; s=mail;
	t=1677874169; bh=ffItvDcTSCGUnInHVhN8SG90H19VusZ7YNGewNZa12g=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=QPdC20vzzyMBNu3REMxADpF8XMx5VpxDZ/lEq0W2KqGaVrU83OZs9UuiWH0vccFB4
	 c3h9xLkm7RIJ9G+3tZO4VZKakme96Tv1M7WR7ZqXFzqodEgURxA+dypYJBsbyaFEtw
	 n1KCGNuz9zdGixba72TzACcADFiAvBebpDdxUwzNEh58K+X8PTX0LoGHPpKvjCAJqL
	 d/W/BnRvSGGtRJV/Tdx45d2y6n75/A5JeG0E/as1MqV0HaC2cMC6Y8k+r6fbsFhDIV
	 HHycw0jRVkfs/itHAVPYjeufdegjUVUpP0f9/zv72HEgnwz8zxz7iykGWXattRZu8o
	 AHLWerJ1PwHbQ==
From: Anna <navi@vlhl.dev>
To: "distributions@lists.linux.dev" <distributions@lists.linux.dev>
Subject: Re: Y2038, glibc and utmp/utmpx on 64bit architectures
Message-ID: <20230303200924.b6mpmaoh2m62ejkf@lily>
Mail-Followup-To: "distributions@lists.linux.dev" <distributions@lists.linux.dev>
References: <20230303104647.GA20891@suse.com>
 <3067bd0ec5134b039cdb8be9db8da8e5@DB6PR04MB3255.eurprd04.prod.outlook.com>
 <20230303170729.GA4300@suse.com>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dizqdhp32323apsx"
Content-Disposition: inline
In-Reply-To: <20230303170729.GA4300@suse.com>


--dizqdhp32323apsx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Not really, as I wrote in my blog. utmps does not solve all problems
> with utmp/utmps and it's just another daemon doing the same things as
> systemd-logind is already doing.

In the blog post, it was included the following:
> Proposal
>    1. Change all applications, which read utmp, to query systemd-logind i=
nstead
>    2. Stop writing utmp entries after we are sure nobody uses them anymore

> [...]

> What if I don=E2=80=99t use systemd?

> This heavily depends on the libc and init system you are using. For s6 ex=
ists e.g.
> a secure utmp (utmps) implementation, while on the other side musl libc h=
as no
> support for utmp/wtmp at all.

My issue with this is basically leaving everyone that doesn't use
systemd to fend for themselves. We patch those apps to use logind,
remove utmp and then what does non-systemd distros do?

While having two daemons (umtps and logind) at the same time is not that
great of a solution either, it would be better to have an interface that
can work with different backends, so that in a systemd system, you'd
just use logind, but in a non-systemd system, you'd use a standalone
daemon, such as utmps, both using options using the same API on the
application side.

--dizqdhp32323apsx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGTBAABCgB9FiEEOQZJRvkRmxqE3cOfwdTp1azoUpoFAmQCU/NfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDM5
MDY0OTQ2RjkxMTlCMUE4NEREQzM5RkMxRDRFOUQ1QUNFODUyOUEACgkQwdTp1azo
Upo2uAgAorCcrO/bSFQrRLgWnu3J9pIdu4s38WMFUxWRm/vLQvqNRLYR23cLp63B
Jk6Zhd/n/oE28/RgrGiWeqedcBzI82ZDCuNFLtaFN6ma5HPO3eq594AGXFt6o3CC
4MpitrAbvKsQcShV40RTqQYwjnzsv71jgOCCEHbrrak4obg9wHYIxdqMAuLVV91o
SwF07psI93P0KpfuyhLLD8wEcbbd8/w93r2hlukn+Dje0p0epbnJ9fxLewrpyM/2
HCZJvvMAkOLf7nz2V+wSRua7jHt7QqKocpCCkMEnJY4G21hre27dXjH0tnsvKG2y
zI+Yli6RVB5dfyXsfTBYVtdGIhxh+Q==
=J0Y8
-----END PGP SIGNATURE-----

--dizqdhp32323apsx--
