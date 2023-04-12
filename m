Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37322160
	for <distributions@lists.linux.dev>; Wed, 12 Apr 2023 00:11:00 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 1952A5C00BC;
	Tue, 11 Apr 2023 20:10:59 -0400 (EDT)
Received: from imap45 ([10.202.2.95])
  by compute1.internal (MEProxy); Tue, 11 Apr 2023 20:10:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owlfolio.org; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1681258259; x=1681344659; bh=AA
	jqARRDi8UHLCdIhTcNQkIz3rm4v4kaQ54Car9WuYQ=; b=uQ8mKrZhqCOxbLQyXS
	1VhVqdoKHHPfv6nJf6O51P42P+80flplrgJ/h5fM5vdWkg3d0q1eIfMbg23MEjXS
	z7xDp7pBLZlI000JU6178dUjX0E6zZvQf0Z1wtJC1GyPAAixDJXzq+lEA5Ecypfr
	j+rd1annjp0Q+sXS52nvSbP2KYJFlwMxaWI5IhPXqyv43o5y6iJPQAorSufgtIUn
	dOEitt/wiWPzyfyExjX2mXjWXEhe5tj4ifxC/6yDN3vxS3WCuvcdbq+msWIFwSuY
	fuTf4uJW5QZdiO1qHtOczRP1VA8EeeBoB67OZLrrkaJnp7Nu6H4B20I3lCPDQGYU
	3jvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1681258259; x=1681344659; bh=AAjqARRDi8UHL
	CdIhTcNQkIz3rm4v4kaQ54Car9WuYQ=; b=SfzPOed2C8x3s9oZvvn2VLpJRBf98
	E9Tzv/gZ5O+5Kmn8XMVViv5B3z787S6NUieVReoPvcxSzN89tnbO5qWNiiTvvW0N
	GSUS195cjitem65WNvu+ADx0iCRLiO7bJpswbaj1BRXpHro26tlcA+3AF6ajBgRl
	+7JEpZ0vK5yy4DkJBEwKnkLNE1hoGpYxlDx8sgRypw7IECewfxwsHDzycE15wpg1
	j6fyUBltW1Sr/wh5BZEwuPNLQPAxQnVBqZ8siwefjwXNiePd3e4UhBYV1vNzQuWX
	TL9ulld7m3smU97CXzpE6gjB/v4iiQduRdsOT11Frx0CFli4iiNPT9Qbw==
X-ME-Sender: <xms:Evc1ZEVgltLO6Lz-tiPt1GsiRojhPUhljYP2Boj9toH8j_ULN2k_XQ>
    <xme:Evc1ZIkXF6IB6lO_qnFMjSywNS-BKdPTxzGn3Xy3w8navYX29frSXHCZTFyu7vFJt
    OLMvmoe8ZY1ohgCigY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekhedgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfkggr
    tghkucghvghinhgsvghrghdfuceoiigrtghksehofihlfhholhhiohdrohhrgheqnecugg
    ftrfgrthhtvghrnhephfelfeehudfhleegheegjeevheeuieehvdfgueeuteetleeiieet
    heefhfeludeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepiigrtghksehofihlfhholhhiohdrohhrgh
X-ME-Proxy: <xmx:Evc1ZIZzpjoEKKXoRBZtxqezqD2f-EcIVcKE8V5JPannPOf22CU2xw>
    <xmx:Evc1ZDUAFX1B1-JlOlu3oexi86kGg0AIthOoYuQEDG1HTTirsCmmjQ>
    <xmx:Evc1ZOl4QIMhvohOIiCgOh7F4rGTfvIcdrizJUOQE20Gei9-qHGjIQ>
    <xmx:E_c1ZAhd5904APNR1nwPRDEg9fMHaK7sgq69fD_nhgfpJtUCXh1_1Q>
Feedback-ID: i876146a2:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 51168272007A; Tue, 11 Apr 2023 20:10:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-334-g8c072af647-fm-20230330.001-g8c072af6
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <26320c3d-53e9-4fe8-9218-4b04b37bf7d5@app.fastmail.com>
In-Reply-To: <7fb8ec1e-0db9-dd86-d718-214133f88b53@cs.ucla.edu>
References: <6614772.670kD7asE2@nimes> <5343648.xEiunlC7Kx@nimes>
 <9636462e-920f-2e6e-3d2c-ec58e43021a2@cs.ucla.edu> <9797572.lZ1qq7WqSs@nimes>
 <7fb8ec1e-0db9-dd86-d718-214133f88b53@cs.ucla.edu>
Date: Tue, 11 Apr 2023 20:10:38 -0400
From: "Zack Weinberg" <zack@owlfolio.org>
To: "Paul Eggert" <eggert@cs.ucla.edu>, "Bruno Haible" <bruno@clisp.org>,
 =?UTF-8?Q?P=C3=A1draig_Brady?= <P@draigbrady.com>, bug-gnulib@gnu.org
Cc: "Sam James" <sam@gentoo.org>, distributions@lists.linux.dev
Subject: Re: recommending AC_SYS_YEAR2038_REQUIRED ?
Content-Type: text/plain

On Mon, Apr 10, 2023, at 7:00 PM, Paul Eggert wrote:
> On 2023-04-10 15:36, Bruno Haible wrote:
>> I like this. Thanks.
>
> OK, then let's hear Zack's opinion and hopefully move forward.

I'm also happy with this resolution.  I do not have time to do the Autoconf work until the weekend.

zw
