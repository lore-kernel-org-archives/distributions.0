Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F053830E0D5
	for <distributions@lists.linux.dev>; Wed,  4 Mar 2026 02:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772591298; cv=none; b=u5Smm8EDl0BlZR7B+Mo2kUGlQJ9VA6cIITuYGUu5Urr/YoNG79+mUO1kkAJO4baV+TMs/RG5PqLbppTkU6mYwNnVZop6f0AtrHR/6sUxrFExFn2eTUyVOJXZTYzI6XQ3hQQHsk+z7wegF5zWFaigWxhxgxMy3BLYMzGUXzKH1u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772591298; c=relaxed/simple;
	bh=NPlDpaKCxGU04FZ+Ij66BAL+GdrsAQbvACtvowYU8UA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EARTbGHiiXTuM/mUCLiq0rvy9yd88Z14/PW9mtOcx97fJsuEKt7ZAnkrlo3DOCye8+HbWVtZ+O1qzj6DSgeQ1BH+gcEe4t4y7JVbw8HuKmqgAmGaVneZ5gNoSM2TXoJ6MH7JIWMNhrJU2Qglm+SbUodVJybipEaMTO5t4GOWI84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (2.8.3.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::382])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id D6C9A341F7F;
	Wed, 04 Mar 2026 02:28:15 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Alan Coopersmith <alan.coopersmith@oracle.com>
Cc: distributions@lists.linux.dev
Subject: Re: British Columbia redefines "Pacific Time"
In-Reply-To: <3061027c-4e67-47bd-b8d9-1d848acf3a38@oracle.com>
Organization: Gentoo
References: <3061027c-4e67-47bd-b8d9-1d848acf3a38@oracle.com>
User-Agent: mu4e 1.12.15; emacs 31.0.50
Date: Wed, 04 Mar 2026 02:28:12 +0000
Message-ID: <878qc8gwg3.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alan Coopersmith <alan.coopersmith@oracle.com> writes:

> The Canadian province of British Columbia announced yesterday that they a=
re:
>     "Adopting permanent daylight saving time: =E2=80=98Spring forward=E2=
=80=99 on
>    March 8
>    will be the last time change, ending twice-yearly clock changes."
>
> They've given us 8 months notice to deploy updates to timezone data before
> their now-cancelled switch off of daylight saving time in November
> [...]

*Just* missed the 2026a release as well
(https://github.com/eggert/tz/commit/8b46071fd85a7a9434d63894bac64d30362cc1=
6d),
I note it as I'd assumed the fix was in there until I checked.

> but of
> course, because naming is the hardest thing, they've decided that even th=
ough
> their time will now be the same as Mountain Standard Time, they have
> designated it as "Pacific Time", leading to the IANA TimeZone database fo=
lks
> having a bit of discussion on what timezone labels to generate in output =
time
> stamps:
>
> https://lists.iana.org/hyperkitty/list/tz@iana.org/thread/667WE5QTIA7MP2E=
7NC7T3SO7VLMZLVZS/
>
> They've also pointed out the blast radius may reach a bit beyond their da=
tabase:
>
>> Ruby on Rails' ActiveSupport::TimeZone, for instance, attempts
>> to "[l]imit the set of zones provided by TZInfo to a meaningful subset".
>> It maps the string "Pacific Time (US & Canada)" to "America/Los_Angeles".
>> The baked-in assumptions, once seemingly reasonable, now swiftly break d=
own.
>> https://api.rubyonrails.org/classes/ActiveSupport/TimeZone.html

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEBBAEWCgCpFiEEJaa7iN2bdkxrVUHCc4QJ9SDfkZAFAmmnmLwbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25z
Lm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQyNUE2QkI4OEREOUI3NjRDNkI1NTQx
QzI3Mzg0MDlGNTIwREY5MTkwDxxzYW1AZ2VudG9vLm9yZwAKCRBzhAn1IN+RkCx8
AP9C5NdI21+CgkUf/3N1EkGD45L4YX8G7ZwZCMH9P+G6rAD/fBnvTlBEMJ/8mvgq
Tfb8KZWi2vcqUtGwEoI90VC6dwc=
=JSad
-----END PGP SIGNATURE-----
--=-=-=--
