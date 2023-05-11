Received: from kurisu.lahfa.xyz (kurisu.lahfa.xyz [163.172.69.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4417F65B
	for <distributions@lists.linux.dev>; Thu, 11 May 2023 11:43:30 +0000 (UTC)
Date: Thu, 11 May 2023 13:35:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lahfa.xyz; s=kurisu;
	t=1683804950; bh=W3cRRFJqzB6C+L4WNmLLHPAtj62+v6vz+h86ZnRHBmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WHBBbe7QWr73bwJBPP8+fmaNQsM/jtiP4vsxrv2mliFg3nKqouomrFedt9gYwtV0q
	 a72Rb2+8Ec/C79nl7WO4OK+SIprmv+tJ5tNIy5RlNgHADTBd2uikCrILUFnVgnHcko
	 gJBMqFRkTDJw0qVyZ6wQDiVwD5KFFqtvmV/BxsYs=
From: Ryan Lahfa <ryan@lahfa.xyz>
To: Neal Gompa <ngompa@fedoraproject.org>
Cc: Alyssa Ross <hi@alyssa.is>, distributions@lists.linux.dev, 
	primeos <dev.primeos@gmail.com>, Lorenz Brun <lorenz@brun.one>, 
	Tom Callaway <spot@fedoraproject.org>, Than Ngo <than@redhat.com>
Subject: Re: Next Chromium release will require unreleased LLVM
Message-ID: <fyojmpiizynnkvvqqwarfubob6vs5xvdi3wpegtgw4ofpksc4v@oldvvj4faghd>
References: <20230511092745.l53qykvz7roq4dqj@x220>
 <CAEg-Je9R02XBCsjP2ZLYKHzNjPvwYVdgO7qND65WOYzR9BWbLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEg-Je9R02XBCsjP2ZLYKHzNjPvwYVdgO7qND65WOYzR9BWbLg@mail.gmail.com>

On Thu, May 11, 2023 at 06:16:03AM -0400, Neal Gompa wrote:
> On Thu, May 11, 2023 at 5:27 AM Alyssa Ross <hi@alyssa.is> wrote:
> >
> > The Chromium 114 beta uses features from LLVM 17, but will release
> > before LLVM 17 does.  Currently, it looks like it wouldn't be too hard
> > to patch to make it compatible with LLVM 16, but in general, we don't
> > have any guarantee that Chromium will build with a released LLVM.
> >
> > So, how do you intend to handle this situation in your distribution?
> > It seems like it will be a problem we'll all share, especially if it
> > gets worse in future.
> >
> > Nixpkgs discussion:
> > https://github.com/NixOS/nixpkgs/issues/213862#issuecomment-1542887001
> 
> I suspect we in Fedora will do the same thing and revert/modify things
> to work with LLVM/Clang 16. It is, however, not out of the question
> for us to ship multiple versions of LLVM+Clang in Fedora, so once LLVM
> 17 is shipped in Fedora, we will probably switch Chromium to that.

We already do the same in nixpkgs (from LLV5 to LLVM16 at the moment,
but hopefully, we start dropping the oldest ones).

> We only recently switched building Chromium from GCC to Clang.
> Switching back might be an option too, depending on what the
> compatibility looks like.

I thought that Chromium was tightly coupled to Clang for compilation.

> I'm personally not a fan of the Clang/LLVM toolchain after having
> worked on building distributions entirely using it before. But alas,
> I'm in the minority. :/

Curious about your pain points, but, probably off-topic. :)

Kind regards,
-- 
Ryan Lahfa
