Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9CC5246
	for <distributions@lists.linux.dev>; Mon, 10 Apr 2023 19:09:33 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 6311B5C0110;
	Mon, 10 Apr 2023 15:09:32 -0400 (EDT)
Received: from imap45 ([10.202.2.95])
  by compute1.internal (MEProxy); Mon, 10 Apr 2023 15:09:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owlfolio.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1681153772; x=1681240172; bh=2E+Z1h4ZFgThsSuOLoJHvAQ6aQBiabWV+OW
	04m+poWU=; b=HP91OD1jm1WY3w38CfMo/9XbysNwIbJ1scMNwgfxnPJRm0L8+X8
	UndhDU8I+TmF49ncAMQUVEL22ygtd0rQ2siLzMnkYdu+OMYi+z9mx2tPUPsp9nZJ
	S3zD4sWYvVcRJrK3TNusdtrSqOe0yrC0YlJ43OETZLI15T7tyceP+AbhkEXyuXnx
	AzXt5SFomMKS4nHgX5BX6CTw1Md7S65TrPeGWQQCUSnZySRC/wQ6g1i3beKBLWVs
	VRnZeWiEbBjEr5dODImw4XJIkWiWmaMhjm4lyDeEhbc1HOL256aExboy+yQRthZI
	iTwT3AIaARnws474Sr/V/dBlW7992iPNNYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1681153772; x=1681240172; bh=2E+Z1h4ZFgThsSuOLoJHvAQ6aQBiabWV+OW
	04m+poWU=; b=esrS320zk6btw+HxGKdsUcOrlU4d6+NzSHKH7c6xsCy6skKSJZW
	y2tLrfwBeYFS4QpefpwWHKscJOK8PF1AKhdKAwdp1ug0vI3sUgGo4Rd4Li57MynN
	dzLvqID+Hhnaoxi8D1+9JkRPpSvyYpe/hLTWknJ+0032UT3HRjFPn2plGBO6rB3t
	7kQuVi3XB/kyzNBUqWLTdRMoflUzbAdzw88oZCV5IVofjS2TLaygmPhJWMVWBhPs
	33aJahQiNvGEWXCPqseJklTjwhdOeZuUVNQVlr3f/+L0+jT8Ql79KMRxdIQ7BHML
	0h25An1YhVxG7RzDvj1Q2L6Vi+e2a0EDkBQ==
X-ME-Sender: <xms:6140ZDB5tnQlwPH26fR7XSktCfWssmCdmVIdYGYsM4FuWWxvpPOkTg>
    <xme:6140ZJjVyEJaMn6j5GPf-i0LyduF_HYmo_5n31zpGZ19gKruuYXrtvTkMtrF-UM5A
    k6A-fotVwalmcDkVDY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekvddgudeffecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    kggrtghkucghvghinhgsvghrghdfuceoiigrtghksehofihlfhholhhiohdrohhrgheqne
    cuggftrfgrthhtvghrnhepudeuieegheffkeeihfdtheeivdeuffetveethfdugfeutdeu
    iedttefgteeiieeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepiigrtghksehofihlfhholhhiohdrohhrgh
X-ME-Proxy: <xmx:6140ZOnZ6Y4Km8ggfXKR8RJvht7TcFaD8XHsimC0IQFw_UE3LAGpsw>
    <xmx:6140ZFyKCCnL85-Lk0ismoHzSFyETdev8ks-VcPfqhPaOA1VQ7JNgw>
    <xmx:6140ZIRVBbZjn1LwG_sTa57e_OmYxFzG2tqbxAh4v2jznVn1xTu1YA>
    <xmx:7F40ZOftoOXuN_rA4tRVpzvZeEnbBOlbqmcxLkzx6FlbvuYKo0ShRA>
Feedback-ID: i876146a2:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B770A2720081; Mon, 10 Apr 2023 15:09:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-334-g8c072af647-fm-20230330.001-g8c072af6
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <bffe78fa-dc4d-46e5-8c2d-27f7aaa7baac@app.fastmail.com>
In-Reply-To: <4f4298d3-76a9-3473-0963-f8eff4bdc29d@draigBrady.com>
References: <6614772.670kD7asE2@nimes>
 <4f4298d3-76a9-3473-0963-f8eff4bdc29d@draigBrady.com>
Date: Mon, 10 Apr 2023 15:09:10 -0400
From: "Zack Weinberg" <zack@owlfolio.org>
To: =?UTF-8?Q?P=C3=A1draig_Brady?= <P@draigBrady.com>,
 "Bruno Haible" <bruno@clisp.org>, "Paul Eggert" <eggert@cs.ucla.edu>,
 bug-gnulib@gnu.org
Cc: "Sam James" <sam@gentoo.org>, distributions@lists.linux.dev
Subject: Re: recommending AC_SYS_YEAR2038_REQUIRED ?
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 10, 2023, at 10:12 AM, P=C3=A1draig Brady wrote:
> On 10/04/2023 14:40, Bruno Haible wrote:
>> Hi Paul, In yesterday's changes, you added to the Gnulib
>> documentation, section "Avoiding the year 2038 problem", wording that
>>
>>    * explicitly recommends the =E2=80=98year2038-required=E2=80=99 mo=
dule, which does
>>      AC_REQUIRE([AC_SYS_YEAR2038_REQUIRED]):
...
>> I strongly object to this recommendation and presentation.
...
>> It is simply the wrong person's decision if the package maintainer
>> uses the AC_SYS_YEAR2038_REQUIRED macro.
...
>> When AC_SYS_YEAR2038_REQUIRED is used, the package can no longer be
>> installed on the following 32-bit platforms/ABIs:
...
>> I would therefore propose that the module 'year2038-required' gets
>> removed from Gnulib, as I cannot see any positive uses of it.

As the person who invented AC_SYS_YEAR2038_REQUIRED and
AC_SYS_LARGEFILE_REQUIRED, let me say that it was my intention that they
would only be used in rare circumstances, where the inability to install
the software on older ABIs is outweighed by some other strong
requirement for time_t and/or off_t to be at least 64 bits.  I didn't
have any specific use cases in mind but I was imagining something to do
with library ABIs involving time_t, or network and/or storage formats
explicitly specified to use 64-bit counts of seconds since the Unix
epoch, or similar.

zw
