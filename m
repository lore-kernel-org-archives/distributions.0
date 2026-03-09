Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4952A33AD89
	for <distributions@lists.linux.dev>; Mon,  9 Mar 2026 21:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773090990; cv=none; b=LFt/vKrF06Y03BKUbvDuANOKV4UfYRAGBpHJdyOf6mcavzGI/3eLcjNeDNzdkFOq9/5IfvT7t/Y1hwQCGKTq2qiY9tVO8nIROgjFxotemQpNzfpaAJHC9DNFAp6rPk/GwasETVkWmqn9hMsKL4HT7BmxYLNmBJI37Gh/qMuNIIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773090990; c=relaxed/simple;
	bh=VKkkxF2g4qZCdot4/5s3Taj0mwzmFjjJsD5MjEM/ivI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dpmTuHG9u7nXG9jyRkBt26U5RigQSB486lJkUpkk5W/xx0CxoiR5zHCm4IQDJlXLvnP4oHmAbiJCQwebRR0di67abyxcClrAZ1siZ1vEQH6Bhbcob9FdGChj+4a/270s+TQ/+kRDB6H9oTshoEeCZbRPww77lJBX4ATwaQlkA3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y7vx9eEq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y7vx9eEq"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so27313225e9.0
        for <distributions@lists.linux.dev>; Mon, 09 Mar 2026 14:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773090986; x=1773695786; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VKkkxF2g4qZCdot4/5s3Taj0mwzmFjjJsD5MjEM/ivI=;
        b=Y7vx9eEqS11UohMfB1vjf0dQSM3e/90SNE4MPh6g66pF1didht139gDs4vf1Rki5Gh
         0QC0bqEgDY/y7JgdbEYpZcyd0lWGkdQrYIrke4S45RgkNwFIHpjlDL8LE/QJ8hqGqRJJ
         +Gacok7KFAicPzcSjZ1Qk6VCo/3a8eUvs+F3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773090986; x=1773695786;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VKkkxF2g4qZCdot4/5s3Taj0mwzmFjjJsD5MjEM/ivI=;
        b=cjIQS8od4qAby5NhU1bIEuYlfpUFgGHMOISBh65hj7UvrQc4NMfUXzSZvKixdhqxI+
         WYqW+SEKCzlTRf1VyXMPBqN92Ffc6JUO9wIR/sixwfkxmyRhhQAtJuPQT3XsPkEn3ts5
         O344qFZpfkBOxmVCBVEIXtuMfVpB2YaRQNlprc7HjC6oFcRlyPw3NpX/T/qehnz4lrgw
         CeTpGo89BOKXLRNg6SgrY1jEzoz7Ap+6o9z1qEwZUuPvXBw83ev7LpTUBlhemaGlITj6
         9Mq7d6W/rPWmsXJsZaswXJNIMvKpKFYeH1HobjA8BAMNxbz77lLw6L24J2zaTpXWrE8n
         NbtA==
X-Forwarded-Encrypted: i=1; AJvYcCU1hILnUkKJt58Omq7oA8tE9SpkHiSfyZ7CXE8unO0ESgP0+Syv4vEXiOOc6OG8HcSTni1vM/SjgEPyllVo@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+aajvuJFPXFHT+7yW6BaYR4UtucK8W/15UU6fVUfkHpnJLsGv
	qLD3DmSHx3vspSej5gJC+lokfihpR/2OPZ5fshIXn7hvVNllctaHvdz9PMIjK0nW1dg=
X-Gm-Gg: ATEYQzzLdBKI5miHkM4eXDqYocue/Nm1mD5sRB5ewSnnQbyVyhIkjD8ECXx0QURrAoV
	GDtPSrTG0lnGiLr88Xr7IUfarhXoh+JzZ3zEGZ35UK0/BPjaUn/yHgpaY9ZurBah2lBmMNcsHNN
	YW/bbrIKXPQ6+uOv/FT33Os+featttUp8AEBuGmUj71UCaXiN328NkLkllIsLicrsH4G0v/ys9Q
	dSWHGxsyHSmXcBvTwCLroQ+JYDyhL9qqdRu+YP270LCklWUxD9ueBrPzb/yZADbYBiGJnfLGNVD
	gcTPXaNTZCZq183896/MbrXYmy7xKfnu4q+hswj4FNxFUJw72kf7rzDMf23fnCUNXmBQ/y9S2GL
	k3pcFaNx9972k/SLrjWDcUITCA7ZzjoIGgmO4727PJZEBnnEOOidMDxCmgbujK0QdXoCjuUgk4h
	3HviR8JKuUrGvSqN4bTQmIEi6qxOYoW+nSt/8UIizGK+gnbVCMNrCFKoj3/kNUf8UZuWj/43/EG
	LiGtIz2/+M7aQaupYdo9hU=
