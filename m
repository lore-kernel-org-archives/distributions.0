Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F78C3222
	for <distributions@lists.linux.dev>; Sat, 23 Dec 2023 04:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0dmo6w8"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a2358a75b69so428850866b.1
        for <distributions@lists.linux.dev>; Fri, 22 Dec 2023 20:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703306316; x=1703911116; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YzYHkDZ+ZhNmh2/OCsGqJl9axPpoeGMJGuSMMSIFSA=;
        b=M0dmo6w8hgSCQOhkp39yonajMiPZvMMJ71uZZTybifqltUIfoIWA+zcQYaiGUnZ2fG
         rmPjRRcmf1p52am6gJAbmTrOtkWWg0siPWAzC18FZmsXw1C41seWHe0jT7vcyKWcraTy
         loU/XvbiO97pglwuOTUMXx/3kByU5JYznAucYqisCyZYDG1tqn2hcIiH7E+vsYQ1E/mq
         Po4V8QZFuGzWckl+hViUv2zzOYQhtCFF7xUIUIqKUfNLYet4OksNYVhMeNokcHFIe/rp
         wHC88XO6Td5ThPzRORpSIUV+30w3RwXPp5erafykMeyy1ZLWYAy8ojQjDrUNIAZ6+1Cf
         cwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703306316; x=1703911116;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1YzYHkDZ+ZhNmh2/OCsGqJl9axPpoeGMJGuSMMSIFSA=;
        b=mHEi/IW2nsHjml9DahQgQ16ZjvDtrTARNELZygtHa5Y9QH6kEHbY3d5PbZCgwa6R0W
         s0XUKDV+dZ/qrhRMElAi5h5r2UC5qcg/3ziMGa14SFtDOOUAHTeqXTfRr9ntmjlXScC3
         JblDhRkTjrqWE9SDkXK3LTUW36678CR2AmY7Bmds3akHGLA9IiSmo+eiFx+VbdlWI+Xm
         cvIAevPeXomtLKA3tOPYkS3oMbgIOi848qBI2XxOImHV5EA4kCRa+rI3Fcnk/DXRSwZ1
         Lg+5INzdgTDOgBCEqKayatnkxoewhioVm+a3a/rE+JCHyD4WJwomfzVA/zQcq2FBBFAA
         zLxg==
X-Gm-Message-State: AOJu0Ywz+eiqe4F6h0kKKxMv36u/wuB042isMw6oWyAHuLGcCR/8Ksv5
	Y4q4qNKEsafJkglzK38VdkS5p/olEa486A==
X-Google-Smtp-Source: AGHT+IEESPbUSP+fETtkPv0nCNi5x7kTs28IDomh82WuGD7lyZrqJJ/k3hHN9kueZqiG5eRF5y0tjA==
X-Received: by 2002:a17:906:df52:b0:a19:a409:37dc with SMTP id if18-20020a170906df5200b00a19a40937dcmr2228522ejc.53.1703306316391;
        Fri, 22 Dec 2023 20:38:36 -0800 (PST)
Received: from dj3ntoo (70.sub-97-147-62.myvzw.com. [97.147.62.70])
        by smtp.gmail.com with ESMTPSA id wh15-20020a170906fd0f00b00a26b37e0e7fsm1547694ejb.60.2023.12.22.20.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 20:38:35 -0800 (PST)
Date: Fri, 22 Dec 2023 22:38:29 -0600
From: Oskari Pirhonen <xxc3ncoredxx@gmail.com>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: grub-devel@gnu.org, alexander.burmashev@oracle.com, phcoder@gmail.com,
	distributions@lists.linux.dev
Subject: Re: GRUB 2.12 released
Message-ID: <ZYZkRS-fBQR0pLD_@dj3ntoo>
Mail-Followup-To: Daniel Kiper <daniel.kiper@oracle.com>,
	grub-devel@gnu.org, alexander.burmashev@oracle.com,
	phcoder@gmail.com, distributions@lists.linux.dev
References: <ZYMgIWh22neEPu2y@tomti.i.net-space.pl>
 <ZYPpezkAFb3us9D2@dj3ntoo>
 <ZYW1rXvSjDAQMsiY@tomti.i.net-space.pl>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+ysAnYD1wH2/e1NM"
Content-Disposition: inline
In-Reply-To: <ZYW1rXvSjDAQMsiY@tomti.i.net-space.pl>


--+ysAnYD1wH2/e1NM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 17:13:33 +0100, Daniel Kiper wrote:
> On Thu, Dec 21, 2023 at 01:30:03AM -0600, Oskari Pirhonen wrote:
> > On Wed, Dec 20, 2023 at 18:10:57 +0100, Daniel Kiper wrote:
> > > Hi all,
> > >
> > > GRUB maintainers are proud to announce GRUB 2.12 that has been just r=
eleased.
> > > You can find list of new features and major fixes since release 2.06 =
in the
> > > NEWS file.
> > >
> > > We would like to thank all the people who have contributed to the pro=
ject.
> > >
> >
> > First of all, congrats on releasing. It's been a long time in the
>=20
> Thank you!
>=20
> > making. But...
>=20
> Yeah, I am not happy with that too. I hope we will be releasing yearly
> starting from now and shorten release candence at point when it is
> needed/possible/...
>=20

This is good to hear. I know there's distro maintainers who don't enjoy
having to keep large patch sets on top of the releases.

> > > The tarball is available at https://ftp.gnu.org/gnu/grub/grub-2.12.ta=
r.xz
> > > and its signature at https://ftp.gnu.org/gnu/grub/grub-2.12.tar.xz.sig
> > >
> >
> > The release tarball fails to build because the grub-core/extra_deps.lst
> > file is not included in it. I just sent a patch which fixes it (at least
> > on my end).
> >
> > Hopefully it works for others too and a new release can be made.
>=20
> I have just pushed your patch. If more issues will pop up then maybe
> I will cut a minor release.
>=20
> Daniel

CC'd distributions list in case there's people there who don't watch
this list but might be interested in knowing why the release tarball
fails.

FYI for them, the missing file is grub-core/extra_deps.lst and, at the
time of writing, contains the following line:

    depends bli part_gpt

- Oskari

--+ysAnYD1wH2/e1NM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQfOU+JeXjo4uxN6vCp8he9GGIfEQUCZYZkQAAKCRCp8he9GGIf
EWo6AQDWzoZIwaRTSishNoKHGBvghriJ6HsDSes9nTAHxPutvgD+JO/uTvaUemwI
tBCpYeLTn5UlZ5SxoDgJXEHH3x9TIg0=
=cxPd
-----END PGP SIGNATURE-----

--+ysAnYD1wH2/e1NM--
