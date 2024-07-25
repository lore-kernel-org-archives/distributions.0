Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5671D208A5
	for <distributions@lists.linux.dev>; Thu, 25 Jul 2024 18:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721933719; cv=none; b=YKPd8q2KT6t4Rs0Q6cvq7xgRr6qXQvqEP1Mop/vQ74aIr9dO9Z6E0WOmfBlBE9G8NvcKPkqmrNG7Cm2B5gUlVWEq1FMxKm9cGglT1Pr3HGgepdIwBCx2ocLbEHTF+mZy7IiAf1kdgw2wV9dz3avSPpZsp8G0+VTb8EZv8qvDmII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721933719; c=relaxed/simple;
	bh=7bHdSg7vmv3Re+OgLbvaDSicn0B+xrSuRM7MgGhNYgM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=guA3NjjLmHSZxAooIlv657El9eA78CkjDCrRjBkvSVQLxk2s3fMRNRYCIcETX4x2+pO1QDLEVYBRr5hQ6afIMr+PQiJ7uBwWKbwn6KVSpyNq6taZ/uel69bpaCFVwwZz3H+fW5kC68LRT5yC/5OQIl7K+OjGsBwnE+oMRvjg2Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Message-ID: <18669448-4651-48fd-8d58-6e3b97084c49@gentoo.org>
Date: Thu, 25 Jul 2024 21:55:07 +0300
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Firefox-128 "Privacy-Preserving Attribution" and distribution
 defaults
From: Joonas Niilola <juippis@gentoo.org>
To: distributions@lists.linux.dev
References: <3efaeed6-3277-4355-ba21-4389b26d35cb@gentoo.org>
Content-Language: en-US
In-Reply-To: <3efaeed6-3277-4355-ba21-4389b26d35cb@gentoo.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LSbwu2L0AgJay2UsL2QNuAc0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LSbwu2L0AgJay2UsL2QNuAc0
Content-Type: multipart/mixed; boundary="------------0ACMKrOBuMmenkU6LoynYE9S";
 protected-headers="v1"
From: Joonas Niilola <juippis@gentoo.org>
To: distributions@lists.linux.dev
Message-ID: <18669448-4651-48fd-8d58-6e3b97084c49@gentoo.org>
Subject: Re: Firefox-128 "Privacy-Preserving Attribution" and distribution
 defaults
References: <3efaeed6-3277-4355-ba21-4389b26d35cb@gentoo.org>
In-Reply-To: <3efaeed6-3277-4355-ba21-4389b26d35cb@gentoo.org>

--------------0ACMKrOBuMmenkU6LoynYE9S
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hey,

Firefox-128.0.2 includes a UI fix that disables PPA and "locks" it if
the "Send statistics to Mozilla" config option is turned off. So when
telemetry is disabled, the PPA option can't be turned on. With that, in
my opinion, this whole ordeal becomes a non-issue to distribution
maintainers. It never really was an issue in Gentoo because Firefox can
be compiled with '-telemetry' option turning off all telemetry from
buildtime.

Anyway, here's a patch that turns PPA off by default for those interested=
:
https://phabricator.services.mozilla.com/D216714

I find this method much cleaner than having to add any custom prefs.js
options.

-- juippis

--------------0ACMKrOBuMmenkU6LoynYE9S--

--------------LSbwu2L0AgJay2UsL2QNuAc0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGTBAEBCgB9FiEEltRJ9L6XRmDQCngHc4OUK43AaWIFAmain4tfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDk2
RDQ0OUY0QkU5NzQ2NjBEMDBBNzgwNzczODM5NDJCOERDMDY5NjIACgkQc4OUK43A
aWI1mwf/dI234giLd43bMN2P59BFceplBzyWb/Ln7GT7huHXbDogaKKWnaSGVOvG
RUankCebSndEN7GXwoKysw6z/YRx6fti91xKRrzmtjoGhpEIpyotFZv3xc894N1L
HwC/u94GAe+oKsqnCuNbiEk9pqKSYj4xfauDNKQV9gMDpU/iaPsYmBeHFJ5t0SSy
nnO0L4xteTWbuE2FPtFY/oYh2ZmCKwpkG8eU6a1p4XMs2Rj8hRzJ/16AudDlg2OA
oQeIVzazsOIeMqgZBySBEGrpB3Hgaf481CeD6tAsBKrE0A3Y3yWgFlbbmFNLY+eM
qKj3/Y4qWSK/KmicO5T4btHldmbn2w==
=EWla
-----END PGP SIGNATURE-----

--------------LSbwu2L0AgJay2UsL2QNuAc0--
