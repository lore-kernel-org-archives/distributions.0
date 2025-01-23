Received: from uggla.sjd.se (uggla.sjd.se [178.174.241.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416DF1CA8D
	for <distributions@lists.linux.dev>; Thu, 23 Jan 2025 14:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.174.241.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737642689; cv=none; b=B2QDc18D9Hwyf7HbWIV9/GzzGcyk9/hHNKCY+xMDLx8eCQBhmzMAsK1Gh0/XPVSMrJ50w5xUsda0Rm/29S92YGWNkSUVXkvOQHMErUpLpFtL+LBXwNdEDkCyCeeZDf8ahfDBy9g5Nk8GZf4553mc2sMGuCvAP9kUo/jMbdOl1V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737642689; c=relaxed/simple;
	bh=V7mSBahzQaQXCpOWN3JcvJRC/QYtb7QEU9+JUzLa/NQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=G8dR572kvqVdo9/WrJWmyIRTz02Yc41oQafMtJn+Fl6VFN+izubSCLhObMEVdAz8evyQvl9Tt5M5LtAg+LFrusX5/yrtWal4Uh+VO/eSR7bMCn3D6wz82zVIwaOB71za7iP/NjN9F/Bh5yf4jHo0APbNUusqMhgSx1Fu2yllFKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=josefsson.org; spf=pass smtp.mailfrom=josefsson.org; dkim=permerror (0-bit key) header.d=josefsson.org header.i=@josefsson.org header.b=DFCnVZ3r; dkim=temperror (0-bit key) header.d=josefsson.org header.i=@josefsson.org header.b=slAV7SLe; arc=none smtp.client-ip=178.174.241.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=josefsson.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=josefsson.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=josefsson.org header.i=@josefsson.org header.b="DFCnVZ3r";
	dkim=temperror (0-bit key) header.d=josefsson.org header.i=@josefsson.org header.b="slAV7SLe"
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=josefsson.org; s=ed2303; h=Content-Type:MIME-Version:Message-ID:Date:
	References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dXwUuVMD80kqoAG6Z/a/cJQ+jgHX8rYIbIlBBVn4S9Y=; t=1737642668; x=1738852268; 
	b=DFCnVZ3rfRSj5rjhUxGWfs8ugaxT1kQkRzhslrSH1y53hPfnJ8HDDUxoX/aMYPbaGOSDVWOv8IP
	429/SiCU9Bg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=josefsson.org; s=rsa2303; h=Content-Type:MIME-Version:Message-ID:Date:
	References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dXwUuVMD80kqoAG6Z/a/cJQ+jgHX8rYIbIlBBVn4S9Y=; t=1737642668; x=1738852268; 
	b=slAV7SLehU2Z4ApyY0XT+kblI1mrJh4paVJ6K2y/Yzaey6nENzIGulB7jUQjSBNikiAdi9+teCn
	3qXqCA3VwDAvBdilACQi8z33/PZuIpoVN4OCqrQ/TgnYkbRcjcDEuzKwJGW58I+dhDDNKFyg10nsK
	kgqCD6FzW05Q9iTljXrMP8vdvgWSD1QKel7KKdlItXqC1+wS5EMHJ/UHQFXdGab7+acpy28hldDF/
	L0A2+IM7kxb3fKjMNiFFzmozW5TfKDJxcSOWUpeljte5r+pEvglnY3r7fPYRDtquowCHXiQiB3OSc
	iGaYf6pHKLZxQ8NJiJeEuTXq8TDUKbyRF73Y0yq60rbeGjdanaomyCDtgpxTXjT8xhH78atjNVT1H
	JJa20CwQrQREc+3pui16su+fZI2Oo/JgaIZKIvibkB0Dr2hcG+Aysd0TEiuV0pp3G0NSYFEjn;
Received: from h-178-174-130-130.a498.priv.bahnhof.se ([178.174.130.130]:35104 helo=kaka)
	by uggla.sjd.se with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <simon@josefsson.org>)
	id 1taxeG-005jPH-4O;
	Thu, 23 Jan 2025 13:53:32 +0000
From: Simon Josefsson <simon@josefsson.org>
To: =?iso-8859-2?Q?Micha=B3_G=F3rny?= <mgorny@gentoo.org>
Cc: distributions@lists.linux.dev
Subject: Re: Standardizing NO_NETWORK and USE_SYSTEM_DEPS environment variables
In-Reply-To: <b0726076ea438d59d8b7b5d0f44a4ed6ca11d418.camel@gentoo.org>
	(=?iso-8859-2?Q?=22Micha=B3_G=F3rny=22's?= message of "Thu, 23 Jan 2025
 14:14:36 +0100")
References: <b0726076ea438d59d8b7b5d0f44a4ed6ca11d418.camel@gentoo.org>
OpenPGP: id=B1D2BD1375BECB784CF4F8C4D73CF638C53C06BE;
 url=https://josefsson.org/key-20190320.txt
X-Hashcash: 1:23:250123:mgorny@gentoo.org::RkJAvVkk7FaTYhjs:AR/N
X-Hashcash: 1:23:250123:distributions@lists.linux.dev::jPvne0QC9RVdnaQ7:IueM
Date: Thu, 23 Jan 2025 14:53:56 +0100
Message-ID: <8734h9ocuj.fsf@josefsson.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: quoted-printable

Micha=B3 G=F3rny <mgorny@gentoo.org> writes:

> 1) NO_NETWORK -- if it's set to a non-empty value, it requests that
> programs don't access the (TCP/IP) network.

To me this sounds like an obviously good idea, and would consider using
both in my upstream and packaging work.

> 2) USE_SYSTEM_DEPS -- if it's set to a non-empty value, it requests that
> the build system does not use any vendored dependency for which it
> supports using a system version instead, and that it links to shared
> libraries whenever possible.
...
> For USE_SYSTEM_DEPS, the primary goal is to build against system
> dependencies.  For example, some upstreams either prefer using vendored
> dependencies or fallback to them when the system dependencies aren't
> found.  However, in Gentoo we really do want stuff to use system
> dependencies -- and if we miss to specify them appropriately, we'd
> rather see an error than an implicit fallback to a vendored dependency.
> So if USE_SYSTEM_DEPS is set, the build system should enable using
> system dependencies whenever supported, and disable all possible
> fallbacks to vendored dependencies.

