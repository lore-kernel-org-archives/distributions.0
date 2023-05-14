Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B52EED1
	for <distributions@lists.linux.dev>; Sun, 14 May 2023 06:31:32 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3062b101ae1so7449899f8f.2
        for <distributions@lists.linux.dev>; Sat, 13 May 2023 23:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684045890; x=1686637890;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7yAWM2hFCDZRxDT5I/SIxUM0kAquufjZ70eCQfQ9OQw=;
        b=bL5NlvK1WLY9PUubRr8f49pIS3qvhBeYi+UMXJhn+fN6qiw+RRRZ+OaD09K4y9mohJ
         60sV60yQk2wQ69EB+K7y0z3JUOpySfei63LfgpT/LLIsjbq6Ur15tPsOUDMv7TceGPU1
         c3OAXu8olMJmCPw5YyeCIFgFSR/C15VLigStR5KbK6aQavD4inX/BmNI41Psd7+laosv
         ZzJwRtxrIc+B6z7qVJHDnkv3CPpQ3Fwi6AC5PD4gzwR7E5Imv7BRtZeqo48JnqRCoewb
         daFrOTHzGnZHNgzcGNhlnCNNEt9/f+GCUhQTM+/sVn0No//rUyPXcY0Z+I3iTjjzGZJR
         UDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684045890; x=1686637890;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7yAWM2hFCDZRxDT5I/SIxUM0kAquufjZ70eCQfQ9OQw=;
        b=VblGVrP7REB0jFJJJNwGj9WJ8Vegn4Yp6yNHlHCSXrgTES4B96bzej2TrjiehRZ9Do
         Tcr/QFuu8LVen7vXFbaU2arLqG4kiuu2WjU6TIvK44dENMk0c1gtTnA29TyDCvn1rysE
         Wq7JMa43FUhcPNXFmgqE1ZY9m7+OYJT/sMwpaHxLJLO6z9bhqVWanvOyt5qHYd/LEeoc
         goqcaWFqDWAG3upA96IKmBCp42KALy/BPB727ME/IyOv68tOPsA5JYB/gjogqK6kqF8F
         Xe5OYg/SECmTsvxlL7o/LVEhQjYzPcDqmZTZESx7gwQmJOlIwBdjD53x+KZQMBFm7ras
         IFNg==
X-Gm-Message-State: AC+VfDzOdzbBjdnLXJYNwNM7cqRoje5esDhufCgSmDs3GExsCZgFPfpv
	8xKT/sAI6vZOwO0Ot9yN78g=
X-Google-Smtp-Source: ACHHUZ4V3bIon9LPEq/w3VFxnNxjrp1k7dq7BoN++AfjkmSmfeaXj1qpMTw97X3RnvhBHox4PRc5iw==
X-Received: by 2002:adf:ebc6:0:b0:306:2830:224f with SMTP id v6-20020adfebc6000000b003062830224fmr19273056wrn.23.1684045890098;
        Sat, 13 May 2023 23:31:30 -0700 (PDT)
Received: from dj3ntoo (57.sub-72-109-255.myvzw.com. [72.109.255.57])
        by smtp.gmail.com with ESMTPSA id j10-20020adff54a000000b00304b5b2f5ffsm28434465wrp.53.2023.05.13.23.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 23:31:29 -0700 (PDT)
Date: Sun, 14 May 2023 01:31:23 -0500
From: Oskari Pirhonen <xxc3ncoredxx@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Ard Biesheuvel <ardb@kernel.org>, dkiper@net-space.pl,
	The development of GNU GRUB <grub-devel@gnu.org>,
	distributions@lists.linux.dev
Subject: Re: [PATCH v2 1/6] ia64: Remove support
Message-ID: <ZGCAO_fjvH9rfDQr@dj3ntoo>
Mail-Followup-To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Ard Biesheuvel <ardb@kernel.org>, dkiper@net-space.pl,
	The development of GNU GRUB <grub-devel@gnu.org>,
	distributions@lists.linux.dev
References: <20230511120640.3518732-1-ardb@kernel.org>
 <20230511120640.3518732-2-ardb@kernel.org>
 <8b8ef9b94cb8ce54e24bb2d1954fa35af11636f4.camel@physik.fu-berlin.de>
 <CAMj1kXGTh531PL4sexOC2ERV=rAd=XBHc9fBdA0ZZq_6rVyPdA@mail.gmail.com>
 <d875f33881a025ad967fbbbe97db52c8504a4e52.camel@physik.fu-berlin.de>
 <CAMj1kXEy7d3WxP9ExR5puaVk0V9b7i9ezFY8QXBJEQnj-1PVEg@mail.gmail.com>
 <5c434d4d76f74a0f2ac2eb6e12d5fe56eb8a05b0.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rk4d0M+X3XYaTCmQ"
