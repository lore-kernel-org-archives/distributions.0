Received: from uggla.sjd.se (uggla.sjd.se [178.174.241.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F9D3A1E9B
	for <distributions@lists.linux.dev>; Sat,  7 Mar 2026 15:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.174.241.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772899145; cv=none; b=cD5+1oXQBguUuSM6bg5ZvIlQyDzbs2E2+lRmGLLvhgAu04M0B5pIA2SrSi1GyVyyY++QRbIwUHSsn4OynUfQTVBQf9MRaSBuueLE+glynlFm3qRaUNLFje0ELHaGsY88GA38NLOcUw2yrGDTh5G3iiZvUls5u1S3+xTX34oQixA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772899145; c=relaxed/simple;
	bh=Sj0+NFJsTrzY0XT8FTkTUZwz30z2ULqSOH0GtAtnmTU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eDuN5GnB5aKZ7B0y4FZNYulc24B8kqCV1U/Jyi5Gg4NAnQ5RJhpYandooT1GUaIDr5KgRUhgeh6+ud4VEaIGEn0lrxowyoVWU5yPNHhMmWN2qLEhfxoYkWi/+nnEUe6SasSWdVHRjSYnZjm8HmJ3HJ4B9HWeFMI40tv3q+IxXLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=josefsson.org; spf=pass smtp.mailfrom=josefsson.org; dkim=permerror (0-bit key) header.d=josefsson.org header.i=@josefsson.org header.b=sYm4FQzc; dkim=temperror (0-bit key) header.d=josefsson.org header.i=@josefsson.org header.b=wMaEC/uS; arc=none smtp.client-ip=178.174.241.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=josefsson.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=josefsson.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=josefsson.org header.i=@josefsson.org header.b="sYm4FQzc";
	dkim=temperror (0-bit key) header.d=josefsson.org header.i=@josefsson.org header.b="wMaEC/uS"
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=josefsson.org; s=ed2303; h=Content-Type:MIME-Version:Message-ID:Date:
	References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=siFT/iH2P2THjg3LeSxP+0aF2vqBv9EcFUMs/nvB5pA=; t=1772899135; x=1774108735; 
	b=sYm4FQzc57MQKfozM9F9R6e6uD6HX6D1BQNz+vCwGNiQFU4hEGKF9l9PbcMTF5LcWYwW/N5x/pI
	5dCfBptwcBA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=josefsson.org; s=rsa2303; h=Content-Type:MIME-Version:Message-ID:Date:
	References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=siFT/iH2P2THjg3LeSxP+0aF2vqBv9EcFUMs/nvB5pA=; t=1772899135; x=1774108735; 
	b=wMaEC/uSxKU83g6f1AQ6JwzW3/NwK+aTNkH7S/SOGmnwHJFWYwd4C0Kyx1j0GtBBGB1IKpMiyC9
	ADbGr6mWPeXv6WlXDlSHPifyh56ZMQNWouJ6GX1oe4kUVnVXg7fwKlAqOlgO+ZP6svSEjqO3Oj6DO
	9SY123Nd7+xe1pOEB6JAekDxJ6TI1DmEXiNMPBG4Q6LJLuyw2ShDnCWs1Uvod7aOsp/g2ZsZtmh6w
	Dhow8RE0ZhT/RsCC+qXXy8dHJYCbSLxPdlVIVjxDW8BitTQMhcytjc9wxZvIPl1XsYEiOL2kCZqzp
	4Wyg/wtuAM0h2gofM6sfkRkAD/pny2zEXBPSqRS5ZIlO0AVf/djSRoYXFCFXur3JHOqpltmJYH2Fk
	U0GHrEvc1bVQemR2OiZWYKaUksTTtI6WDOHXT2tQiReyJeHK6UxQW/1nyPLY/g27Af/i66u5N;
Received: from h-178-174-130-130.a498.priv.bahnhof.se ([178.174.130.130]:40316 helo=frallan)
	by uggla.sjd.se with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <simon@josefsson.org>)
	id 1vytcK-005OWT-7N;
	Sat, 07 Mar 2026 15:31:00 +0000
From: Simon Josefsson <simon@josefsson.org>
To: Morten Linderud <foxboron@archlinux.org>
Cc: =?iso-8859-2?Q?Micha=B3_G=F3rny?= <mgorny@gentoo.org>,
  distributions@lists.linux.dev
Subject: Re: Looking for advice on how to deal with potential slop packages
In-Reply-To: <aawYbre5_xvhfwKA@framework> (Morten Linderud's message of "Sat,
	7 Mar 2026 13:36:18 +0100")
References: <a3f792e918674e208492a077679ae6ffc88ce0c9.camel@gentoo.org>
	<aawYbre5_xvhfwKA@framework>
OpenPGP: id=B1D2BD1375BECB784CF4F8C4D73CF638C53C06BE;
 url=https://josefsson.org/key-20190320.txt
X-Hashcash: 1:23:260307:mgorny@gentoo.org::pUgj28pcjLrR9sPa:52L9
X-Hashcash: 1:23:260307:distributions@lists.linux.dev::w+9hr6VJbI4kx0t0:9B5O
X-Hashcash: 1:23:260307:foxboron@archlinux.org::sEEty/2cJ008FAvE:9XSG
Date: Sat, 07 Mar 2026 16:31:18 +0100
Message-ID: <878qc38xmh.fsf@josefsson.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
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

Morten Linderud <foxboron@archlinux.org> writes:

> A lot of this is probably already a lost cause I think.

+1

I wonder if there is even consensus to refuse to package AI-rewritten
packages with a different license, such as python-chardet:

https://github.com/chardet/chardet/issues/327
https://github.com/chardet/chardet/issues/331

I think that is a separate category of LLM contributions, unlike the
LLM-assistance used for many years in the Linux kernel.

If AI-rewrites for copyright reasons becomes common, that is problematic
for a free software perspective.  One recurse is to actively chose to
not use such rewrites, but to insist on using copyleft packages as a
policy and preference in order to defend user's rights.

To some extent we already see this split, between copyleft-aligned
GNU/Linux distributions like Guix that default to GnuPG and GNU
coreutils, and some commercial distributions that is on a path to
replace all GPL'd code.

Given that we couldn't establish such consensus in the pre-AI times (for
GnuPG vs Seqoia and GNU coreutils vs uutils), and there even seem to
some preference towards the non-copyleft agenda, I think the same will
happen again for AI-rewrites.

The commercial dynamic is pro LLM and against copyleft.  It is possible
to offer an alternative but it requires an active choice and interested
developers/users.

/Simon

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQNoBAEWCgMQFiEEo8ychwudMQq61M8vUXIrCP5HRaIFAmmsRMcUHHNpbW9uQGpv
c2Vmc3Nvbi5vcmfCHCYAmDMEXJLOtBYJKwYBBAHaRw8BAQdACIcrZIvhrxDBkK9f
V+QlTmXxo2naObDuGtw58YaxlOu0JVNpbW9uIEpvc2Vmc3NvbiA8c2ltb25Aam9z
ZWZzc29uLm9yZz6IlgQTFggAPgIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgBYh
BLHSvRN1vst4TPT4xNc89jjFPAa+BQJn0XQkBQkNZGbwAAoJENc89jjFPAa+BtIA
/iR73CfBurG9y8pASh3cbGOMHpDZfMAtosu6jbpO69GHAP4p7l57d+iVty2VQMsx
+3TCSAvZkpr4P/FuTzZ8JZe8BrgzBFySz4EWCSsGAQQB2kcPAQEHQOxTCIOaeXAx
I2hIX4HK9bQTpNVei708oNr1Klm8qCGKiPUEGBYIACYCGwIWIQSx0r0Tdb7LeEz0
+MTXPPY4xTwGvgUCZ9F0SgUJDWRmSQCBdiAEGRYIAB0WIQSjzJyHC50xCrrUzy9R
cisI/kdFogUCXJLPgQAKCRBRcisI/kdFoqdMAQCgH45aseZgIrwKOvUOA9QfsmeE
8GZHYNuFHmM9FEQS6AD6A4x5aYvoY6lo98pgtw2HPDhmcCXFItjXCrV4A0GmJA4J
ENc89jjFPAa+wUUBAO64fbZek6FPlRK0DrlWsrjCXuLi6PUxyzCAY6lG2nhUAQC6
qobB9mkZlZ0qihy1x4JRtflqFcqqT9n7iUZkCDIiDbg4BFySz2oSCisGAQQBl1UB
BQEBB0AxlRumDW6nZY7A+VCfek9VpEx6PJmdJyYPt3lNHMd6HAMBCAeIfgQYFggA
JgIbDBYhBLHSvRN1vst4TPT4xNc89jjFPAa+BQJn0XTSBQkNZGboAAoJENc89jjF
PAa+0M0BAPPRq73kLnHYNDMniVBOzUdi2XeF32idjEWWfjvyIJUOAP4wZ+ALxIeh
is3Uw2BzGZE6ttXQ2Q+DeCJO3TPpIqaXDAAKCRBRcisI/kdFohFZAQCOzxuWX9tL
IBmZB8bxVwBvVqCaeojFRIYGNO5oLl7yMwEAl0iHR0ew2D06dqwUN4+lrTNpTddk
NWT9E8A3y9K5KQw=
=nJpf
-----END PGP SIGNATURE-----
--=-=-=--
