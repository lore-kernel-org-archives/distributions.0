Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6589014A0B3
	for <distributions@lists.linux.dev>; Sat,  7 Sep 2024 11:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725709984; cv=none; b=Ln0cXWCVBeTHvrA417Ze0TtwiSzIlxeVKtkT/z5odzBic7JSkpopgbAGkWMeTFESgcBpRuvfkPnrqFVxOIg52SELrsepVhI8xz+wtq9aXrZBskSYdwvD4bofTLCwMUmS4ifc2G94G7BdDuUoFjf2JJ6kG6vpuObh4fzRGehzRz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725709984; c=relaxed/simple;
	bh=mDo/GdC6gGrlhXe9hVorObug3broULnXj+L7a4ecNXk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=P4X8lKKZS2C6+8/PQVw83ni5G0QeehyhFbjOojCBNLswnsRfqWS4xQoaEWdvtsz7O6CI93k/a7SAhs1ve3+QrxkigYNJJT67vJq8vAQNN+xbs9dc0Jxc0AkUuUr9UBnJv8HLac7tJ37OJFgB0PlxziY1xFonaR2S+i4h5NAYbGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: =?utf-8?Q?Arsen_Arsenovi=C4=87?= <arsen@gentoo.org>
To: Bruno Haible <bruno@clisp.org>
Cc: Paul Eggert <eggert@cs.ucla.edu>,  "Andreas K. Huettel"
 <dilfridge@gentoo.org>,  Wookey <wookey@wookware.org>,  Khem Raj
 <raj.khem@gmail.com>,  libc-alpha@sourceware.org,
  binutils@sourceware.org,  gcc@gcc.gnu.org,  config-patches@gnu.org,
  distributions@lists.linux.dev,  devel@lists.fedoraproject.org,
  glaubitz@debian.org,  maskray@google.com,  dickey@invisible-island.net,
  toolchain@gentoo.org
Subject: Re: Proposed CHOST change for the 64bit time_t transition
In-Reply-To: <2203672.bO1fEbeGnv@nimes> (Bruno Haible's message of "Sat, 07
	Sep 2024 02:24:06 +0200")
Organization: Gentoo
References: <4996568.GXAFRqVoOG@noumea>
	<6e8dadbc-7ae2-465f-b8f6-d0d62507a191@cs.ucla.edu>
	<8634mckbrn.fsf@gentoo.org> <2203672.bO1fEbeGnv@nimes>
Date: Sat, 07 Sep 2024 13:52:49 +0200
Message-ID: <8634mbhe9a.fsf@gentoo.org>
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

Bruno Haible <bruno@clisp.org> writes:

> Arsen Arsenovi=C4=87 wrote:
>> An alternative that I pondered was to teach the linker about some notion
>> of "compatibility strings" that it would compare and reject if
>> different, plus teaching the compiler how to emit those, plus teaching
>> glibc to tell the compiler to emit those..  We could have key-value
>> pairs in some section.  For each key K, we could have the linker check
>> that, for each (shared or otherwise) object either does not contain K or
>> contains K with the same value as all the other ones, and produce an
>> error otherwise.  On the resulting object, the KV pairs would be the
>> union of all KV pairs of all constituent objects.
>
> This sounds much like the arm eabi attributes: If a .s file does not
> start with
>         .eabi_attribute 20, 1
>         .eabi_attribute 21, 1
>         .eabi_attribute 23, 3
>         .eabi_attribute 24, 1
>         .eabi_attribute 25, 1
>         .eabi_attribute 26, 2
>         .eabi_attribute 30, 2
>         .eabi_attribute 34, 0
>         .eabi_attribute 18, 4
> the resulting .o file cannot be linked with other .o files on the system.
>
> Is it a hassle even for packages that don't use time_t of off_t (such as
> GNU libffcall or libffi).
>
> Yes, it would be useful to have a way to have the linker warn if a binary
> that depends on 32-bit time_t and a binary that depends on 64-bit time_t
> get linked together. But PLEASE implement this in a way that is a no-op
> when time_t is not used by either of the two binaries.

I mentioned that a missing pair should not preclude linking.  This is
because what I imagined is somehow attaching this tag to the typedef for
time_t, or such, so if the typedef is not used, no such tag is emitted.

I'm not sure how feasible that is, I, of course, don't have a full
implementation.
=2D-=20
Arsen Arsenovi=C4=87

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOcEARYKAI8WIQT+4rPRE/wAoxYtYGFSwpQwHqLEkwUCZtw+kV8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0RkVF
MkIzRDExM0ZDMDBBMzE2MkQ2MDYxNTJDMjk0MzAxRUEyQzQ5MxEcYXJzZW5AZ2Vu
dG9vLm9yZwAKCRBSwpQwHqLEk99pAQCKLodLpIQF5XrOTrvxS6zMlsJGZH14UEMK
Ebm4xjitowEA+B3jHbb77fkhKT81ra3nUNzLlZ5nWWO5Ss+fFz90gAU=
=3RYl
-----END PGP SIGNATURE-----
--=-=-=--