This sounds really complicated, and speaking as an upstream that would
receive a request like this, my initial reaction would be that an
environment variable like that is a bad idea and that it is better to
handle it by the packager for each distribution.  Why?  In many of my
upstream packages, I have ./configure checks that inspects system
characteristics and changes behaviour of my code as appropriate.  I
believe this is the correct approach to handle system differences.  I
also believe it is not possible to adhear to a variable like that,
because it assumes there is one single ideal "system" version of
dependencies.  This isn't the case for almost anything.  Even trivial
functions like strverscmp() in low-level libc has had behavioural bugs
in them.  Should a USE_SYSTEM_DEPS cause the project to assume that
strverscmp() works correctly or not?  You can repeat this question for
even more trivial matters up to big things where there is no single
right answer at all, consider having to support multiple OpenSSL APIs
for example.  What OpenSSL version is a "system dependency"?  The only
reasonable response upstreams can do for this is to detect system
differences, and act accordingly.  Distributions who package these
packages usually just use the defaults, but if there is a bug for your
particular system (like strverscmp() or OpenSSL check returns
incorrectly), you have to patch things depending on how your environment
looks like.  Upstreams doesn't have the context knowledge you do to do
the right thing here.

/Simon

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQNoBAEWCAMQFiEEo8ychwudMQq61M8vUXIrCP5HRaIFAmeSSfQUHHNpbW9uQGpv
c2Vmc3Nvbi5vcmfCHCYAmDMEXJLOtBYJKwYBBAHaRw8BAQdACIcrZIvhrxDBkK9f
V+QlTmXxo2naObDuGtw58YaxlOu0JVNpbW9uIEpvc2Vmc3NvbiA8c2ltb25Aam9z
ZWZzc29uLm9yZz6IlgQTFggAPgIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgBYh
BLHSvRN1vst4TPT4xNc89jjFPAa+BQJl/YgIBQkLehFUAAoJENc89jjFPAa+CboA
+wUa06RD5e5VTCxvSWtPS75Wq2qBeYGZnf0jvUMxa2n4AP4xkUeAPPnNuMsTm2fs
FCDIGaEM2Yn6Vb2huzzT1Fw/BLgzBFySz4EWCSsGAQQB2kcPAQEHQOxTCIOaeXAx
I2hIX4HK9bQTpNVei708oNr1Klm8qCGKiPUEGBYIACYCGwIWIQSx0r0Tdb7LeEz0
+MTXPPY4xTwGvgUCZf2IKwUJC3oQqgCBdiAEGRYIAB0WIQSjzJyHC50xCrrUzy9R
cisI/kdFogUCXJLPgQAKCRBRcisI/kdFoqdMAQCgH45aseZgIrwKOvUOA9QfsmeE
8GZHYNuFHmM9FEQS6AD6A4x5aYvoY6lo98pgtw2HPDhmcCXFItjXCrV4A0GmJA4J
ENc89jjFPAa+GcYA/26YQY05bLtnXiIjTiAzrGQrRXxTHPA8Av7TDFHvIetWAP9s
HSoU8OfTwmTiEnGwLlsV7QJclZg3YNz/Ypcp9TqQBrg4BFySz2oSCisGAQQBl1UB
BQEBB0AxlRumDW6nZY7A+VCfek9VpEx6PJmdJyYPt3lNHMd6HAMBCAeIfgQYFggA
JgIbDBYhBLHSvRN1vst4TPT4xNc89jjFPAa+BQJl/YgwBQkLehDGAAoJENc89jjF
PAa+phoA/jrDqIrl/55vUMBhIQv+TP635d2iCTEnyFmbUcP9+gh6APoDsXalVd2c
OGxQtSC+TF8PkZMn1TLkJKAjVxr+xx40AgAKCRBRcisI/kdFop4wAP0SZRGLxJdh
kigeUCSvA7xmZagZlhy0j9f8a/4jiOLVEAEA4zzOCaN8rf97ed6HmpJpvWwkAP7M
JfneWnVTy1kzlgY=
=Wm+w
-----END PGP SIGNATURE-----
--=-=-=--
