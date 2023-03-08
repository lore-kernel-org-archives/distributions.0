Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8A736D
	for <distributions@lists.linux.dev>; Wed,  8 Mar 2023 23:41:28 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id da10so305383edb.3
        for <distributions@lists.linux.dev>; Wed, 08 Mar 2023 15:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678318886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMmJvCd4kx0Bp2jEwx78c3Iiuf7H0eKbnL7iXFsCaZ8=;
        b=GmNsZieCKKtxn7y4pu6XbJXx8ZjNjdiTaB4jcCnQ7V0cp5YL029m9g829kniRvnER3
         n+Op/9StdAopcYBbGP1AS+eAoc+Y1IkSadwK7IKU9lzZs+KB0+4A1bJfSD2s86q50qJa
         wsNPG0PUCVMuNM/ENIZsUDF7NzmXag6V7ykb46gPcae85BpU+Y0UCYmexwtdPW91OUKp
         0HEIrWx18Zpvju/l4DUzY5NDF9iHEQ+Ynm0WTY/nspWmO/oMfn8mLPp5ZiVs0VqKtqgH
         AEXpz4UJGBrdagmpgI1a3tqYGn//WQUeLEdp+4JZaYKzukXK1VUY6rT+kDDNxxCwuN76
         IeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678318886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMmJvCd4kx0Bp2jEwx78c3Iiuf7H0eKbnL7iXFsCaZ8=;
        b=aK3g3bsPsutzSZA03vuK9VHvCCtgsJmzUtiBwAHSP+L5jfT/2sylA+POFXPi/MNv/T
         R3zt+YKZFQANebALl51nEXB/U8eeuKAQff0mmg9goKy7pM82G1k5WVBXtgAl6l6rBcPy
         N+GBY5cobtzqph4qvJ4Rf9Ouuu1eXyPmlcFiYkosYC6gwVXhYKksWt4zIQXy0Z1JXj0v
         8VcX7sU8HK77ODdvWhSGE7RJRgt0CcPgsBkrrzzmQfg4KzNlKSsyBLwlv0fC/QxDFrBL
         0Kvot/RndU76+HNNwRY5RJhRH3uVfb9y6IDzmS7D2uCmq3tWPOOQmCL70JAGCfRC/OF5
         B2zA==
X-Gm-Message-State: AO0yUKWSqYsgHgz5qn33P1E7bZm6HDPwHBsG1lbexQWkqkIDscxxgDDS
	+wWrIt3tKzc+RMrs0e6ggHO4jCSK183xzSiyHwY=
X-Google-Smtp-Source: AK7set9a8ICKVpxvrirNLYVqyC6BiRAMKBgiPcmiuiHzVB3zTla6HRYLt32gtX/Dmmfei+2N1FHTQ+gxWnquq+8r0Fo=
X-Received: by 2002:a17:906:128e:b0:8f1:4c6a:e77 with SMTP id
 k14-20020a170906128e00b008f14c6a0e77mr10134396ejb.12.1678318886126; Wed, 08
 Mar 2023 15:41:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y+2JYG5pYyyG1CG0@thunder.hadrons.org> <87v8k22ioe.fsf@cgc-instruments.com>
 <20230308233317.755c2edf@zen>
In-Reply-To: <20230308233317.755c2edf@zen>
From: Neal Gompa <ngompa13@gmail.com>
Date: Wed, 8 Mar 2023 18:40:49 -0500
Message-ID: <CAEg-Je_B7wG0+ODNdN1FNQewtSmf+fcmooLEsZqQ-2s-cWKJCw@mail.gmail.com>
Subject: Re: Distributions coordination lists
To: Sam James <sam@gentoo.org>
Cc: =?UTF-8?B?RGFuIMSMZXJtw6Fr?= <dan.cermak@posteo.net>, 
	Guillem Jover <guillem@debian.org>, distributions@lists.freedesktop.org, 
	distributions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 8, 2023 at 6:33=E2=80=AFPM Sam James <sam@gentoo.org> wrote:
>
> On Thu, 16 Feb 2023 07:06:25 +0000
> Dan =C4=8Cerm=C3=A1k <dan.cermak@posteo.net> wrote:
>
> > Guillem Jover <guillem@debian.org> writes:
> >
> > > Hi!
> > >
> > > I just noticed this new distributions coordination list:
> > >
> > >   https://subspace.kernel.org/lists.linux.dev.html
> > >
> > > Which seems to have already close to 80 participants. Although there
> > > was already a list that seems had the exact same purpose at:
> > >
> > >   https://lists.freedesktop.org/mailman/listinfo/distributions
> > >
> > > With around 280 participants. I think it would be nice to avoid
> > > fragmentation for this kind of coordination efforts?
> >
> > My guess is that most people forgot about it, as the list on
> > freedesktop.org had not much activity in nearly a decade...
> >
>
> [sorry for the late response, I've been dealing with a minor
> medical issue.]
>
> Yep. When asking around about this before taking the plunge with
> the new ML, nobody raised this old one, and indeed, in another
> discussion, someone raised another third ML hosted by a 3rd-party
> but it had even less activity & no information publicly listed
> on if it's supposed to be used or what (hosted by a company).
>

I prefer Mailman based mailing lists over mlmmj and majordomo based
ones, but I'll do whatever in the end, I suppose. :)



--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
