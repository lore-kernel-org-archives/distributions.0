Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629981877
	for <distributions@lists.linux.dev>; Sun, 14 May 2023 19:11:26 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-50db7f0a1b4so10231574a12.3
        for <distributions@lists.linux.dev>; Sun, 14 May 2023 12:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684091484; x=1686683484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHt5pk9BSG6mT+5MMLKJYhhRRVc7p6Ent+xjdtwbZPc=;
        b=cDytu5pZI0enIumxfg3YxDVmScFWv2lZPjqXHwRAnoULE0/xrpuFwEZluWuVaXgSpn
         /iuZEtivlvzC2zznzJzW4GmTdFGUglwXwMBAiXqrRizVizknrLEo5MeKW2vLB+iAju6R
         u5LRlYxGhu1PNnoVEFjnQRrMDc/v32GOgcL1lrNsD5VhootTKOca7l+Z8pJ4/H2AJXvt
         PNieEmLpw2jhRZZX/3pvV8ex4juOTOlyMEd4Ne5uEUKwRyPSYbgXTw7EDaxRp6XTOiLg
         75HzYJH5/mKb/ERDgyOdcGIXWWM4rDOy1C7jeqKSasc9DDOi9td5Xxs8zdzHwN5WDkeK
         qkxA==
X-Gm-Message-State: AC+VfDw9xI5NlylNa5IT+/ewxR2j4qVpPNehYyowM1DmRFYtvd8KBBnT
	M4Tvmz1ZUYU0fm9bGSo9sRIIvjU4vPPK5w==
X-Google-Smtp-Source: ACHHUZ4FDxowtZwfOr9u+Lk2XyrU1DmAZRtkfLy0KcKzgN8ekFh4P2u9d6ZJhklATCP0QaoOEPbFFw==
X-Received: by 2002:a17:907:1b17:b0:965:6075:d0e1 with SMTP id mp23-20020a1709071b1700b009656075d0e1mr25562328ejc.72.1684091483689;
        Sun, 14 May 2023 12:11:23 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id gz20-20020a170907a05400b0095342bfb701sm8584459ejc.16.2023.05.14.12.11.23
        for <distributions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 12:11:23 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9659443fb56so1871060266b.2
        for <distributions@lists.linux.dev>; Sun, 14 May 2023 12:11:23 -0700 (PDT)
X-Received: by 2002:a17:907:8a02:b0:967:d161:61c6 with SMTP id
 sc2-20020a1709078a0200b00967d16161c6mr23345280ejc.3.1684091483056; Sun, 14
 May 2023 12:11:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ugny5rbd4g3nuge7yuyhygqgb343eflqwavht2wmkp5oradoeq@2nat6bpbmsbz>
In-Reply-To: <ugny5rbd4g3nuge7yuyhygqgb343eflqwavht2wmkp5oradoeq@2nat6bpbmsbz>
From: Neal Gompa <ngompa@fedoraproject.org>
Date: Sun, 14 May 2023 15:10:46 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9LW16niant=h4W+a-TuXQ82qbE_iDO7fRNn+04mwAZwg@mail.gmail.com>
Message-ID: <CAEg-Je9LW16niant=h4W+a-TuXQ82qbE_iDO7fRNn+04mwAZwg@mail.gmail.com>
Subject: Re: OpenSSL 3.x and Ruby 3.0.y
To: Ryan Lahfa <ryan@lahfa.xyz>
Cc: distributions@lists.linux.dev, hexa@darmstadt.ccc.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 14, 2023 at 2:51=E2=80=AFPM Ryan Lahfa <ryan@lahfa.xyz> wrote:
>
> Hi there,
>
> Ruby 3.0.x decided to not support OpenSSL =E2=89=A5 3 in their tree.
> Though, it seems like many services like Gitlab are still compatible
> only with Ruby 3.0.x.
>
> A solution (which I think was found out also by Fedora?) consist into
> installing the OpenSSL gem version =E2=89=A5 3.
>
> We do it by replacing the `$ruby-tree/ext/openssl` directory in this way
> in NixOS: https://github.com/NixOS/nixpkgs/pull/231899/files#diff-c1d18e0=
554429e0b48c20c01ef94191fa75ba3ef6e057b5b9e3c40dde0c2b64bR158-R163
>
> FWIW, Ruby 3.0.x will be supported for the next 10 months, Ruby 3.1 do
> not have this problem.
>

For reference: https://src.fedoraproject.org/rpms/ruby/c/2da7a540e7714777b9=
3c430b4f252838b555b703

We're on Ruby 3.2 now, which has this all integrated. But that's how
we did it for Ruby 3.0.


--=20
Neal Gompa (FAS: ngompa)
