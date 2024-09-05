Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F8A4A1A
	for <distributions@lists.linux.dev>; Thu,  5 Sep 2024 00:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725496364; cv=none; b=RUAcf0PUN5ZVZC6emk0u9oGweRmO8rKMY7WCQ00RvQhqvoU8ImrquqYOS/311yD9SgPd/qumqgYntQYCX8kkGmj/psxHczkobGQ6AYbFBCOJrfUXcPQijWOAQvNSa1TTVCJpdFjNS6r/pDR46PW9xIYqmAuyC6WxY26yfdj9yZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725496364; c=relaxed/simple;
	bh=NmwY81eA5jeD3m57KBfglIRFkhPZOEUjZJDVGfORWAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKT+KZEefmT5rB143hO5FmEQOM/7/FE9++PNisUZAQeJ/UpwwjKdzUau7WDU/jWnKwEiO6z9IjcgYOKht9ZzyAoSql22e12hhPC+8gT0I5HOHFArou2INPiqwyt2YYlX7Iicns0w6+Yp7apbyIANsYj7+1U5NU1FpqxFyqyFTQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAQYW6Dx; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAQYW6Dx"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7092dd03223so86358a34.1
        for <distributions@lists.linux.dev>; Wed, 04 Sep 2024 17:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725496362; x=1726101162; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mUZhFLa+f2LyA5F2VdNmJi0OsQqwg+iXgf0CF2Q0KZM=;
        b=fAQYW6DxbxGbpE/nWaE7toiKqHpIo690oT9RANq/oGRnLKXBANs7acgqIiXgvYj7MR
         PHbWd4/sAw4Gt36TbKf/zcE2anum4mPMTNzCZbDDDACvApSVELO6HcmEc2Ajj054UiWX
         fVTq+0XKDEpbrHN63uzNmgJsbPyE4HJVNIhAEUtzrvBTOVRf1aBjYykODFCzMIwUdibV
         REWd5sA3ayuit0NZsRbDai4cmZyaDdQb+OZTuJCAYHTzzI2N0HXFsAtUlQz5X8Pw5+0y
         TDsJ3JcEr7VQ+7Oo0hKvDD0ZNleJKI5ZpG4mbaEZHNHPVYOZlrCedHFQPp2GoIr+ZxhT
         OCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725496362; x=1726101162;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mUZhFLa+f2LyA5F2VdNmJi0OsQqwg+iXgf0CF2Q0KZM=;
        b=LmrOhikBlCKsE0doc0hYcbERJ6s1SHJuCzHsgM11guTdAXqbxpboX0zNlCOGxODwQr
         2mo++rN+T/Aenu90RsgSs3Wv+R6P0kGp4bphvZETrOQ4Wi3wjh/P0YuL6laCSFKCStXu
         tLA3MXrjjXshFr0vg/Rws1wPixQGW5U3RSgv85xqRtMRwugDyXKDBha3oavvH8JoeCff
         hHhhx5t6TMNyfk1a4v30P4o5+AFIpnKlzTKSy2isHwBvxsGxR/kUov1s9fbDohncaDtC
         KMtHN1PQy72xcZcCiQZ8NsEdiXYGMxW75fZmvq5cOcqiEQ17w8obOFpZLFm81dUGfr2p
         /9ug==
X-Forwarded-Encrypted: i=1; AJvYcCXHyWQ39FKeHZrFXLmHrqT25kzscrCfPWdqjY6ozkplygrxfI/SCQx6m7BEZIwskXWooz0AQF2YsddwZN7b@lists.linux.dev
X-Gm-Message-State: AOJu0YyhflSOyuzfkCSnxk+578msmDG00ijrQ9/U8F6BG9CrlWX1Taf9
	VteJReF7lVfjMphd4ovmDhm5VHyizXU52XAe2nZnh8RnqkF92AEH
X-Google-Smtp-Source: AGHT+IF4fVIPOsWqETpJ7hyJIABIcl+6AlCDgeQw2HDpyGBmrhuBz1IOatPSKDhTsc4J+b1PL+VmfQ==
X-Received: by 2002:a05:6830:620e:b0:709:33ee:f578 with SMTP id 46e09a7af769-70f706fdf90mr20232802a34.14.1725496361623;
        Wed, 04 Sep 2024 17:32:41 -0700 (PDT)
