Received: from nautica.notk.org (nautica.notk.org [91.121.71.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928E7F9F0
	for <distributions@lists.linux.dev>; Tue,  2 Jan 2024 13:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=notk.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=notk.org
Received: from smtp.notk.org (nautica.notk.org [91.121.71.147])
	by nautica.notk.org (Postfix) with ESMTPSA id 79CEFC009;
	Tue,  2 Jan 2024 14:20:10 +0100 (CET)
Date: Tue, 2 Jan 2024 14:20:10 +0100
From: Adrien Nader <adrien@notk.org>
To: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
Cc: distributions@lists.linux.dev
Subject: Re: 64-bit time_t
Message-ID: <20240102132010.ubaa43jpni4apot6@notk.org>
References: <2a182576-0382-45ce-a5b4-b469f154a6de@suse.de>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2a182576-0382-45ce-a5b4-b469f154a6de@suse.de>

Hi,

On Tue, Jan 02, 2024, Bernhard M. Wiedemann wrote:
> In https://lore.kernel.org/distributions/6614772.670kD7asE2@nimes/
> Bruno Haible wrote:
> 
> > Regarding the distro people:
> > 
> >   The outcome of a discussion, about a month or two ago, was AFAIU that
> >   Linux/x86 and Linux/arm distros have a choice between
> >     (a) enabling 64-bit time_t for all packages, thus breaking ABI
> >         compatibility once and becoming year 2038 saft, or
> >     (b) staying with the 32-bit time_t, and announcing that their
> >         distro will stop working in 2038.
> >   An incremental or partial move to 64-bit time_t would be too expensive,
> >   did the distro people say.
> 
> or option c)
> One less troublesome solution could be to patch glibc to redefine the 32-bit
> time_t as unsigned so that ABIs could remain compatible and at the same time
> it would support timestamps until 2106.
> Though that would break any application that uses time_t for dates between
> 1901 and 1970 (are there any?).
> Do I miss any other downsides?
> This seems to be the only option that allows legacy-binaries to keep working
> after 2038.
> 
> 
> option d) would be to adapt all libraries that have time_t in their API to
> have both 32-bit and 64-bit time_t variants. The former for compatibility
> with old binaries and the latter for new future-proof binaries. This could
> provide a smooth transition because not all 3rd-party binaries can be
> rebuilt.
> The trouble here would be the effort for the libraries to provide 2 variants
> and for callers to select the right variant.

There is a major issue there and that probably applies to option c) too,
albeit in a different form: we don't know which packages are relevant.

We cannot tell which packages use dates before 1970 since everyone is
free to run "date -d @-1".

And we cannot tell which packages' ABI is influenced by time_t. We could
grep APIs for "time_t" but that's not enough since the type is embedded
in other types and what matters in the end is the ABI.

For Ubuntu, we've been building headers with both 32-bit and 64-bit
time_t in order to compare their ABIs with abi-compliance-checker. It's
been tiresome and it's not complete but at least it shows which
packages' ABI remain the same. This approach is not perfect but it might
be the best at scale.
Out of more than 5200 source packages in Debian unstable mid-December,
roughly 3000 ABIs don't change, more than 600 do and 1100 I couldn't
tell (and then there are some changes due to LFS).

Doing these headers rebuild has taken a lot of time so far because there
are many build failures for a lot of different reasons. It's possible
that you could get something more easily with libabigail (possibly with
abi-compliance-checker's current approach to ABI dumps) but that means
building everything in a different way and it's not guaranteed you get
less failures that way or that results that make sense when looking at
one package also make sense when looking at all a distro's packages.

Also, thinking about it just now: if it's possible to walk up the type
hierarchy through e.g. libabigail, it should be possible to find out
programmatically which types depend on time_t and friends. It might be
interesting to try that as we could then compare that to the results we
have so far.  I'm sure some software changes type definition based on
the size of time_t through preprocessor tests but I can't tell how many
(but maybe we'll find out by comparing results).

-- 
Adrien
