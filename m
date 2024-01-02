Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBA5F517
	for <distributions@lists.linux.dev>; Tue,  2 Jan 2024 12:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e7be1c65dso5913503e87.3
        for <distributions@lists.linux.dev>; Tue, 02 Jan 2024 04:51:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704199864; x=1704804664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GDNIyczWhV5VlkKCFOknwtC3LOFQyX3BLGQaAC5xhA=;
        b=auxVVxKuvZkkU/GxGLgFfoHyWTxj7WisJu5Ukjr5q6rYAhBF/cKgVENrOGXhHJHvBG
         unAMcYr6J2KcdZVbaY9jJQE1aGAVOz1nlMivAme2Ph9CBKzOkiaPwOrY7iTZS3YmzaKP
         nw3WpMS573YNGtsYqPKnyL1K6fbm+2xWIsJkNsjeZsCghijC8PaDw3Z6O6K8RMykhKSO
         f9toCB2XzLKiS4QdfUjQcRMhuo1FQZ8vKHVAXwbWW4J2T3TSjiY/9+inyU/iCbOql7l9
         78+S/BXrXLHsVFx3Qpf7K1M0iKtsVGZKkQqJzxYXvI3+NRWZYYlP4S4yuiB5MuKwFyfl
         bxyQ==
X-Gm-Message-State: AOJu0Yzkm1VloXSxAX51ODEIqclO/sC+xvecOTu6m2Fq6DDNwq1bdR95
	s0ULLIxxZqvDjrjiLrMFJSD9C67sNIQxrA==
X-Google-Smtp-Source: AGHT+IFugN7V6HnWjLcXxXkfmzNH7vS/mJbhb4ds4MHQ9uUtS1KsR/W+dndqqDCBNV9TEzxTt2vsbA==
X-Received: by 2002:a05:6512:1055:b0:50e:7e22:3143 with SMTP id c21-20020a056512105500b0050e7e223143mr6584767lfb.19.1704199864054;
        Tue, 02 Jan 2024 04:51:04 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id u12-20020a056402110c00b0054c9211021csm15768593edv.69.2024.01.02.04.51.03
        for <distributions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 04:51:03 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a2331caab22so942107166b.3
        for <distributions@lists.linux.dev>; Tue, 02 Jan 2024 04:51:03 -0800 (PST)
X-Received: by 2002:a17:906:7810:b0:9ae:699d:8a2a with SMTP id
 u16-20020a170906781000b009ae699d8a2amr7139285ejm.5.1704199863651; Tue, 02 Jan
 2024 04:51:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2a182576-0382-45ce-a5b4-b469f154a6de@suse.de>
In-Reply-To: <2a182576-0382-45ce-a5b4-b469f154a6de@suse.de>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 2 Jan 2024 07:50:26 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-GXuGJH66_FBZsi-Uxrg6HM6Ra6=mdCmj4gRO06oSRAA@mail.gmail.com>
Message-ID: <CAEg-Je-GXuGJH66_FBZsi-Uxrg6HM6Ra6=mdCmj4gRO06oSRAA@mail.gmail.com>
Subject: Re: 64-bit time_t
To: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
Cc: distributions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 2, 2024 at 7:45=E2=80=AFAM Bernhard M. Wiedemann <bwiedemann@su=
se.de> wrote:
>
> In https://lore.kernel.org/distributions/6614772.670kD7asE2@nimes/
> Bruno Haible wrote:
>
> > Regarding the distro people:
> >
> >   The outcome of a discussion, about a month or two ago, was AFAIU that
> >   Linux/x86 and Linux/arm distros have a choice between
> >     (a) enabling 64-bit time_t for all packages, thus breaking ABI
> >         compatibility once and becoming year 2038 saft, or
> >     (b) staying with the 32-bit time_t, and announcing that their
> >         distro will stop working in 2038.
> >   An incremental or partial move to 64-bit time_t would be too expensiv=
e,
> >   did the distro people say.
>
> or option c)
> One less troublesome solution could be to patch glibc to redefine the
> 32-bit time_t as unsigned so that ABIs could remain compatible and at
> the same time it would support timestamps until 2106.
> Though that would break any application that uses time_t for dates
> between 1901 and 1970 (are there any?).
> Do I miss any other downsides?
> This seems to be the only option that allows legacy-binaries to keep
> working after 2038.
>
>
> option d) would be to adapt all libraries that have time_t in their API
> to have both 32-bit and 64-bit time_t variants. The former for
> compatibility with old binaries and the latter for new future-proof
> binaries. This could provide a smooth transition because not all
> 3rd-party binaries can be rebuilt.
> The trouble here would be the effort for the libraries to provide 2
> variants and for callers to select the right variant.
>

In my view, Option D would be ideal, but otherwise we should probably
just break everything and do option A unless glibc has already
switched unsigned numbers for time_t in 64-bit time, so then using
32-bit time_t unsigned would be "okay" and thus Option C would work.




--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
