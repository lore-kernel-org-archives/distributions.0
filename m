Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C63E1EA7FF
	for <distributions@lists.linux.dev>; Thu,  6 Feb 2025 13:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.210.214.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738850079; cv=none; b=NcD9m1nqjEgXerNgHNHaYVBbvOuNv/XI88HnD+wK4537uMJvKIE7PJUO3ege01YdLRuiokY0eMRkSJWaerI9Siako0hPnMP2UYodY+yOCbWlepDjJcPT/nXW00U7Ja4Mdbg39pCr88NQ5kKsFJXlb7JNek6qmYDQrcGM9t6UnS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738850079; c=relaxed/simple;
	bh=eiL/28GNyEOy9yy2ZsMxN+xnC9BnTG3ubBKw9LL+6qY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqiS7xmMV7tsGI04m2hByS2HvBYs6qqESIjCYEWJK+rw3hlqBWWFdf2oEXUOYl6fncPemA4HupfCrkvXwQopibqyMUH72DkMz3d393FNZ++um1QexgSQxr5ydIH6vbsETVp6ySi93nZ4nrMubIgGcMew7fZZgdt7hqN3EuEM/5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=notk.org; spf=pass smtp.mailfrom=notk.org; arc=none smtp.client-ip=62.210.214.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=notk.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=notk.org
Received: from smtp.notk.org (submarine.notk.org [IPv6:2001:bc8:3310:100::1])
	by submarine.notk.org (Postfix) with ESMTPSA id B528014C2D3;
	Thu,  6 Feb 2025 14:48:04 +0100 (CET)
Date: Thu, 6 Feb 2025 14:48:04 +0100
From: Adrien Nader <adrien@notk.org>
To: Sam James <sam@gentoo.org>
Cc: distributions@lists.linux.dev
Subject: Re: openssl 3.3 & 3.4 need patch for arm64 asm
Message-ID: <yhpwtug56qu7c27bppk2d3w55abmzjbiyk6xfi4zhvqm24p5db@n47ivtemfltg>
References: <87cyfv5iit.fsf@gentoo.org>
 <874j175i8q.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <874j175i8q.fsf@gentoo.org>

Hi,

On Thu, Feb 06, 2025, Sam James wrote:
> Sam James <sam@gentoo.org> writes:
> 
> > Hi!
> >
> > As was originally reported at https://gcc.gnu.org/PR118537 and
> > on the Postgres ML [0], OpenSSL 3.x and 3.4 have broken asm for
> > arm64 and need a patch backported to avoid runtime problems.
> >
> > 3.3: https://github.com/openssl/openssl/commit/4f7d8b2724ea7f42cff1e8a0e736ad448def60f5
> > 3.4: https://github.com/openssl/openssl/commit/3ad2277e4522d363ae31a1888531915bb68964dc
> > PR: https://github.com/openssl/openssl/pull/26469

Almost coincidentally, 3.4.1 and 3.3.3 with these fixes will be released
on the 11th due to a High-severity issue:
https://marc.info/?l=openssl-announce&m=173868687506329 .

-- 
Adrien
