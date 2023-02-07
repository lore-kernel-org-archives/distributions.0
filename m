Received: from sysrq.in (sysrq.in [37.79.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61190BD27
	for <distributions@lists.linux.dev>; Tue,  7 Feb 2023 06:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=sysrq.in; bh=oCnG0+zAfIa
	zH/JZ3BEw2irpka6koGMX/qoZ5UewuQ0=; h=in-reply-to:references:to:from:
	date; d=sysrq.in; b=tU0zO0fWpr0Ifik4wnb6S0UU6yAWbtElRDlkPzNXoImEQo20lB
	8Zte4LRInoHqt13pxUJesYDz9sY6OrcupmPVzVulpfZjvY6U8lc46rca2PEoJH8zBaJulD
	ibBWTFJufo2WJoESs+feU67fQxvFz0piWSbrEhO/TR/pklJu7+94TSzdEaITFfiWYyG2gx
	nPTvfPJjGtnTuLjUbNIwFVQcIW9w9Iu7/MVU5gLfHRHXOFYUGxrN57P5GtJLa/uFyJ87qV
	IDzNoFnMNYR34Mo/vC03ehsMwAIFVjS3wg2KDr95OIfhME4mLd0VsxQwnqeK4TNZK/GPuO
	9GU+PankhrxQ==
Received: from sysrq.in (localhost [127.0.0.1])
	by sysrq.in (OpenSMTPD) with ESMTPS id 75de2020 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <distributions@lists.linux.dev>;
	Tue, 7 Feb 2023 06:37:15 +0000 (UTC)
Date: Tue, 7 Feb 2023 11:37:14 +0500
From: "Anna (cybertailor) Vyalkova" <cyber+gentoo@sysrq.in>
To: distributions@lists.linux.dev
Subject: Re: Fwd: OpenPGP interoperability issues with gnupg >= 2.4
Message-ID: <Y+Hxmir419WA8nmk@sysrq.in>
References: <Y+FiAeD5eiuC0tMX@hmbx>
 <F30D6590-3E0C-4865-A944-7DE118A619CF@gentoo.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F30D6590-3E0C-4865-A944-7DE118A619CF@gentoo.org>
User-Agent: Mutt/2.2.9 (2022-11-12)

> Hi all,
> 
> I am one of the package maintainers of gnupg on Arch Linux.
> DISCLAIMER: Since December 2022 I am also a contracted developer for the
> Sequoia project (an alternative implementation of the OpenPGP standard
> in Rust).
> 
> We (Levente Polyak and I) are writing to you because you are the
> maintainers of gnupg on other downstream distributions.
> With gnupg 2.4.0 a change has been merged [1], which has gpg operate
> with certificate material in a way that is incompatible with the
> upcoming IETF approved "crypto-refresh" approach.
> This means, that e.g. messages encrypted using a key generated with
> gnupg >= 2.4.0 will not be compatible with OpenPGP implementations
> following the upcoming IETF standard.

Please read this message to understand the background:
https://lists.gnupg.org/pipermail/gnupg-devel/2022-December/035230.html
 
> While this has especially integrators such as Thunderbird [2] and
> keyserver authors worried, it is also a concern for us as a downstream
> distributor of gnupg.
> Some of you have already updated gnupg to >= 2.4.0 in some form, but we
> would like to take the time and open the discussion on this topic, as we
> believe that the change is harmful to the larger OpenPGP ecosystem.
> 
> We are currently still shipping 2.2.x due to (only now resolved) issues
> with our distribution keyring. However, we are wondering how to proceed
> with gnupg in the future, as it will also negatively affect the trust
> model of our own distribution.
> 
> Several scenarios seem likely (depending on adoption):
> 
> * notifying users of upcoming incompatibilities if they create a key
>  with gnupg >= 2.4.0
> * shipping/ using gnupg 2.2.x alongside (or exclusively) for as long as
>  possible
> * undoing the change in gnupg
> 
> We would like to raise awareness and gather some feedback of current
> packagers of gnupg to form a broader response to this issue.
> 
> As mail threads with large To: headers might get very tedious for
> discussing this topic, we would also like to invite you to
> #openpgp-interop on libera.chat [3].

So, is it a real problem or just FUD?

How is it different from u-config people's aggression towards pkgconf?
