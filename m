Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4863A1C754
	for <distributions@lists.linux.dev>; Thu, 11 May 2023 10:16:43 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-50be17a1eceso15833551a12.2
        for <distributions@lists.linux.dev>; Thu, 11 May 2023 03:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683800201; x=1686392201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ewvW+vBR+7UevebR34YG2CPkPli76fRwgc3ZyOJFpA=;
        b=T/k7eqVIF7WN7Yso4QTOwhfv1G0joJq0REDMe2li9UTvj8iC1jm2DlJY8Xa8wigDZX
         1dATTAmxnGUBUUXVoyXyejsgNops/n14xJaesEAP26DwEwo6eo/QcFGS6ODrb2eA9zA+
         rbHg0xdXufXdtlZVM9RUNC1uVmHsPFTsp3IB3iO2I6GduKnuxoXYR689gXf29DI0/5KI
         ktUiZPPkBp96Sj2AMgmvFzrnSBhfSEVgrg0d36rAjmbVQX2F1CqT9Ee10I62txvhFLsx
         QpHUMJhhUtZWe3c4Xj0aUKSjRpZ4snLeERwO8/v+lUPKi36+snObEPNK4FlAlGeSIHE1
         QTEQ==
X-Gm-Message-State: AC+VfDywFSs0P8b80M7m5ZZAHdgjdRrNUX+9EUPb9UYCT+/PH9UDt1Nf
	OtJ4xKWkb1TI0Oea7lOOBrsBKKD66WOTIjGp
X-Google-Smtp-Source: ACHHUZ72sxxueeJJgsaDx54bj6gfYPqpoDHRu0kjUxRO8mLbL5rCuRJSvVwMlK0mggcWd67fNewnDQ==
X-Received: by 2002:a05:6402:1255:b0:50b:cadd:21e6 with SMTP id l21-20020a056402125500b0050bcadd21e6mr18652368edw.8.1683800200714;
        Thu, 11 May 2023 03:16:40 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id d14-20020a50fb0e000000b0050bc6d0e880sm2694738edq.61.2023.05.11.03.16.39
        for <distributions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 03:16:40 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-50bc37e1525so15841816a12.1
        for <distributions@lists.linux.dev>; Thu, 11 May 2023 03:16:39 -0700 (PDT)
X-Received: by 2002:a17:907:944d:b0:94e:fa56:a74f with SMTP id
 dl13-20020a170907944d00b0094efa56a74fmr17977503ejc.14.1683800199247; Thu, 11
 May 2023 03:16:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230511092745.l53qykvz7roq4dqj@x220>
In-Reply-To: <20230511092745.l53qykvz7roq4dqj@x220>
From: Neal Gompa <ngompa@fedoraproject.org>
Date: Thu, 11 May 2023 06:16:03 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9R02XBCsjP2ZLYKHzNjPvwYVdgO7qND65WOYzR9BWbLg@mail.gmail.com>
Message-ID: <CAEg-Je9R02XBCsjP2ZLYKHzNjPvwYVdgO7qND65WOYzR9BWbLg@mail.gmail.com>
Subject: Re: Next Chromium release will require unreleased LLVM
To: Alyssa Ross <hi@alyssa.is>
Cc: distributions@lists.linux.dev, primeos <dev.primeos@gmail.com>, 
	Ryan Lahfa <ryan@lahfa.xyz>, Lorenz Brun <lorenz@brun.one>, Tom Callaway <spot@fedoraproject.org>, 
	Than Ngo <than@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 5:27=E2=80=AFAM Alyssa Ross <hi@alyssa.is> wrote:
>
> The Chromium 114 beta uses features from LLVM 17, but will release
> before LLVM 17 does.  Currently, it looks like it wouldn't be too hard
> to patch to make it compatible with LLVM 16, but in general, we don't
> have any guarantee that Chromium will build with a released LLVM.
>
> So, how do you intend to handle this situation in your distribution?
> It seems like it will be a problem we'll all share, especially if it
> gets worse in future.
>
> Nixpkgs discussion:
> https://github.com/NixOS/nixpkgs/issues/213862#issuecomment-1542887001

I suspect we in Fedora will do the same thing and revert/modify things
to work with LLVM/Clang 16. It is, however, not out of the question
for us to ship multiple versions of LLVM+Clang in Fedora, so once LLVM
17 is shipped in Fedora, we will probably switch Chromium to that.

We only recently switched building Chromium from GCC to Clang.
Switching back might be an option too, depending on what the
compatibility looks like.

I'm personally not a fan of the Clang/LLVM toolchain after having
worked on building distributions entirely using it before. But alas,
I'm in the minority. :/




--
Neal Gompa (FAS: ngompa)
