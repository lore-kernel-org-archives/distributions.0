Received: from uggla.sjd.se (uggla.sjd.se [178.174.241.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA9D383C7C
	for <distributions@lists.linux.dev>; Mon, 23 Mar 2026 08:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.174.241.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256354; cv=none; b=UD6U/GUezsGYVkGn4zzLEsZMMTFvHknu9HacsOLsgXP5JMaDZv87IJF//TQoMzXNWKvEFlw497fgHYl0SG5wug0nECxOx5ITSaVkM//P+hHg3yFmBXY/vqloXRAx/yZfAkS3og1VxMzWzZ3/Lulklrm29c93QOBi30F6d3Wue1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256354; c=relaxed/simple;
	bh=/yLcBLBUgoQ2q5eXvBCC7LkEv1xlfOxroZO68CapE9k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iG/KQtrg/w4w+I4fKmcy9MjiWCtqAIWHWER7X2pUl963nmkKZe8ZYefgX1xI5zcp3+Ji1bEQOwolfyf98G2VpkftBVvysCUBLANSNIuIK6PrDrCqgvM3CsyjcoxCK8TfHPYeW6N4hhJlm5m+Ri5KCJpiRjIJsNdyJ/ma7+0RJhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=josefsson.org; spf=pass smtp.mailfrom=josefsson.org; dkim=permerror (0-bit key) header.d=josefsson.org header.i=@josefsson.org header.b=1L0lb5h9; dkim=temperror (0-bit key) header.d=josefsson.org header.i=@josefsson.org header.b=tNSheloh; arc=none smtp.client-ip=178.174.241.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=josefsson.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=josefsson.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=josefsson.org header.i=@josefsson.org header.b="1L0lb5h9";
	dkim=temperror (0-bit key) header.d=josefsson.org header.i=@josefsson.org header.b="tNSheloh"
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=josefsson.org; s=ed2303; h=Content-Type:MIME-Version:Message-ID:Date:
	References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Xll/WAHTC5HXlQCERr99XWDTJcfnmkF1TPtjImBDHvg=; t=1774256338; x=1775465938; 
	b=1L0lb5h9UUEMWmkpJveLcKIzwxptuWMhtRXW9lbH3GBAEj4mUvx2du4IUJNllnA5qyqR+zipfn2
	FpDCy70/eDQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=josefsson.org; s=rsa2303; h=Content-Type:MIME-Version:Message-ID:Date:
	References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Xll/WAHTC5HXlQCERr99XWDTJcfnmkF1TPtjImBDHvg=; t=1774256338; x=1775465938; 
	b=tNShelohqHyozXr9js7qk6DV3589aIgr4X1pwpA+r4rw8TLnknfNLAaM0aZI38S0gmAkbMCF7yj
	sR2dARzlE8EImSU7NQ1B8YjNrBQS2aHcciRJPFUKCLCedcqspd91Hi31zLo05GpPTi61luLxZhOZq
	p52tM3KUfrFQUVtHy1fJtBJS5b+uiIJ0vjMXBa0PT9qBLRMAZmEvnlU1iJjiWQDLNPfoCMHpZkAW3
	Vg1r5ozshBKsQukIBbtBerpws24kUC9pe4O7GoVbaQURM7wT4k2KQoQH3vta4zgGKspQ5C/nEiLhU
	+ZAQkDNfS1FiLKd1swpBOuL3HvLarVdcrnbbu2vAIAeNVxJSKQZ5LQ9+Ns/etBQcnlwODDBR+TYQi
	FQkwK4TFvXcMMvSBjnm64XH7mszwmi8hFjTHHuRUOedjRYaYCgQveCZflvWE553JyOL2iVVz5;
Received: from h-178-174-130-130.a498.priv.bahnhof.se ([178.174.130.130]:42338 helo=frallan)
	by uggla.sjd.se with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <simon@josefsson.org>)
	id 1w4aPs-00Fozo-0v;
	Mon, 23 Mar 2026 08:13:40 +0000
From: Simon Josefsson <simon@josefsson.org>
To: "Andreas K. Huettel" <dilfridge@gentoo.org>
Cc: Morten Linderud <foxboron@archlinux.org>,  =?iso-8859-2?Q?Micha=B3_G?=
 =?iso-8859-2?Q?=F3rny?=
 <mgorny@gentoo.org>,  distributions@lists.linux.dev
Subject: Re: Looking for advice on how to deal with potential slop packages
In-Reply-To: <2081671.zToM8qfIzz@noumea> (Andreas K. Huettel's message of
	"Mon, 23 Mar 2026 00:53:45 +0100")
References: <a3f792e918674e208492a077679ae6ffc88ce0c9.camel@gentoo.org>
	<aawYbre5_xvhfwKA@framework> <878qc38xmh.fsf@josefsson.org>
	<2081671.zToM8qfIzz@noumea>
OpenPGP: id=B1D2BD1375BECB784CF4F8C4D73CF638C53C06BE;
 url=https://josefsson.org/key-20190320.txt
X-Hashcash: 1:23:260323:foxboron@archlinux.org::AJonNXXuHM+/sBbR:03Qt
X-Hashcash: 1:23:260323:distributions@lists.linux.dev::GT2DzgZsShWfW/8Y:1XXo
X-Hashcash: 1:23:260323:mgorny@gentoo.org::DMj2Sw/M2tlE+gKs:4/qY
X-Hashcash: 1:23:260323:dilfridge@gentoo.org::ItVUtWmdwdojIp5F:EP+e
Date: Mon, 23 Mar 2026 09:14:12 +0100
Message-ID: <875x6nt12j.fsf@josefsson.org>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

"Andreas K. Huettel" <dilfridge@gentoo.org> writes:

> Am Samstag, 7. M=E4rz 2026, 16:31:18 Mitteleurop=E4ische Normalzeit
> schrieb Simon Josefsson:
>> Morten Linderud <foxboron@archlinux.org> writes:
>>=20
>> > A lot of this is probably already a lost cause I think.
>>=20
>> +1
>
> Here's another example of a (cryptography-related) package gone full auto.
>
> https://github.com/cpan-authors/Crypt-OpenSSL-RSA/commits/main/?after=3D5=
d7e2e6faf3d6938b55aeebd40f5fb2379248c36+34
>
> Lost cause or not, shouldnt we even try to fight this tendency?

Could the answer be in the follow-on question "How?"?

I can't think of any feasible way to oppose this tendency today.

LLM-authored code is already part of a growing list of low-level and/or
security critical components of the free software eco-system --
including, if I'm not mistaken, Linux, systemd, OpenSSL, Go crypto, etc.

One reaction could be to build a GNU distribution based only on software
components that doesn't contain LLM-authored code.  This assumes we can
even identify that code.  I think that will be challenging -- some
projects are adopting policies to accept LLM-contributions that doesn't
acknowledge or mention that a LLM-assistant was used.  How to make a
decision in that case?

A stronger reaction could be to build a GNU distribution based only on
software components that have a sufficiently strong no-LLM policy.  A
100% "Human-written Software" distribution, based on something similar
to Debian's DFSG but replacing (or augmenting) 'free software' with
'human-written software'.

These things are do-able, but I don't see anyone verbalize the ideas and
starting the work involved.

/Simon

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQNoBAEWCgMQFiEEo8ychwudMQq61M8vUXIrCP5HRaIFAmnA9lQUHHNpbW9uQGpv
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
is3Uw2BzGZE6ttXQ2Q+DeCJO3TPpIqaXDAAKCRBRcisI/kdFomZFAQD8Azxl0BX2
guL/SuZcFQTNcNzW+SHEBlAhJy3w9dYC7wEA98V2FybvlmGlOp0LljmXroqoCbsz
ALj12bzhV7SutQA=
=bZyO
-----END PGP SIGNATURE-----
--=-=-=--
