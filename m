Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA07320C
	for <distributions@lists.linux.dev>; Wed, 19 Apr 2023 22:54:03 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 66F743200913;
	Wed, 19 Apr 2023 18:54:02 -0400 (EDT)
Received: from imap45 ([10.202.2.95])
  by compute1.internal (MEProxy); Wed, 19 Apr 2023 18:54:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owlfolio.org; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1681944842; x=1682031242; bh=jl
	ioey5hdmBRCrY3eMIVcbEeYzBTy96hGYZV7NIDpaI=; b=Mmm4TF4pITTZluhayX
	S816sJAbfQJMvhA0DlSOoO6eOw5Jt2RWA5OJaODrfB6vWFesz9xs+sTCenrmKlp8
	8NMiyO86L68W9zkTTquqqtEhXd9bDtBs3ZbwkIFegBqFz7Beon8tgyBbnO32QAV5
	f/YLkM0easRDz9ccX+h6N2Zh23efKbkWLsNFlqk/REOjHMreqac9VpagbmkChKtA
	FJDGnRnHAHqfufmiw1CQgQ3el1v/jrFXzG7wOhA4hOX05odlL8t3knPkxB3wTJ8y
	TVrgSL72z/1hS+CKghcupuS/cUDYCZ3MhvDtkzNKlqR0JCC7/MPN7zidjR540a9E
	3kuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1681944842; x=1682031242; bh=jlioey5hdmBRC
	rY3eMIVcbEeYzBTy96hGYZV7NIDpaI=; b=G2A2fi0TUxbsL4u/z6syD11MnJHYp
	R2slXtSjfZtBRDZT482u9SapF7xvqy09eIVy4DdNcWoQo/P6L18hmzYyJDT6j5lq
	ql/2yJu5XkeNp2phP3LOQUDGzy7Nl+Fo3uWSVvFfnp63EmTg93/4uufVBqQtd6tr
	U+Zr+eU72dytUO9tIMJTkuccYSJaQCwtNcnSMDMjk2KFkzMzl21ZCHCooZFfT1EF
	lvo22cduZel9hrQXNcNxYIGVF4nrTEllFG5M/4B/D3USYZUyvD3T2Eyqa5DzfIwb
	ho1yuGQfOqtOJNbtZ8650InAu3ynoDo87fFT8z9YI5ba6EKElDUnkGK1A==
X-ME-Sender: <xms:CXFAZPF7VplfeSePLSL8dsrtIwUOQhRZOAGyqLA2e7TiU9dxQ7T7QA>
    <xme:CXFAZMVnT4VIzM8LRuUhVrDnDPL2nB9BrwxV5fY1cVrqHAxEV-pcUbtVjfj1bzfgd
    qZuc_gXTN97MI3_69o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtuddgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfkggr
    tghkucghvghinhgsvghrghdfuceoiigrtghksehofihlfhholhhiohdrohhrgheqnecugg
    ftrfgrthhtvghrnhephfelfeehudfhleegheegjeevheeuieehvdfgueeuteetleeiieet
    heefhfeludeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepiigrtghksehofihlfhholhhiohdrohhrgh
X-ME-Proxy: <xmx:CXFAZBKFBpEuBPYbupYqVAuOdq_nWMQc8oXU57opH6rOqwht4HceSw>
    <xmx:CXFAZNFA0Ci4raQ84aLQXCWt5ieETzQ3XJLfNGxei-SZEQguQKInqA>
    <xmx:CXFAZFUj17XdymB0th5pbHbIOyVvBWbzMHdIfKy9pX_tRxtvrXksgQ>
    <xmx:CnFAZIR4_8lYSW3X8fitXAwUH-kAEtdiLKjFP02VoSap-Kb6QqEKxQ>
Feedback-ID: i876146a2:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6AD90272007A; Wed, 19 Apr 2023 18:54:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-372-g43825cb665-fm-20230411.003-g43825cb6
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <8038d2f0-006f-46e3-b0bb-05bca748eb49@app.fastmail.com>
In-Reply-To: <c8505ba3-bd85-49db-69d4-1087754b436d@cs.ucla.edu>
References: <6614772.670kD7asE2@nimes> <5343648.xEiunlC7Kx@nimes>
 <9636462e-920f-2e6e-3d2c-ec58e43021a2@cs.ucla.edu> <9797572.lZ1qq7WqSs@nimes>
 <7fb8ec1e-0db9-dd86-d718-214133f88b53@cs.ucla.edu>
 <26320c3d-53e9-4fe8-9218-4b04b37bf7d5@app.fastmail.com>
 <c8505ba3-bd85-49db-69d4-1087754b436d@cs.ucla.edu>
Date: Wed, 19 Apr 2023 18:53:39 -0400
From: "Zack Weinberg" <zack@owlfolio.org>
To: "Paul Eggert" <eggert@cs.ucla.edu>, "Bruno Haible" <bruno@clisp.org>,
 =?UTF-8?Q?P=C3=A1draig_Brady?= <P@draigbrady.com>, bug-gnulib@gnu.org
Cc: "Sam James" <sam@gentoo.org>, distributions@lists.linux.dev
Subject: Re: recommending AC_SYS_YEAR2038_REQUIRED ?
Content-Type: text/plain

On Wed, Apr 19, 2023, at 5:23 PM, Paul Eggert wrote:
> On 2023-04-11 17:10, Zack Weinberg wrote:
>> I'm also happy with this resolution.  I do not have time to do the Autoconf work until the weekend.
>
> I notice you were careful to not say *which* weekend. :-)

Ugh. Yeah. Don't expect anything out of me before the end of CMU's spring term (second week of May) at the absolute earliest.

zw
