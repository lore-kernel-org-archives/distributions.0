Received: from master.debian.org (master.debian.org [82.195.75.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC7F30C62E
	for <distributions@lists.linux.dev>; Sun,  8 Mar 2026 04:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772943228; cv=none; b=f1ek0iveXlwzVZiEvznUFbo0o6PdTtfqFivbVddtrpll+FC+Z9/t+C2BTOFadnR32GJOg/FNbY5zsZNIRLeh2/EyUa+6nUbG93QH+qfMkBg8dQ+NpIMwU45F/YN/jFD9BXkDVWn76vDcZKBGg7w19/z806T7zAT/CptE22zyUho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772943228; c=relaxed/simple;
	bh=45d2S5WIf0YwvsANcgPHU8csV4+fMznsvNNuAmxBRGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FzXSF/SiyQyelzAkqGzXIFGcv/eMyEg916nMGXoQeBZq1WgdTKoLZZT7eL6F4lEB4Mk9yRxhDALKQ2mvYXn78os1Bju570/EebSq0SXQrbh4ZgxmhtmzAH/ctnuva3Gk1RjQ+l0Rd3i1CkizfQw+Wefr54w/2SfSusMMlyKrx8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=master.debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=sOqYpYoq; arc=none smtp.client-ip=82.195.75.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=master.debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="sOqYpYoq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.master; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description;
	bh=DrxwfMlnRQGOwNV9p25aLDc2wUP151tVn/jaivYbYdQ=; b=sOqYpYoqzeFBM8tCfXWCGJQz+2
	OegR01D535oYOx5Dnt59NY2GLP4O/rPgG07/r/LHv0DeSNBANwmxCEhYYso8N63AYjdzIZc0YZOre
	BnoaS1NLUdxEChZo5VCn33I0mNZ3rot+MadMFkohnUUMM10CvWIucrXjjEdqj2ouKkZUhrgqeH1Dj
	q395bd9YLEi+gJCAxuOfSWKN3S9DjS3kRGnoBVzwq30rwPrqtUNaJ+KvNOtmLBa3Wo5VxiebkZH0h
	m2SvEhEuqMBYuMDOtjF99HJs1hGlWSpfG8d4fVEKLwG+ClQSlXHnwwZKN9xx3XaCDkObWZjxBA1SL
	gNsH5nxw==;
Received: from guillem by master.debian.org with local (Exim 4.96)
	(envelope-from <guillem@master.debian.org>)
	id 1vz5Ji-005VD0-20;
	Sun, 08 Mar 2026 04:00:34 +0000
Date: Sun, 8 Mar 2026 05:00:33 +0100
From: Guillem Jover <guillem@debian.org>
To: Simon Josefsson <simon@josefsson.org>
Cc: Morten Linderud <foxboron@archlinux.org>,
	=?utf-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>,
	distributions@lists.linux.dev
Subject: Re: Looking for advice on how to deal with potential slop packages
Message-ID: <aaz0Yb3SOXmxiJ5l@thunder.hadrons.org>
References: <a3f792e918674e208492a077679ae6ffc88ce0c9.camel@gentoo.org>
 <aawYbre5_xvhfwKA@framework>
 <878qc38xmh.fsf@josefsson.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878qc38xmh.fsf@josefsson.org>

On Sat, 2026-03-07 at 16:31:18 +0100, Simon Josefsson wrote:
> To some extent we already see this split, between copyleft-aligned
> GNU/Linux distributions like Guix that default to GnuPG and GNU
> coreutils, and some commercial distributions that is on a path to
> replace all GPL'd code.
> 
> Given that we couldn't establish such consensus in the pre-AI times (for
> GnuPG vs Seqoia and GNU coreutils vs uutils), and there even seem to
> some preference towards the non-copyleft agenda, I think the same will
> happen again for AI-rewrites.
> 
> The commercial dynamic is pro LLM and against copyleft. […]

I'm not sure why you felt the need to drag the GnuPG issue here in
this context, when that's already messy enough.

The reason many upstream projects and distributions are distancing
themselves from GnuPG (at various speeds), is a thing of GnuPG's
upstream own making. There's been long standing concerns about its
UI, security and implementation. Mishandling the OpenPGP RFC process
and then subsequently getting off it, and not just refusing to implement
it but in addition creating a schism and a fork in the ecosystem did
not help matters, which is what has triggered many to seriously look
into alternative OpenPGP implementations (which thankfully we have many
to choose from now!). All this has had no relation whatsoever with
licensing.

(BTW and AFAIR most of Sequoia components are either LGPL or GPL.)

Regards,
Guillem
