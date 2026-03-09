Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B7C413236
	for <distributions@lists.linux.dev>; Mon,  9 Mar 2026 19:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773086272; cv=none; b=dm4J035CXOO3HyVM82demlhArU7RDOEX+ap/gHSpchMz3AqeMf8B2u+PNp+ULzc1A/kwUSkK9qvseICMpsgmstaFkQd2G9BS1pg64I/DDEvcBZKDRnQaMMH7bEi8KMmI6UDKCaFgploriCNrHM2T3DsL9RBLtCdlgpT7hIeQPGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773086272; c=relaxed/simple;
	bh=MIU0ONmTrE3RQDHka1F2aC1m8Pj/rr77Pz/A5QiQKcM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Gb1s7bG/jGYN+MaJFxdyaby2tL5JToNT0ztdRfdnCt7EkyEzyp/1ec74iYOS2yJkhjfEUBbc/DbU4dBGWhXpLNB1NlIZvuZAcU2lbHW/OF80EyU3Ee9lfgErYwdgdlbGLuAnGF8dkBSbCntS/u5qu8fRq/SYYR0M9F2+yosZqOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=owlfolio.org; spf=pass smtp.mailfrom=owlfolio.org; dkim=pass (2048-bit key) header.d=owlfolio.org header.i=@owlfolio.org header.b=NA2ncl11; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Do8iMGRL; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=owlfolio.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=owlfolio.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=owlfolio.org header.i=@owlfolio.org header.b="NA2ncl11";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Do8iMGRL"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 58AB81D00244;
	Mon,  9 Mar 2026 15:57:48 -0400 (EDT)
Received: from phl-imap-14 ([10.202.2.87])
  by phl-compute-01.internal (MEProxy); Mon, 09 Mar 2026 15:57:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owlfolio.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773086268;
	 x=1773172668; bh=CT1q9tCF/MkATT/z8bGnLWSQ3GH/fnCS5uEvriZCWXk=; b=
	NA2ncl11z07rCRs5FTr3oxRTDKg2IWFhCAeHP0N7JBuLlxMveJVnG1NGV2qY0c/y
	8LjfQdLxorUWsyRPtpF8HdIZ2IkODzdTZnWbFrRD5PNNfLyrEQEEUBSVNKyNQVAE
	48ccHIPh6E5ruhXlrO5Z/8vpF+yMVWpq2aVcL5oXlowjdYpvxiFWNYa8mk4216+9
	E0cSQ9wnxeal+t5skLtHgz3WMiEO01qVYk8GjuT5R1jaOd8InGEBvdG3tKMtAYgo
	djfnQ8M9cL2NBzRiAHcSiT07lHbFxFkYahcQq7dW5A0XQdym4RDH0wXG7L0Bcs2y
	fvm7V+SEKNQG9BfShngAkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773086268; x=
	1773172668; bh=CT1q9tCF/MkATT/z8bGnLWSQ3GH/fnCS5uEvriZCWXk=; b=D
	o8iMGRLwtcXaGK23TtlBzgcKXwUHHSuQi32UcH6oTKXGVQEsciahjId7mOl7gcAj
	NNvIPeMsPtsGnKV8ZvIC7nPC+Eg6YouyFgdxOKMFBXRCKBoXuvpYstDIQLUr7N0y
	dF6qp9i6WyBBTPWN6uYLivGEt7vZep6kIAMxhpK5xvkkM8/Kxc2ZU8BUVN+/w72L
	V9dqP+TkCMDUEYvN9IZVYlnyCvoI1G9C8VZUDS7J7Xpq6ofrtHPcU9nqvBNG1K9G
	3ZfrzBDBTp2J3J0Bg0CQ800H/AFo8oS+l0pgxdqQ9ezmSHRmufysB3I3kPSMxo36
	sEuOtAUfqu1jIzXd6C6fQ==
X-ME-Sender: <xms:OyavaYyiNHGjk_VMO9cn_ZiHYNoEL-C0ErgfkEQstFEjljKPC2NdhQ>
    <xme:OyavaXHREZpzRGC_NYRvZSklLCdc9O2AkgvndZ-srMkeHsA_Sfb3CvWd9o0cJmCYf
    IezJG43zOj00MlKbDCTUa7owrT1b8aUe_JIwy6AUTivUP4H8pFXAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjeeltdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfkggrtghk
    ucghvghinhgsvghrghdfuceoiigrtghksehofihlfhholhhiohdrohhrgheqnecuggftrf
    grthhtvghrnhepffffleeihfekfeetheeiieelueffleegvdejgffhhffhheehgfethfeg
    jeduueehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epiigrtghksehofihlfhholhhiohdrohhrghdpnhgspghrtghpthhtohepgedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepnhgsohiflhgvrhesughrrggtohhngidrtggrpd
    hrtghpthhtoheprghuthhotghonhhfsehgnhhurdhorhhgpdhrtghpthhtohepphhlrght
    fhhorhhmqdhtvghsthgvrhhssehgnhhurdhorhhgpdhrtghpthhtohepughishhtrhhisg
    huthhiohhnsheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:OyavaXZ9KRooOxtZlMyC9UBzHfZXV_WnfOVEUk4U0uDoDe5rtobrVQ>
    <xmx:OyavaUN9SkAScdZowoV4dOpbiWPj36wJ9_iGrf_pnWvIyOMwjwDd2g>
    <xmx:OyavaUa9Ro0LWvI6o0vXFTBD88h6TzbuQ5oBD-3sa1uAVCvjPGnL6g>
    <xmx:Oyavaa3ISTRHgyNgu3qX-0_NcHdSolJZivni54o32OsO_vln-e9f7A>
    <xmx:PCavaWMmM7n3nVKy9cu1gJ9GZIepIvbqiT3ah9ssfYWy-tlEO8cIKDED>
