Received: from out-40.mta0.migadu.com (out-40.mta0.migadu.com [91.218.175.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5E01119
	for <distributions@lists.linux.dev>; Fri, 12 May 2023 07:20:09 +0000 (UTC)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ayaya.dev; s=key1;
	t=1683876007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vDCTDUAQRnMT5k8XEH69Gyif4VwUqW8fuCTSpCT3O3Q=;
	b=jzeMXls/bU344bbdtZJ7uja+eX6gvFKr/WbdgO2nWXuzq1blWNfl7+FKHiYmCmxEw5ime9
	Jryb8zTqh5b2+PbzSQSV9tqZQ00FVcGTf4qAVDHxdWprbj6m0eMOgDaaLqKJRPpuS450Nv
	lVwACjpTTNxSCB/wLoHdZc1mAab0YwM=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 May 2023 09:20:05 +0200
Message-Id: <CSK485O0FQVG.1CHVG3HMG8FP6@sumire>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "alice" <alice@ayaya.dev>
To: "Alyssa Ross" <hi@alyssa.is>, "Ryan Lahfa" <ryan@lahfa.xyz>
Cc: "Neal Gompa" <ngompa@fedoraproject.org>,
 <distributions@lists.linux.dev>, "primeos" <dev.primeos@gmail.com>, "Lorenz
 Brun" <lorenz@brun.one>, "Tom Callaway" <spot@fedoraproject.org>, "Than
 Ngo" <than@redhat.com>
Subject: Re: Next Chromium release will require unreleased LLVM
References: <20230511092745.l53qykvz7roq4dqj@x220>
 <CAEg-Je9R02XBCsjP2ZLYKHzNjPvwYVdgO7qND65WOYzR9BWbLg@mail.gmail.com>
 <fyojmpiizynnkvvqqwarfubob6vs5xvdi3wpegtgw4ofpksc4v@oldvvj4faghd>
 <20230511114306.vbkabhmytl5dpzp5@x220>
In-Reply-To: <20230511114306.vbkabhmytl5dpzp5@x220>
X-Migadu-Flow: FLOW_OUT

On Thu May 11, 2023 at 1:43 PM CEST, Alyssa Ross wrote:
> On Thu, May 11, 2023 at 01:35:48PM +0200, Ryan Lahfa wrote:
> > On Thu, May 11, 2023 at 06:16:03AM -0400, Neal Gompa wrote:
> > > We only recently switched building Chromium from GCC to Clang.
> > > Switching back might be an option too, depending on what the
> > > compatibility looks like.
> >
> > I thought that Chromium was tightly coupled to Clang for compilation.
>
> Not quite:
> https://chromium.googlesource.com/chromium/src/+/main/docs/clang.md#Using=
-gcc-on-Linux

the issues with building chromium with gcc are twofold:
- skia (part of the chromium build dep tree) is significantly worse built w=
ith
  gcc than clang, see e.g. the skia docs https://skia.org/docs/user/build/
  #supported-and-preferred-compilers. i'd also say that similarly, g++ is m=
uch
  worse as a c++ compiler for the chromium tree- it uses far more memory pe=
r TU,
  etc. (i'd say that for most c++ projects, but most things are not big eno=
ugh
  that you're going to notice)
- the gcc configuration generally requires even more patches to build compa=
red
  to not using it. as noted, it's not tested, so pretty much every release =
there
  can be a small bug or two in the same fashion as this specific case requi=
ring
  intervention. (and this is distinct from libstdc++ vs custom_libcxx, to b=
e exact)

overall, i think this is a little overblown. it's quite known that latest
chromium needs whatever latest llvm toolchain to build- perhaps it's a bit =
new
that in this instance the llvm toolchain is not even released yet, but i th=
ink
that was inevitable given that chromium's llvm policy is that they bump to
latest master every 2-4 weeks (see https://chromium.googlesource.com/chromi=
um/src/+/main/docs/toolchain_support.md)
so, it was a matter of time until an M release required unsupported flags i=
n
latest released llvm.

but for distros this is nothing new. for instance when you happen to do a n=
ew
llvm upgrade, you can generally unset chrome_pgo_phase=3D0 (the vendored pg=
o
profile shipped with clang tarball requires latest llvm, so you don't need =
to
set this if the stars align, but then you have to set it again when chrome'=
s is
too new), arch linux for instance have to patch their clang15
(https://github.com/archlinux/svntogit-packages/commit/410325df892f54322a6a=
bb68569db639128a045d)
to build it at all with older llvm, M113 rolled some libraries to latest(gi=
t) so
the system ones don't work anymore (common occurence really, every other re=
lease
has this happen), chromium doesn't (yet) support libstdc++13 without a bunc=
h of
patches (mostly cstdint includes), ...

so, a patch like reverting the CL for llvm17-only ld.lld flags as linked he=
re is
nothing out of the ordinary (i think something identical even happened befo=
re,
but i don't remember anymore). i'd imagine everyone would do exactly that, =
just
like we all always have, a small trivial patch :)