Received: from dj3ntoo ([2607:fb90:8a0d:69fb:5bbd:882a:2101:3f1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70f671c4278sm3082677a34.76.2024.09.04.17.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 17:32:41 -0700 (PDT)
Date: Wed, 4 Sep 2024 19:32:38 -0500
From: Oskari Pirhonen <xxc3ncoredxx@gmail.com>
To: "Andreas K. Huettel" <dilfridge@gentoo.org>
Cc: libc-alpha@sourceware.org, binutils@sourceware.org, gcc@gcc.gnu.org,
	config-patches@gnu.org, distributions@lists.linux.dev,
	devel@lists.fedoraproject.org, glaubitz@debian.org,
	maskray@google.com, dickey@invisible-island.net,
	toolchain@gentoo.org
Subject: Re: Proposed CHOST change for the 64bit time_t transition
Message-ID: <Ztj8JtJ638FHPW_3@dj3ntoo>
Mail-Followup-To: "Andreas K. Huettel" <dilfridge@gentoo.org>,
	libc-alpha@sourceware.org, binutils@sourceware.org, gcc@gcc.gnu.org,
	config-patches@gnu.org, distributions@lists.linux.dev,
	devel@lists.fedoraproject.org, glaubitz@debian.org,
	maskray@google.com, dickey@invisible-island.net,
	toolchain@gentoo.org
References: <4996568.GXAFRqVoOG@noumea>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0l//PxkQOa9boaIv"
Content-Disposition: inline
In-Reply-To: <4996568.GXAFRqVoOG@noumea>


--0l//PxkQOa9boaIv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 04, 2024 at 17:48:04 +0200, Andreas K. Huettel wrote:
> Dear all,=20
>=20
> in Gentoo Linux we want to change our CHOST triplets for 32-bit glibc sys=
tems that use 64-bit time_t, since
> this is technically an ABI change which breaks binary compatibility [1].
>=20
> We are thinking of adding a "t64" suffix to the ABI field, resulting in f=
or example i686-pc-linux-gnut64,
> armv7a-unknown-linux-gnueabihft64, ... [2]
>=20
> * So far my research indicates that in the GNU toolchain (gcc, glibc, bin=
utils) anything behind -gnu is=20
>   ignored (as ABI version, which this effectively is too). Is this correc=
t or do you foresee problems here?
>   I've had a small chroot rebuild itself (the Gentoo @system set) with i6=
86-pc-linux-gnut64 and only had to
>   add a minor patch to ncurses [3]; everything else worked fine.
>=20

=2E..

> [3] https://bpa.st/HV6BS

FYI, this paste expires in 1 week. Here's the contents:

diff '--color=3Dauto' -ruN ncurses-6.4.orig/aclocal.m4 ncurses-6.4/aclocal.=
m4
--- ncurses-6.4.orig/aclocal.m4	2024-08-29 20:47:34.978057133 +0000
+++ ncurses-6.4/aclocal.m4	2024-08-29 20:48:57.809473044 +0000
@@ -10139,7 +10139,7 @@
 	cf_xopen_source=3D"-D_SGI_SOURCE"
 	cf_XOPEN_SOURCE=3D
 	;;
-(linux*gnu|linux*gnuabi64|linux*gnuabin32|linux*gnueabi|linux*gnueabihf|li=
nux*gnux32|uclinux*|gnu*|mint*|k*bsd*-gnu|cygwin|msys|mingw*|linux*uclibc)
+(linux*gnu*|uclinux*|gnu*|mint*|k*bsd*-gnu|cygwin|msys|mingw*|linux*uclibc)
 	CF_GNU_SOURCE($cf_XOPEN_SOURCE)
 	;;
 (minix*)

--0l//PxkQOa9boaIv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQfOU+JeXjo4uxN6vCp8he9GGIfEQUCZtj8IgAKCRCp8he9GGIf
Ef64AQDRWB3iutTanlfsHGLAbzDqCRo0QhDIAYHXyhtajll7YQEA07Ox/xR/RILT
mphlh5QIfnqRrE95HnV0tqSB97k0Fw0=
=Zh2M
-----END PGP SIGNATURE-----

--0l//PxkQOa9boaIv--