X-Received: by 2002:a05:600c:1d0b:b0:485:4136:99a8 with SMTP id 5b1f17b1804b1-48541369c0cmr28885395e9.22.1773090986429;
        Mon, 09 Mar 2026 14:16:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f0f:27a5:814a:c92a? ([2001:8b0:aba:5f3c:f0f:27a5:814a:c92a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae483desm28564542f8f.34.2026.03.09.14.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:16:25 -0700 (PDT)
Message-ID: <001fc89a3a73a54e875412f41f1732b151da3670.camel@linuxfoundation.org>
Subject: Re: Please test autoreconf from zack/autoreconf-exclude branch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zack Weinberg <zack@owlfolio.org>, Nick Bowler <nbowler@draconx.ca>
Cc: Autoconf <autoconf@gnu.org>, platform-testers@gnu.org, 
	distributions@lists.linux.dev
Date: Mon, 09 Mar 2026 21:16:24 +0000
In-Reply-To: <692c7a78-3f09-4a2f-9e16-b52885245c54@app.fastmail.com>
References: <eb85c013-42e9-4fb2-b7f3-1213caa9cfe1@app.fastmail.com>
	 <mzhyowtgben33uqxnuyeae7yxmeitg4dvdwselbbuqfhkvdldn@6j7b37cptftk>
	 <eb9f5c99-4b8f-43c1-b527-60200265352c@app.fastmail.com>
	 <k655rugxzjvt4tb5o3kc2zos6l7oz3ooqbfuw5j7yl2ls7miud@d7x637tpydpa>
	 <692c7a78-3f09-4a2f-9e16-b52885245c54@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2026-03-09 at 15:57 -0400, Zack Weinberg wrote:
> (consolidating some replies)
>=20
> On Mon, Mar 9, 2026, at 2:18 PM, Nick Bowler wrote:
> > On Mon, Mar 09, 2026 at 01:14:38PM -0400, Zack Weinberg wrote:
> > > On Wed, Mar 4, 2026, at 6:51 PM, Nick Bowler wrote:
> > > > Why implement a new option for this?
> > >=20
> > > Discoverability.=C2=A0 If someone's having a problem with autoreconf =
running
> > > something it shouldn't, and they look at autoreconf --help, the --exc=
lude
> > > option will be right there.
> >=20
> > I do think the sentence in the Autoconf manual is better than the
> > sentence in the autoreconf --help text, because it actually says
> > what the variables are for:
> >=20
> > =C2=A0=C2=A0 The environment variables AUTOM4TE, AUTOCONF, AUTOHEADER, =
AUTOMAKE,
> > =C2=A0=C2=A0 ACLOCAL, AUTOPOINT, LIBTOOLIZE, INTLTOOLIZE, GTKDOCIZE, M4=
, and MAKE
> > =C2=A0=C2=A0 may be used to override the invocation of the respective t=
ools.
> >=20
> > Surely it does not need to be explained that the ability to choose
> > the command which is run also includes the ability to choose a command
> > which does nothing.
>=20
> Honestly, I think that *isn=E2=80=99t* clear at all, even with the =E2=80=
=9Cmay be
> used to override=E2=80=9D wording.=C2=A0 It is quite plausible to me that=
 someone
> would assume this feature is limited to picking *alternative
> implementations* of the =E2=80=9Crespective tools,=E2=80=9D i.e. that wha=
tever is
> picked, it has to actually do what the command=E2=80=99s supposed to do.
>=20
> I could address that with another sentence, but, like I said, I think
> people will not notice that sentence, because they=E2=80=99re too focused=
 on
> looking for an *option* to make autoreconf do what they want.
>=20
> > Is duplicating a subset of functionality from a longstanding
> > autoreconf feature really worth this risk?
>=20
> Fair question; just the number of tests I feel I need to write before
> landing the branch is making me reconsider whether this ought to be
> put into 2.73.=C2=A0 However, against that, the number of complaints we g=
ot
> since 2.70 about autoreconf trying to run tools that it shouldn=E2=80=99t
> argues that this is a real problem and *not* one that=E2=80=99s adequatel=
y
> addressed by the existing mechanism, albeit perhaps only because
> people don=E2=80=99t know about it.

I just replied to one of the other emails, not realising this one has
consolidated replies in it so sorry about that.

I think the existing functionality is unclear to people. At the very
least it would need better documentation but I also think it is a poor
interface for usability.

> I didn=E2=80=99t invent the --exclude option; OpenEmbedded has been carry=
ing a
> patch for it for several years.=C2=A0 I=E2=80=99d like to ask the origina=
l author
> of that patch to chime in at this point.=C2=A0 Ross, can you remember why
> you originally wrote this patch?=C2=A0 In particular, do you remember if
> you knew that much the same effect could be had by setting e.g.
> AUTOPOINT=3Dtrue in the environment?=C2=A0 And, if you did know that, do =
you
> remember why that approach didn=E2=80=99t work for OE?

I'm also from the OE world so I know a little about this patch. OE has
been carrying it for as long as I remember and I was there early on.
The first reference I could find is here from 2004:

https://git.openembedded.org/openembedded/commit/autoconf?id=3D95b67de37447=
d7c30164eeec818429f4b34e6fc4

The commit is broken with a decades old bitkeeper SCM translation but
the patch name looks right I'm fairly sure it dates from then in 2004
and we've carried it since. In the time since I'm happy to say we've
massively improved both our patch documentation and also our commit
messages but those don't help us in this case.

There are two reasons I can think of that this was probably done.
Firstly, "ACLOCAL=3Dtrue" can easily be misread as "enable aclocal" which
is the exact opposite of what it does.

Secondly, environment variables don't really feel like a proper
interface to the script and are harder for us to to inject. We have a
variable we can add parameters to our autoreconf calls to quite easily
and=C2=A0 "--exclude aclocal" is relatively obvious. If we need environment
variables as well as parameters, we need two variables and they're just
not as readable.

Perhaps it is better illustrated by looking at how we'd have to write
that in our metadata:

EXTRA_AUTORECONF +=3D "--exclude=3Daclocal --some-other-option"

vs:

EXTRA_AUTORECONF_ENV +=3D "ACLOCAL=3Dtrue"
EXTRA_AUTORECONF +=3D "--some-other-option"

I'd argue the latter is pretty horrible, which is why we've gone for
the former instead even if we had to carry a patch for 20+ years!

Cheers,

Richard
