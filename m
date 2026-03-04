Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F2B353EF7
	for <distributions@lists.linux.dev>; Wed,  4 Mar 2026 22:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772662454; cv=none; b=M0VwXMBKw+mRdDumbK1xsmgUf1S6dUpnHqXOsxKThtJhERmMGz+LHerbFN3S5H0bE/XO2EwJ6FoD/8JSyKQ9XjjlJSlMyRmg9+i7J3FcJh6mbcrRmBNT1JAcUqdNkCpotjz8Il6Hrjg0XHINiCtYwLCLsoWqXPI8AfdYbycuSaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772662454; c=relaxed/simple;
	bh=3hq0MUwR8JutdIGCw/QLM74yoDRkEOgrKx+Gc/9BP8A=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GIFX8OsdkXeAROIv4531X2GB2V2ZCnxZbqu0fuDn1Qhs8qKP+umOZY4iCzjks2gD+uvZzQYx5kgymSQahCZgiTBSRT5N/G5RTYYQP1v9Bm06ZKqrF5DgYCTIe2KSFdwt7wBt73Tk/hGOO5kWGN7vgD5YSsLeKmS5l4pdMzQeJns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=owlfolio.org; spf=pass smtp.mailfrom=owlfolio.org; dkim=pass (2048-bit key) header.d=owlfolio.org header.i=@owlfolio.org header.b=O7jsA4RN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=P1cuIZga; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=owlfolio.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=owlfolio.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=owlfolio.org header.i=@owlfolio.org header.b="O7jsA4RN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="P1cuIZga"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1A9497A013B;
	Wed,  4 Mar 2026 17:14:11 -0500 (EST)
Received: from phl-imap-14 ([10.202.2.87])
  by phl-compute-01.internal (MEProxy); Wed, 04 Mar 2026 17:14:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owlfolio.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772662450;
	 x=1772748850; bh=bQIlgf8x7imJBQGesg6PXxLx1VE3R2UcyjWC6d7V2Xk=; b=
	O7jsA4RNRt4WvANy5yFQjTUVMydQBRR4moU8Va3s0IDNboTGvUs96zTCAU2/DAsk
	7Yr9tFTG8uD36M9ZsSIiTLYtc9S4UZaf25O4e6rcFl7X18bco6C0F+tk4h1zU5AW
	ZDtxN/n4wPBIt+Iu9Yn5wk742keJsoSTp9Z0fIiPGDlXBE7rQA9ZPY72J1DWL9O0
	m36k/rOx/zMLkXqE6DQ7LCFZZAl26uhnvS319EwBTZG3rWHprcZuc+DS1MW4Bza4
	gXf1hBVE5iD5dqgyMwZY53rNAWO8uF1119ia1Ya1D/iSO0yrWWUeK7hyOx1bJTai
	W0KfqWpWQWBYn274eAiBSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772662450; x=
	1772748850; bh=bQIlgf8x7imJBQGesg6PXxLx1VE3R2UcyjWC6d7V2Xk=; b=P
	1cuIZgaxIn9tnCA7Hj/CqFwLFQjX43dWAdqifjmCpVXzrBQ1X5pA96MvnmqcYwfR
	rEdMYoG4H1G94O5NUCDtomVuTI4hx4cCCvukdVO+hV77Hi6mMfi9JvKGoNr+2K0w
	5ZDHsGYkt0OWl/LtkD9+BQsKn9o194saHWFtHtT0IV2hgzgKjk26rZXj8i0q4lLb
	16BOzvQrZqt6IjMwX7NRcl29bx+sodGB6HzvT+yLOkXeU02PtpYqkS4BDPlT1vX6
	RbLBM9mKdSE50A9IifZiJpYeCWV+VzWjNyshVSU7JyyHV6cfVeo2nt1I6O3Sd7uf
	BHc9dCaiyt9gscMYfBnMg==
