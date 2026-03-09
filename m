Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C3F296BD7
	for <distributions@lists.linux.dev>; Mon,  9 Mar 2026 17:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773076502; cv=none; b=tx2Q0KDYmNoP9Crkj8r3mTidV6gu0CmlM08wXvg7aCql0I9L7Zyce1dTy6uCXJk0pt7pWUuR2AQqXoByzOfDcLoVzUJGgZMrrTq3mtzEqxTsjtfAfCUrNAi0801tCjt04w60A4tAVW3h+QMsXz1wFAriVxg7MrfUsH+jhxOYWPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773076502; c=relaxed/simple;
	bh=Ierm2KnV5bqie676dcUj2memoptB+M6xSZSNV+vzJbo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=kc/RbbiBH9XUY/+ebQ9GwQVsmJfwFK2t4+PKGmjDdrDh+GVyexztV4q+DVu+r2JRAYv8ySzibSsdyZW3WkaD5KXSumlDz/Mfw4CUUjFPYyjBL5QXZdOizsvW6kBUXaJ4iynjPfMN6Ya6rh/DCGdHjOJjnLSfZvyR6A7PKo1OxX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=owlfolio.org; spf=pass smtp.mailfrom=owlfolio.org; dkim=pass (2048-bit key) header.d=owlfolio.org header.i=@owlfolio.org header.b=YRh8AGK1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FfaoW1xi; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=owlfolio.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=owlfolio.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=owlfolio.org header.i=@owlfolio.org header.b="YRh8AGK1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FfaoW1xi"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id C9D581D001E0;
	Mon,  9 Mar 2026 13:14:58 -0400 (EDT)
Received: from phl-imap-14 ([10.202.2.87])
  by phl-compute-01.internal (MEProxy); Mon, 09 Mar 2026 13:14:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owlfolio.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773076498;
	 x=1773162898; bh=nkNdUbs2nhVjM2Vt4Ajh3LDbY+T78P2hOaK1Qrlwalc=; b=
	YRh8AGK1OgypkSwdX+SbV6zpnB3das8+2vXxYn6WVNejpSA+pZSDIsXswDJhFtr7
	hzhgbPOhHav6M+OslVRqp1EblQQUgmz0GN9yryVUYqr1GfpYKR36oLvlcymYpPE1
	/qz4jv0tm5VSU1D2Iziye2WBPrN22jg8/sogkQOC2vO3XlthMteEs+HYDcwNppoT
	aHF07v0i4dXdGs7cHaU2sWNpMOoEt5lNk6fD6J/n1gy+rmDBpiXfOc1TBVrTKwbm
	9VyKNixn5/HxcGpeGdDcpZy+Q81hi1UVYNBXoZYViR4C8TJaxsw3/dAQY6lvCC+z
	bi8tvyMG50su0C4kjLit2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773076498; x=
	1773162898; bh=nkNdUbs2nhVjM2Vt4Ajh3LDbY+T78P2hOaK1Qrlwalc=; b=F
	faoW1xiR+Ky25evfGE0QbywwuSwYcSMtMna4Kw9aSeGlY3FcaZ+Kw6dHY/x1AYEo
	x/KlJyAEa90kBif1MlARKXALIN2WRAvWTw/D+lHHQs4kS7qxs1Cy7dK8Kdimzspw
	gs3NIwTREeCsqiln4i0glJ665nbey2dVYhK7/KaY4OWlsnViEA3b4W3Da3r7wXRD
	o9RXIWYHjrjrdaf9KVbnD82An7rdhD6DGmPhAFyryQEEhCdhdgAfPOiHr7ngAqMM
	s50ILmKEUiBhefnqVuYtRZDmvWQWRZoeDP3liNTKeN4Rqi7MSr0r8xD7zHPk04e4
	I70Jgh1Lt5ZcthrT2cTsQ==