Feedback-ID: i876146a2:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DB096C4006F; Mon,  9 Mar 2026 15:57:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Apo_q1IwUWRJ
Date: Mon, 09 Mar 2026 15:57:25 -0400
From: "Zack Weinberg" <zack@owlfolio.org>
To: "Nick Bowler" <nbowler@draconx.ca>
Cc: Autoconf <autoconf@gnu.org>, platform-testers@gnu.org,
 distributions@lists.linux.dev
Message-Id: <692c7a78-3f09-4a2f-9e16-b52885245c54@app.fastmail.com>
In-Reply-To: 
 <k655rugxzjvt4tb5o3kc2zos6l7oz3ooqbfuw5j7yl2ls7miud@d7x637tpydpa>
References: <eb85c013-42e9-4fb2-b7f3-1213caa9cfe1@app.fastmail.com>
 <mzhyowtgben33uqxnuyeae7yxmeitg4dvdwselbbuqfhkvdldn@6j7b37cptftk>
 <eb9f5c99-4b8f-43c1-b527-60200265352c@app.fastmail.com>
 <k655rugxzjvt4tb5o3kc2zos6l7oz3ooqbfuw5j7yl2ls7miud@d7x637tpydpa>
Subject: Re: Please test autoreconf from zack/autoreconf-exclude branch
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

(consolidating some replies)

On Mon, Mar 9, 2026, at 2:18 PM, Nick Bowler wrote:
> On Mon, Mar 09, 2026 at 01:14:38PM -0400, Zack Weinberg wrote:
>> On Wed, Mar 4, 2026, at 6:51 PM, Nick Bowler wrote:
>> > Why implement a new option for this?
>>
>> Discoverability.  If someone's having a problem with autoreconf runni=
ng
>> something it shouldn't, and they look at autoreconf --help, the --exc=
lude
>> option will be right there.
>
> I do think the sentence in the Autoconf manual is better than the
> sentence in the autoreconf --help text, because it actually says
> what the variables are for:
>
>    The environment variables AUTOM4TE, AUTOCONF, AUTOHEADER, AUTOMAKE,
>    ACLOCAL, AUTOPOINT, LIBTOOLIZE, INTLTOOLIZE, GTKDOCIZE, M4, and MAKE
>    may be used to override the invocation of the respective tools.
>
> Surely it does not need to be explained that the ability to choose
> the command which is run also includes the ability to choose a command
> which does nothing.

Honestly, I think that *isn=E2=80=99t* clear at all, even with the =E2=80=
=9Cmay be
used to override=E2=80=9D wording.  It is quite plausible to me that som=
eone
would assume this feature is limited to picking *alternative
implementations* of the =E2=80=9Crespective tools,=E2=80=9D i.e. that wh=
atever is
picked, it has to actually do what the command=E2=80=99s supposed to do.

I could address that with another sentence, but, like I said, I think
people will not notice that sentence, because they=E2=80=99re too focuse=
d on
looking for an *option* to make autoreconf do what they want.

> Is duplicating a subset of functionality from a longstanding
> autoreconf feature really worth this risk?

Fair question; just the number of tests I feel I need to write before
landing the branch is making me reconsider whether this ought to be
put into 2.73.  However, against that, the number of complaints we got
since 2.70 about autoreconf trying to run tools that it shouldn=E2=80=99t
argues that this is a real problem and *not* one that=E2=80=99s adequate=
ly
addressed by the existing mechanism, albeit perhaps only because
people don=E2=80=99t know about it.

I didn=E2=80=99t invent the --exclude option; OpenEmbedded has been carr=
ying a
patch for it for several years.  I=E2=80=99d like to ask the original au=
thor
of that patch to chime in at this point.  Ross, can you remember why
you originally wrote this patch?  In particular, do you remember if
you knew that much the same effect could be had by setting e.g.
AUTOPOINT=3Dtrue in the environment?  And, if you did know that, do you
remember why that approach didn=E2=80=99t work for OE?

zw
