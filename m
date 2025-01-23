Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D4B1C5499
	for <distributions@lists.linux.dev>; Thu, 23 Jan 2025 14:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737641351; cv=none; b=bPI7FlsNwu/bQYiCGCt7pSaXoQZQNoLwFTTcWSh+pf940hEGtaDQMtw6oyKnDViPZbPAtVUHnLkmB0IWT+WNL9oihzmlQ8nWII9Izf1U8azNn51j5LnkeDU5dy0IYPeDVQUfx2vAMjAqwDvTRyuk16CQiVGT3uk5Mrdzkrsryr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737641351; c=relaxed/simple;
	bh=n18TSwh5z0NhJQPH+fP6OfwOeXBjMOWD7WVo/mxUv3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ltFCEuMVcLI3WVa+g/y7xvUGeKsvOrvmf4/2Xi+AgyCIzew3kU4Wol0fUjVs2qSxZadzMTsm7qu40Cb+ttpuRnFwzg5Lt9r9Ob/oMFSGfG8N+Grqa9/RvJ7zGAJZbP0Jyc10KdDV5vPwYaIfpBbIbJEiMw6+jQGH1ynba14xNhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [IPV6:2603:6011:3f0:6f00::12ac] (unknown [IPv6:2603:6011:3f0:6f00::12ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: eschwartz)
	by smtp.gentoo.org (Postfix) with ESMTPSA id B591D343480;
	Thu, 23 Jan 2025 14:09:08 +0000 (UTC)
Message-ID: <69766349-be2c-45fb-a67a-bf0362f7b0d7@gentoo.org>
Date: Thu, 23 Jan 2025 09:09:06 -0500
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Standardizing NO_NETWORK and USE_SYSTEM_DEPS environment
 variables
To: Bruno Haible <bruno@clisp.org>, distributions@lists.linux.dev,
 =?UTF-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>
References: <b0726076ea438d59d8b7b5d0f44a4ed6ca11d418.camel@gentoo.org>
 <9658083.GK2ZErXSoo@nimes>
Content-Language: en-US
From: Eli Schwartz <eschwartz@gentoo.org>
Autocrypt: addr=eschwartz@gentoo.org; keydata=
 xjMEZmeRNBYJKwYBBAHaRw8BAQdAYNZ7pUDWhx1i2f3p6L2ZLu4FcY18UoeGC04Gq/khqwfN
 I0VsaSBTY2h3YXJ0eiA8ZXNjaHdhcnR6QGdlbnRvby5vcmc+wpYEExYKAD4WIQTvUdMIsc4j
 CIi+DYTqQj6ToWND8QUCZoRL+gIbAwUJBKKGAAULCQgHAwUVCgkICwUWAgMBAAIeBQIXgAAK
 CRDqQj6ToWND8aB5AP9r4kB691nNtNwKkdRiOdl7/k6WYzokvHvDamXxRJ0I+gEAjZqR5V8y
 mfR3fy2Z+r2Joeqdt3CIv5IwPs64spBvigLOOARmZ5E0EgorBgEEAZdVAQUBAQdATT46Z06b
 1X9xjXFCYFxmq/Tj3tSEKZInDWTpoHQp4l8DAQgHwn4EGBYKACYWIQTvUdMIsc4jCIi+DYTq
 Qj6ToWND8QUCZmeRNAIbDAUJBKKGAAAKCRDqQj6ToWND8a2RAP40KPfbfoiZAJW5boFmFJ3G
 TUBDJRh9CWHyaPqq2PN+0wD/R07oLzfnJUN209mzi9TuTuHjeZybysyqXSw4MAxkMAY=
In-Reply-To: <9658083.GK2ZErXSoo@nimes>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qsVp8nkzLsCD5s0ZTFEZBK2i"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qsVp8nkzLsCD5s0ZTFEZBK2i
Content-Type: multipart/mixed; boundary="------------scpNYAF80P2k2BXytpy1r4XD";
 protected-headers="v1"
From: Eli Schwartz <eschwartz@gentoo.org>
To: Bruno Haible <bruno@clisp.org>, distributions@lists.linux.dev,
 =?UTF-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>
Message-ID: <69766349-be2c-45fb-a67a-bf0362f7b0d7@gentoo.org>
Subject: Re: Standardizing NO_NETWORK and USE_SYSTEM_DEPS environment
 variables
References: <b0726076ea438d59d8b7b5d0f44a4ed6ca11d418.camel@gentoo.org>
 <9658083.GK2ZErXSoo@nimes>
In-Reply-To: <9658083.GK2ZErXSoo@nimes>

--------------scpNYAF80P2k2BXytpy1r4XD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 1/23/25 8:50 AM, Bruno Haible wrote:
> Micha=C5=82 G=C3=B3rny wrote:
>> 2) USE_SYSTEM_DEPS -- if it's set to a non-empty value, it requests th=
at
>> the build system does not use any vendored dependency for which it
>> supports using a system version instead, and that it links to shared
>> libraries whenever possible.
>=20
> This contradicts the GNU Coding Standards [1]. For GNU packages,
> configuration of such things should be done through --with-* and --with=
out-*
> options. NOT through environment variables.
>=20
> Proposing something that contradicts the GNU Coding Standards is a non-=
starter.
>=20
> Bruno
>=20
> [1] https://www.gnu.org/prep/standards/html_node/Configuration.html


Meson will not implement this environment variable either, for the same
reason.

We won't implement either one, in fact (for us, network is relevant
since meson has an automatic feature to download vendored dependencies
on demand). We have a configuration option accepted on argv to control bo=
th.

=2E..

In general I think we are all quite aware of the reasons for avoiding
the network and in general build systems shouldn't attempt to
communicate via TCP/IP whether an environment variable is set or not...
unless the success of the build system directly hinges on network, and
failing to network directly means failing to build. That is the case for
meson with vendored deps, so configuring to use system deps already
means that no network connections will be made (but if you do use
vendored deps, all network downloads are securely verified via secure
hashes). So it suffices to simply design your build system to default to
system deps (meson already does this).

It's quite unclear to me why this should hinge on an environment
variable of all things. If you need an environment variable to control
this, you already failed somewhere else.


--=20
Eli Schwartz

--------------scpNYAF80P2k2BXytpy1r4XD--

--------------qsVp8nkzLsCD5s0ZTFEZBK2i
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQTnFNnmK0TPZHnXm3qEp9ErcA0vVwUCZ5JNggUDAAAAAAAKCRCEp9ErcA0vV9c2
APsGRUSZEZ/neIaGTHH5zZmlSpNKrOzqJJ5eBGH2lFZ04AD/csB05ZZcNTTbvtcAeVkL8HSnF31h
XsP38jeUwSNErAs=
=yoin
-----END PGP SIGNATURE-----

--------------qsVp8nkzLsCD5s0ZTFEZBK2i--