X-ME-Sender: <xms:sq6oadS-P7l1kwKFyNfOiWCnycPamLEU-A5OhiokhWfLOjTZDvC_0Q>
    <xme:sq6oaRmMlcS44dhkwEnXVWdEcKPGL_9c0Eb2AwAXo4mmZnIKdiAPbGqSByDWD3Lrq
    hjqIKArfFqiJ1VsPK4G6MXCgQMOnlkaGz_E5tw6hlesH_wm8ks_D5U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieegieejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfkggrtghk
    ucghvghinhgsvghrghdfuceoiigrtghksehofihlfhholhhiohdrohhrgheqnecuggftrf
    grthhtvghrnhepffffleeihfekfeetheeiieelueffleegvdejgffhhffhheehgfethfeg
    jeduueehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epiigrtghksehofihlfhholhhiohdrohhrghdpnhgspghrtghpthhtohepgedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrtghomh
    dprhgtphhtthhopegruhhtohgtohhnfhesghhnuhdrohhrghdprhgtphhtthhopehplhgr
    thhfohhrmhdqthgvshhtvghrshesghhnuhdrohhrghdprhgtphhtthhopeguihhsthhrih
    gsuhhtihhonhhssehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:sq6oaT5pMrYLC8MHGiOjMifiHgiyHzhhz0U1CJVP1DJnkFaNu5vIyw>
    <xmx:sq6oaWuRTIBrRCqstu4snnDmGS6-Dtis2_RGM7BdvIWJcsGI9L3SGA>
    <xmx:sq6oaU5CJfHSkEilYyo1Ktf3E441XOrEmxoulgmOPWKNaIzn_28U0g>
    <xmx:sq6oaRWd7ThWS5ShUEq97EyCYlQ9a5vCqEkme7lKVuTzapK31gjtww>
    <xmx:sq6oaa2-gJF7WL_K8PwWgQuCZHiImW2-M-sUOuB8568iL5Lconkvx-5B>
Feedback-ID: i876146a2:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6DC72C4006F; Wed,  4 Mar 2026 17:14:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Apo_q1IwUWRJ
Date: Wed, 04 Mar 2026 17:13:50 -0500
From: "Zack Weinberg" <zack@owlfolio.org>
To: "Ross Burton" <Ross.Burton@arm.com>
Cc: Autoconf <autoconf@gnu.org>,
 "platform-testers@gnu.org" <platform-testers@gnu.org>,
 "distributions@lists.linux.dev" <distributions@lists.linux.dev>
Message-Id: <26a3364d-d500-4edc-a476-64a43fdb2dfb@app.fastmail.com>
In-Reply-To: <2C4639AD-A962-4113-86DF-427761B1B267@arm.com>
References: <eb85c013-42e9-4fb2-b7f3-1213caa9cfe1@app.fastmail.com>
 <2C4639AD-A962-4113-86DF-427761B1B267@arm.com>
Subject: Re: Please test autoreconf from zack/autoreconf-exclude branch
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026, at 3:19 PM, Ross Burton wrote:
> On 3 Mar 2026, at 17:20, Zack Weinberg <zack@owlfolio.org> wrote:
>> Please test this branch's 'autoreconf' on your favorite packages.
>> Testing with packages that use Gettext, Intltool, and/or gtk-doc
>> is especially helpful.  If you like, experiment with the new
>> --exclude option.
>
> There=E2=80=99s a regression with the following code in gnutls:
>
> AS_CASE([$ac_prog_cc_stdc],
>   [c11 | c99], [AC_DEFINE([C99_MACROS], 1, [C99 macros are supported])=
],
>   [AC_MSG_WARN([[Compiler does not support C99. It may not be able to=20
> compile the project.]])]
> )
>
> With master, that check now fails and the compilation changes.
>
> I=E2=80=99m not qualified to determine if the check in gnutls is just =
wrong, or=20
> if autoconf is breaking compatibility=E2=80=A6 though my hunch is that=
 the test=20
> is badly coded and it=E2=80=99s not handling the AC_PROG_CC change to=20
> preferring C23?

Indeed, that check is not prepared to handle the AC_PROG_CC change.
$ac_prog_cc_stdc will now get set to 'c23' when the compiler is new
enough to support C23.

A self-contained, low-risk fix would be to flip the condition around:

AS_CASE([$ac_prog_cc_stdc],
    [c89],
    [AC_MSG_WARN([[Compiler does not support C99. It may not be able to
compile the project.]])],
    [AC_DEFINE([C99_MACROS], 1, [C99 macros are supported])])

I'll add something about that to NEWS.

zw
