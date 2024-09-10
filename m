Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF84183CB8
	for <distributions@lists.linux.dev>; Tue, 10 Sep 2024 08:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725957005; cv=none; b=e0JIC483XM34AuQE/lBQ8rnR2CEQNCLI1OPzpcYtpgtRJRHG0ZCy2PAxTdUJ0gp10hEhz9FscQrO6FCaeX5C4dvdGGjCk+U+Y6VbHd75/EkPvaxGuZW9/lFBwfzQPvq8Q0grTkOKEMJ2STOfBaRt+Vk6GogXZOJfUmWTnKRpKqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725957005; c=relaxed/simple;
	bh=W2P8oECwLgY/Do0OWdvvFhYuOGd8l4w+oAZDbwIlr50=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGAei030R0ePIC8Dujf+nUBpHufuXJAU5W3Y46F87nMNJpXBPI0V1XhLv87s741M6c4dPQHXL4j/ZauL5TG4pgfz2vDrPdjkW7zxPAxXEHTdcHbvLZD9n5ytnkVElG7ULayGWh5SGC0c5P1H0QcP2emkz1lw6UfFIrM6RWSCXgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=dWtoksm9; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="dWtoksm9"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 75122415AA;
	Tue, 10 Sep 2024 10:21:28 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
	by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kmydMPGbqsco; Tue, 10 Sep 2024 10:21:27 +0200 (CEST)
Date: Tue, 10 Sep 2024 08:21:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1725956487; bh=W2P8oECwLgY/Do0OWdvvFhYuOGd8l4w+oAZDbwIlr50=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=dWtoksm9Zw7VBDRCrhmqEiX0kMxsom7pS7yahnAgE+Boo0a90wLvb4JLJ2mfT0zlD
	 f3YRcq5L7TOmBUg5UC2Ss9ePHSL8uKkyQG/GBfvaSyMnSFIEZIegKJVz6h5wU/XQnl
	 2qMnL7AtNxP/m48wDuYyM988hrwD037dUpe7moXYt4ysZ3cO0/h1U8DF/2IBl2VKFQ
	 vCJ+io/iUGjLHEOcZBfKL/pWG8ZMndjsL0yDYU25YaLSlH6Ke0VPcW2zLLbUHD2LXs
	 hRe/QE2dGoInkrZpXVm6+qqyM/3CJZGZxBcQXXJzzBKsYN/00FYKh7aNWBdFTIqz35
	 VTjN9PnDGOvwg==
From: Yao Zi <ziyao@disroot.org>
To: Sam James <sam@gentoo.org>, distributions@lists.linux.dev
Subject: Re: tzdata-2024b chaos
Message-ID: <ZuABcMcHqR7VqTma@pineapple>
References: <87jzfk1hwy.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzfk1hwy.fsf@gentoo.org>

On Tue, Sep 10, 2024 at 01:17:17AM +0100, Sam James wrote:
> Hi!
> 
> There's two issues with the latest tzdata-2024b release.
> 
> 1) "Apr" vs "April" which has confused some broken parsers;
> there's a patch for this post-release [0].
> 
> 2) Both libc++ and libstdc++ appear broken with a separate problem
> [1][2][3].
> 
> This manifests in Waybar, for example [4].
> 
> It's not clear to me if libc++ is broken or not, as people in the bug
> may have been testing a clang configured to use libstdc++ (the default),
> and I don't have a system to test it on to hand.

libc++ 18, the latest stable release, seems not to support these
timezone related functions yet.

Best regards,
Yao Zi