X-ME-Sender: <xms:EgCvafzaQUeYe2bGeERezADXR7jYAev7bbZF6ifHoEvQ9ex8aykJhA>
    <xme:EgCvaSF5p8XvKHTRwVNrJuLWVFceiZR76ae3XgIhfs3BZPzA5TGM2yl0qSdP9TXeW
    -_P1pMzOWCfE4RXG5W1VJlcS1lgM_JC7-EcrDrYWs2thj0I34wrccI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjeekieelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfkggrtghk
    ucghvghinhgsvghrghdfuceoiigrtghksehofihlfhholhhiohdrohhrgheqnecuggftrf
    grthhtvghrnhepgfejtdefleehtddvteeitdeigffgfedvheelieevkeetgfdtkeehhfeg
    fffffedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epiigrtghksehofihlfhholhhiohdrohhrghdpnhgspghrtghpthhtohepgedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepnhgsohiflhgvrhesughrrggtohhngidrtggrpd
    hrtghpthhtoheprghuthhotghonhhfsehgnhhurdhorhhgpdhrtghpthhtohepphhlrght
    fhhorhhmqdhtvghsthgvrhhssehgnhhurdhorhhgpdhrtghpthhtohepughishhtrhhisg
    huthhiohhnsheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:EgCvaeaGGj7rmRmzdzSaXisNO3ai1tTw_6nFT9Qx-c8OhjURkx-hxA>
    <xmx:EgCvafMhpu-S4y8-DMWI7lf8I--WDAGq8hM1i4hXh8fuPBLaZPOEcw>
    <xmx:EgCvaTb8gf-A19jrYDpNQpxlc9sWWmajBuNudDpGdbjIF5QBBDfKxA>
    <xmx:EgCvad00TzdKvO6bsNCYVLbXyerdXM5h_ax_UbSA1vSkj-2Y6-D36g>
    <xmx:EgCvaRPhPklitto7DYNC2qBgib69zfMq_PC3Q8Pw9r1fxK9SXtBaCnpa>
Feedback-ID: i876146a2:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 576C2C4006E; Mon,  9 Mar 2026 13:14:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Apo_q1IwUWRJ
Date: Mon, 09 Mar 2026 13:14:38 -0400
From: "Zack Weinberg" <zack@owlfolio.org>
To: "Nick Bowler" <nbowler@draconx.ca>
Cc: Autoconf <autoconf@gnu.org>, platform-testers@gnu.org,
 distributions@lists.linux.dev
Message-Id: <eb9f5c99-4b8f-43c1-b527-60200265352c@app.fastmail.com>
In-Reply-To: 
 <mzhyowtgben33uqxnuyeae7yxmeitg4dvdwselbbuqfhkvdldn@6j7b37cptftk>
References: <eb85c013-42e9-4fb2-b7f3-1213caa9cfe1@app.fastmail.com>
 <mzhyowtgben33uqxnuyeae7yxmeitg4dvdwselbbuqfhkvdldn@6j7b37cptftk>
Subject: Re: Please test autoreconf from zack/autoreconf-exclude branch
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Mar 4, 2026, at 6:51 PM, Nick Bowler wrote:
> On Tue, Mar 03, 2026 at 12:20:32PM -0500, Zack Weinberg wrote:
>> The last thing I want to squeeze into autoconf 2.73 is a new
>> autoreconf feature, an option --exclude that can be used to tell
>> autoreconf not to run particular tools even if its heuristics say
>> they are necessary.  We had a lot of problems in the past few cycles
>> with autoreconf running auxiliary tools when people didn't want it
>> to, so I'm hoping this provides a self-help option for future issues
>> along those lines.
>
> Why implement a new option for this, instead of using the existing
> environment variables which have been supported by autoreconf
> since 2001?

Discoverability.  If someone's having a problem with autoreconf running
something it shouldn't, and they look at autoreconf --help, the --exclude
option will be right there.  The --help text does also mention the
environment variables, but they're described as a way to control *what
command* is run - like, in case you have autopoint somewhere off the default
path - not as a way to control *whether* the commands are run.  I could add a
sentence like "To prevent autoreconf from running a command, set COMMANDNAME=:
in the environment" right after the mention of the variables, but my guess
is people will get locked in on the idea of an *option* and not notice that
sentence.

zw