Content-Disposition: inline
In-Reply-To: <5c434d4d76f74a0f2ac2eb6e12d5fe56eb8a05b0.camel@physik.fu-berlin.de>


--rk4d0M+X3XYaTCmQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2023 at 12:41:47 +0200, John Paul Adrian Glaubitz wrote:
> Hello Ard!
>=20
> On Thu, 2023-05-11 at 16:29 +0200, Ard Biesheuvel wrote:
> > > > Feel free to keep using it, but please stop demanding that our peop=
le
> > > > keep wasting their time on it. If you want to support it in Debian,
> > > > you can carry it as a downstream patch and shoulder the maintenance
> > > > burden.
> > >=20
> > > Who is "our people"? Do you think that you are part of the community =
and
> > > I am not? I don't think this kind of hostility is justified. Neither =
you
> > > nor I own this project.
> > >=20
> >=20
> > Apologies - I had meant to type 'other people' not 'our people'. I
> > rarely contribute to GRUB myself, so I wouldn't consider myself more a
> > part of this community than anyone else.
> >=20
> > But my point remains: I have inferred from your response (and your
> > involvement in similar discussions around the Linux kernel) that you
> > would prefer Itanium support to be retained, right?
>=20
> Not necessarily. I am generally not opposed to removing ia64 support, but=
 it
> should happen in a coordinated form where downstreams and users are invol=
ved.
>=20
> Just dropping support from random projects without prior coordination see=
ms
> like the wrong approach to me. I would suggest posting your plans to the
> distributions mailing list [1], Debian's ia64 mailing list [2], the Gentoo
> developer mailing list [3], the Linux ia64 mailing list [4] and maybe the
> NetBSD ia64 mailing list [5].
>=20
> If you don't get any objections there, I am not going to object either. I=
 just
> want this to happen in an ordered manner.
>=20

For future reference, might I suggest the following "distributions" list
as well: distributions@lists.linux.dev

It's a relatively new list for cross-distro collaboration/PSAs. You can
find the archives here [6].

- Oskari

> > So could you explain who you think should carry the maintenance
> > burden? IA64 will be the only EFI architecture in GRUB that does not
> > boot via an EFI stub in Linux, and this deviation means that retaining
> > support for it is going to take actual developer and maintainer
> > bandwidth. GRUB gets very little of that as it is, which means that
> > keeping IA64 support alive comes at the cost of worse support for
> > other architectures and platforms. (The series that this patch is part
> > of breaks the ia64 build, and i i struggle to see why i should care
> > about that)
> >=20
> > Very few of those people have access to such systems to begin with
> > (probably none), and the companies that manufactured them stopped
> > supporting them in the open source years ago, so testing these changes
> > is not straight-forward, making it unreasonable to demand this from
> > contributors. Also, it is unclear to me why the needs of the few
> > people that do still run such a system are not served by a build based
> > on today's GRUB tree, and why ia64 support needs to be retained going
> > forward.
>=20
> Well, that's why I am suggesting to coordinate this properly and ask pote=
ntial
> users of the code whether they are okay with the removal.
>=20
> Thanks,
> Adrian
>=20
> [1] https://lists.freedesktop.org/mailman/listinfo/distributions
> [2] https://lists.debian.org/debian-ia64/
> [3] https://archives.gentoo.org/gentoo-dev/
> [4] https://marc.info/?l=3Dlinux-ia64&r=3D1&w=3D1
> [5] https://mail-index.netbsd.org/port-ia64/tindex.html
>=20

[6] https://lore.kernel.org/distributions/

> --=20
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer
> `. `'   Physicist
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
>=20
> _______________________________________________
> Grub-devel mailing list
> Grub-devel@gnu.org
> https://lists.gnu.org/mailman/listinfo/grub-devel

--rk4d0M+X3XYaTCmQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQfOU+JeXjo4uxN6vCp8he9GGIfEQUCZGCANQAKCRCp8he9GGIf
Ecg6AQCPxOQnOFLcjDYkBPaYPMnE+O5VMWSu91wDfhxbRDyn/QD/TujtJmpTt6dT
rzu6QANcs5TRM7ZLyJSH2PVaBgyEVwQ=
=65Ov
-----END PGP SIGNATURE-----

--rk4d0M+X3XYaTCmQ--
