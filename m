Received: from mail.bmwiedemann.de (mail.bmwiedemann.de [188.40.142.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F2426F28D
	for <distributions@lists.linux.dev>; Wed,  4 Feb 2026 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.142.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770214360; cv=none; b=m4l0PAEsk0VH34RFH3y3gqh4Ks79pUaoclMjkHG97e5DKO5zNXvvxoCKOTy6HPt3xL/NoY8rEtVeOmNqskfTjGkE1xP6PCp5hA62BqbJkU4gbNhjqzAbCMbe6yfg+uOJFABfTg8GOJX3+nU8BdxmcbqsBItZI6iMtmOzX0dIJ+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770214360; c=relaxed/simple;
	bh=wYt5Jo8Fm1wVChcW+4Z2emOu53BRb9fg9LyI2SaZBdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uB7pMGpi96bKNb4pZFJy6WnhvNpZlsO/LRKkD0UulRsfXKNYerYpr3k5UKm2stsRCg7k9YD4xyw4yaSic6OTxPADbSEJUybUrENSXavwV0PSyplG9ylOPY+JhrAG+UF0OVeBDsNnEi6qM1hnlMaoadJftZnT+AhptL+7htdkW0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lsmod.de; spf=pass smtp.mailfrom=lsmod.de; dkim=pass (2048-bit key) header.d=lsmod.de header.i=@lsmod.de header.b=chsLLpEv; arc=none smtp.client-ip=188.40.142.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lsmod.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lsmod.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lsmod.de header.i=@lsmod.de header.b="chsLLpEv"
Received: from mail.bmwiedemann.de (localhost [127.0.0.1])
	by mail.bmwiedemann.de (Postfix) with ESMTP id DE3B79C0;
	Wed,  4 Feb 2026 14:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lsmod.de; s=202205;
	t=1770213923; bh=wYt5Jo8Fm1wVChcW+4Z2emOu53BRb9fg9LyI2SaZBdQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=chsLLpEv8EU/GS8SgwWFCIkSG5URdspDovZQKySDknIiC12kiCOECYdxA2h/4OrlX
	 53lUQUGyzwcF53WHAaLDDdWWhPfTbya9HlFfkOZZa5WHAHYgjAoFcdyeotN5NdI1IP
	 oIcc/99qO7+/aLv3nIWtEROxrZC6+kzSCrFw1XdASwLLOhxQcrufbK7hPIpYBM8J4j
	 55SvENhW0uxNkHtHmb5BJAP6uuenwjcCAE9QdqvMp7/lBDOvAnaC0U3KsV/xxgWch2
	 bRTGrHqQG7V0wb87yiBav4ehLp8xY6DFoy9PHdTewc96yEUztu7P9aPkfywxlMarxS
	 m31fcyBmnWyOQ==
X-Spam-Level: 
Received: from [10.8.5.117] (unknown [10.8.5.117])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.bmwiedemann.de (Postfix) with ESMTPS;
	Wed,  4 Feb 2026 14:05:22 +0000 (UTC)
Message-ID: <39dd1cc7-1fcc-4fe2-98e7-317c58d1a335@lsmod.de>
Date: Wed, 4 Feb 2026 15:05:22 +0100
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: year 2038 is only 12 years away
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "Bernhard M. Wiedemann" <bwiedemann@suse.de>
Cc: "Andreas K. Huettel" <dilfridge@gentoo.org>, distributions@lists.linux.dev
References: <39728878-8cca-48de-a091-4af3d6de7e4e@lsmod.de>
 <47880055.fMDQidcC6G@noumea> <e2130c59-f387-4337-b9f3-7788a805b9ea@suse.de>
 <bce1c7d6cdae9391cf70af226775e03c8d7c3c75.camel@physik.fu-berlin.de>
Content-Language: en-US
From: "Bernhard M. Wiedemann" <bernhardout@lsmod.de>
In-Reply-To: <bce1c7d6cdae9391cf70af226775e03c8d7c3c75.camel@physik.fu-berlin.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------j0aRxOdO7o9l0BU97rV0kcZE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------j0aRxOdO7o9l0BU97rV0kcZE
Content-Type: multipart/mixed; boundary="------------ZqKcX6cEcoZ6f80qbmBCh3zm";
 protected-headers="v1"
From: "Bernhard M. Wiedemann" <bernhardout@lsmod.de>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "Bernhard M. Wiedemann" <bwiedemann@suse.de>
Cc: "Andreas K. Huettel" <dilfridge@gentoo.org>, distributions@lists.linux.dev
Message-ID: <39dd1cc7-1fcc-4fe2-98e7-317c58d1a335@lsmod.de>
Subject: Re: year 2038 is only 12 years away
References: <39728878-8cca-48de-a091-4af3d6de7e4e@lsmod.de>
 <47880055.fMDQidcC6G@noumea> <e2130c59-f387-4337-b9f3-7788a805b9ea@suse.de>
 <bce1c7d6cdae9391cf70af226775e03c8d7c3c75.camel@physik.fu-berlin.de>
In-Reply-To: <bce1c7d6cdae9391cf70af226775e03c8d7c3c75.camel@physik.fu-berlin.de>
Autocrypt-Gossip: addr=bwiedemann@suse.de; keydata=
 xsDiBDa4Do4RBADrHxWZStG7ZjH+EKgROa9ISXQi21wGNSPOA0XiAExp4gotZ7yZJwLL2vkt
 71vNDdLoAexG7cU1jq3aK273qGBF4QOzO/OqUmtq3eugIpGR89Fd3gHFTl7ob62iUyu2Rr9p
 4PV/BHwjAVJQac9Oa9gUjk2J6/FD0aERZLY3MTbj0QCg/3vFC6whS1SLF9dOM9EeqWXyJY8E
 ANnSpHRCUBaehuE/p41sozVhvlDcUuI4JQ4QovTQ1YTHSz6yVARoJ2r2cndoVMVgrBCXcCpk
 gZxirB0Qa7ndYVuqliKSPDmxZCnbPT1P7Guq//VF9+pW6Iaubm9VSL1nnW//ICIOUEfYtbHq
 kpdVdG8sPzBrry7qfqwhOgch6R2FBADevQvDx3CEEEXONlTMNhgW0EjlWfLuHZAyOfDTWCub
 iODbcOHw+e/tTljqSeqSHJmp4H/3UADZd6GIy2BMYJX10mlqJYi07f8U17y/GBozPyLzuZd5
 eFSpmbaJT6iZ84BAG6PIEXugO31A9hvAANUUzEK/K4rsfVH14af9KaAJLs0qQmVybmhhcmQg
 TS4gV2llZGVtYW5uIDxid2llZGVtYW5uQHN1c2UuZGU+wmEEExEIACEFAk0Qo7MCGwMFCwkI
 BwMFFQoJCAsFFgIDAQACHgECF4AACgkQSTYLOx37oWTS8gCg/cwbku8C8/WZ/3UvydSgHAt9
 +LwAoKwqpGwEYs8Ma11lM6rTtomunKL7zsNNBDa4FrIQD/4/V5EEDWT1IlJhGu05woTvkFCc
 gD8L11bX+xP+IWhpez12nuGLcDwH1WJj510YadRe1eLu6eoFgQa0rkowWeyjrA24vbfeVBnC
 qotuKfd924clVippfysI6SqXHjU/X4/xayAPfpIY/tf+xN/UEdcTThv/vWUnIWL6OxtbnNlB
 BRZM5HjbRbhap7IMkAe7+Z+fjS20/iqd7qcWx0oBFjCWCSoEBdyg2WFp1J2sE2ACWSrmU3N2
 +BZ/+xHlWlm9WOUsp70RnXXvCu2U8CmdIxMp397AxjMpPtwNLR6zB08W0ewRGTaHleoVPFwY
 GyNPqFrXXdxPScToNqYCi9rhGXVqj9/BbMddBj6uf1MubW5aayEnRfXwtUZYind18vFh0qgj
 xTVMWiQ/ph7aoqCAWpwuQMx1lWtvuiKw1k6C34JFrNpeXGyiZN/7cCWwwkfmIHe3d0QgCxsR
 j1nMg5eVEK7RWIgu3A/Ff4aYZ4gRrh8HSk31EGEEGuRaTj9nebFI6wxZOC/SGmpmCijxcfnK
 sGBjup54Wdv5Cb5viJyxwAkSCUFRfh3J5a1DpKI4pD/Ew0qwfYsB9BdOFObBfo2APXD/92tS
 qRdsEys+cPWm+J80o9b+JelPOeJygGUSRfATYjz6/q/gdGjz8XA9Dwp4RAyrjd1wC4txqnIi
 yq5kRIxMFwACAg/+IpbFy+a/b5tL8C7L3lWGHoWcBkQU3F0GgP8G7V9wXKd7AGy4gkMvEeXU
 LJjZJJwfMVoxCCSK6DiMJig6sLux+qDLp73opskLH9Qj3lTCHcqCb9PnWDeLhsIimS9GcNwP
 7arwh/92Xo6AAvnVKt9QJq4aW6Vf6PVyuWKZzS1lQX0gw7hH0zkg1C6Qeba+A+sNbKnXDFj6
 cSDSiVCK7PwIkahapuP9N6IaVmHEKgeGVTyZZm7e9urs62XrcrcocH7+EV9Ky9kF3DrOK0Lb
 wm5tvIbSgq5hg5fdvBCOFGDUt56nJmTuNBaE7HiCQ63z1YdUPV9O/yuys85O/5xxcLk3mlxW
 Gbgs0CBotl+PnJ7wNMVZNzq+9bOGqabxoVaM1RO+BdPog4h81+uM0UJW6luJLQ1CNymdoPKS
 vOFK3UAsgj2WLeuKyvnYRJxEmUrtjmSU1JoffMlSuble01yP076N0PvDsfxwrEuW/i1wfYZ5
 KNNHw5RpW83FY6UYGgSHccfs8DDs1NChI2ShuCVdOpu/TX/6BUUtPEVQsW1O+7S6EX/bto22
 0PN7j7QA8GmLMb02RLnlietf73t0A59+mK6vAD4Ccb2yckpVEENtEHqxwH1JLPW5nggxmOgl
 3KyKjHCGPm6UanugKIEIf4rgxrYzu/PEvk3CI5q/k5axFCPPZ/vCTgQYEQIABgUCNrgWsgAS
 CRBJNgs7HfuhZAdlR1BHAAEBn/EAoK+4TcGOJD3w02lSkjaZ8dws4140AJ9LR1WGvnu6Xs+0
 12bW2FfpiwAGOQ==

--------------ZqKcX6cEcoZ6f80qbmBCh3zm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCk9uIDIvNC8yNiAxMToyMiBBTSwgSm9obiBQYXVsIEFkcmlhbiBHbGF1Yml0eiB3cm90
ZToNCj4gDQo+IFNpbmNlIERlYmlhbiBhbHJlYWR5IGhhcyBzd2l0Y2hlZCBpdHMgMzItYml0
IHRhcmdldHMgdG8gdGltZTY0X3QgKGV4Y2VwdCBmb3IgaTM4NiksDQo+IGhhdmUgeW91IGNv
bnNpZGVyZWQgcnVubmluZyBhZGRpdGlvbmFsIHRlc3RzIG9uIERlYmlhbidzIGFybWhmIHRh
cmdldD8NCg0KTm90IHlldC4NCklzIGEgbG9uZyB0aGVyZSAzMi1iaXQ/IEl0IG1pZ2h0IGdl
dCBhIGZldyBleHRyYSBwcm9ibGVtcyB0aHJvdWdoIHRoYXQsIA0KZS5nLiB3aGVuIGF0b2wo
KSBpcyB1c2VkLg0KDQpJJ2QgcHJpb3JpdGl6ZSBnZXR0aW5nIGdjYyB3YXJuaW5ncyBmaXJz
dC4NCg0KQ2lhbw0KQmVybmhhcmQgTS4NCg==

--------------ZqKcX6cEcoZ6f80qbmBCh3zm--

--------------j0aRxOdO7o9l0BU97rV0kcZE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQTykslvYmKwlIQesLNdovN53d8CLgUCaYNSIgUDAAAAAAAKCRBdovN53d8CLmNL
AP9pMxtoBGqqHhZjWyd48qJPS4qA5URXtZE/caFyxanoYwEA0d2q/DRi9u+J3CsdaksWuEtSZ8bY
mhimONHZGlQruQs=
=Qjjp
-----END PGP SIGNATURE-----

--------------j0aRxOdO7o9l0BU97rV0kcZE--
