Received: from kurisu.lahfa.xyz (kurisu.lahfa.xyz [163.172.69.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D38ED1
	for <distributions@lists.linux.dev>; Sun, 14 May 2023 19:05:25 +0000 (UTC)
Date: Sun, 14 May 2023 21:05:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lahfa.xyz; s=kurisu;
	t=1684091117; bh=CSA8I9eX4qeIHH1agCVRepqIcKkHA3t7k14rFI/1hbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XHiXcMj2KI8j/9OvwT2sO+3RxDXZXfNCE721TUGpLNRzKuTaO2GBeKgUmaJbYUpwA
	 iyGLLxz8u0rbpMsxIeZRZN8vUfV8WJlnUBtzXM+r5IjKuoe5ziFWMLBpeORTX7SUmJ
	 vpTVuZStonDHuU7lSnuw0Ewup8dJeNKRA9hEzIyo=
From: Ryan Lahfa <ryan@lahfa.xyz>
To: alice <alice@ayaya.dev>
Cc: Alyssa Ross <hi@alyssa.is>, Neal Gompa <ngompa@fedoraproject.org>, 
	distributions@lists.linux.dev, primeos <dev.primeos@gmail.com>, Lorenz Brun <lorenz@brun.one>, 
	Tom Callaway <spot@fedoraproject.org>, Than Ngo <than@redhat.com>
Subject: Re: Next Chromium release will require unreleased LLVM
Message-ID: <zhzmhu5w53igao67nbwv6zldn6ny2lssmaq6fl4ntpn4dcqomi@ksb7rb3yy77g>
References: <20230511092745.l53qykvz7roq4dqj@x220>
 <CAEg-Je9R02XBCsjP2ZLYKHzNjPvwYVdgO7qND65WOYzR9BWbLg@mail.gmail.com>
 <fyojmpiizynnkvvqqwarfubob6vs5xvdi3wpegtgw4ofpksc4v@oldvvj4faghd>
 <20230511114306.vbkabhmytl5dpzp5@x220>
 <CSK485O0FQVG.1CHVG3HMG8FP6@sumire>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CSK485O0FQVG.1CHVG3HMG8FP6@sumire>

On Fri, May 12, 2023 at 09:20:05AM +0200, alice wrote:
> On Thu May 11, 2023 at 1:43 PM CEST, Alyssa Ross wrote:
> > On Thu, May 11, 2023 at 01:35:48PM +0200, Ryan Lahfa wrote:
> > > On Thu, May 11, 2023 at 06:16:03AM -0400, Neal Gompa wrote:
> > > > We only recently switched building Chromium from GCC to Clang.
> > > > Switching back might be an option too, depending on what the
> > > > compatibility looks like.
> > >
> > > I thought that Chromium was tightly coupled to Clang for compilation.
> >
> > Not quite:
> > https://chromium.googlesource.com/chromium/src/+/main/docs/clang.md#Using-gcc-on-Linux
> 
> overall, i think this is a little overblown. it's quite known that latest
> chromium needs whatever latest llvm toolchain to build- perhaps it's a bit new
> that in this instance the llvm toolchain is not even released yet, but i think
> that was inevitable given that chromium's llvm policy is that they bump to
> latest master every 2-4 weeks (see https://chromium.googlesource.com/chromium/src/+/main/docs/toolchain_support.md)
> so, it was a matter of time until an M release required unsupported flags in
> latest released llvm.
> 
> but for distros this is nothing new. for instance when you happen to do a new
> llvm upgrade, you can generally unset chrome_pgo_phase=0 (the vendored pgo
> profile shipped with clang tarball requires latest llvm, so you don't need to
> set this if the stars align, but then you have to set it again when chrome's is
> too new), arch linux for instance have to patch their clang15
> (https://github.com/archlinux/svntogit-packages/commit/410325df892f54322a6abb68569db639128a045d)
> to build it at all with older llvm, M113 rolled some libraries to latest(git) so
> the system ones don't work anymore (common occurence really, every other release
> has this happen), chromium doesn't (yet) support libstdc++13 without a bunch of
> patches (mostly cstdint includes), ...
> 
> so, a patch like reverting the CL for llvm17-only ld.lld flags as linked here is
> nothing out of the ordinary (i think something identical even happened before,
> but i don't remember anymore). i'd imagine everyone would do exactly that, just
> like we all always have, a small trivial patch :)

I was just wondering if there would be a day where it would be hard to
revert the relevant patches from LLVM "git" for building Chromium, which
would require a change in our strategy.

Obviously, a trivial patch is not a big deal.

Kind regards,
-- 
Ryan Lahfa
