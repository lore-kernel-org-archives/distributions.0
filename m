Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDD11C3D
	for <distributions@lists.linux.dev>; Sat, 20 Jul 2024 03:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721447990; cv=none; b=Xj6mMBfWWjxCfRHBTzzwNOhu+MYT6IuUfuawPIvg7lET9T7yA6uY513kWruxFO40kDPyZIRXCFGKkoHZyNdTtAfy70AQi84wIi/lW0fFagRFPeFCVovdAcLeJ789TxN6mBTpZJN8oEKaUIgACeT+grCfUDJIk9PSZDMO/WUakDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721447990; c=relaxed/simple;
	bh=KEvC5TwwPoVQuWHM33sH6ec+WVZz9ZEqv44r5iQjOEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GXp74PBXKKmeVq4qtlAr8/+JBhu/owULkmcBBBVw9aUDCjv6YFcSvewWVtq6hv9Ty/GmFucatd+2yBFJvxFyDHZ3BIGKOY3j+VsLlZYcLWmJpSlKgk24ZD1a17regMpIuJsAYvCzHochbBrMlObn54Klk9JbpKyUYtbzzYU+GEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eeb1ba040aso38103281fa.1
        for <distributions@lists.linux.dev>; Fri, 19 Jul 2024 20:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721447986; x=1722052786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEvC5TwwPoVQuWHM33sH6ec+WVZz9ZEqv44r5iQjOEc=;
        b=b5L9AfMexkqbBVTe2j+gurqpf74blXJlOBnYOvmgXRUOlsyJDMxa1FiVwWyjyLIUmd
         A870VfUZgYJzf32h/hkqbrssXhrreRQ8wJeOUVnH5+dyT+TWqIXGDiiCelM3IDmE/ggh
         0vUeEM/uEg7GXfIYTLN6YOSv2LXBOJ3ZodEvWUThwm1uGGNGshyagt2qMA4fPDH9a9SM
         XPqUhHdhJT5oQj304FTSc29ulVgPAAxpoJQHoDPPIYJMJEwVe3OYA4nNhpbYxtQjtmUN
         2dEeNykcJPc5boAu5PrCrhVIM3E8MJrp2T799mBkuekHqUvxSVrhqkiR8hChRfVGNlsf
         NCHw==
X-Gm-Message-State: AOJu0YwkN1yyaz4yk3QI9EDtnuCUk7gwDhGDlRXCgT548q8sSSR6RYPn
	yxlvmq9faK9H+IDX1fPZPjCZzbQ8tONa8G8kajkU8uTlJLeFjhO+hrsvLcd/
X-Google-Smtp-Source: AGHT+IFrnBfSSXUi4gAixW3+B/LaclP/FAfVtu4FB//ekz9BeOTufUR/SByUOPtLbfEta2S9zfMRTw==
X-Received: by 2002:a05:6512:3d1a:b0:52c:e012:efad with SMTP id 2adb3069b0e04-52efb64c884mr212787e87.12.1721447986101;
        Fri, 19 Jul 2024 20:59:46 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ef99ea4a1sm115725e87.157.2024.07.19.20.59.45
        for <distributions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 20:59:45 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ef1c12ae23so2584511fa.0
        for <distributions@lists.linux.dev>; Fri, 19 Jul 2024 20:59:45 -0700 (PDT)
X-Received: by 2002:a2e:9cd2:0:b0:2ee:8573:eb51 with SMTP id
 38308e7fff4ca-2ef1684cfd6mr9426271fa.34.1721447985135; Fri, 19 Jul 2024
 20:59:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87bk2syc9r.fsf@gentoo.org>
In-Reply-To: <87bk2syc9r.fsf@gentoo.org>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 19 Jul 2024 23:59:08 -0400
X-Gmail-Original-Message-ID: <CAEg-Je8mVC90uROeYXOG8BXnP2tnF+pRDwensYXsdve9aNuthw@mail.gmail.com>
Message-ID: <CAEg-Je8mVC90uROeYXOG8BXnP2tnF+pRDwensYXsdve9aNuthw@mail.gmail.com>
Subject: Re: mesa-24.1.4 incompatibility with unpatched ffmpeg
To: Sam James <sam@gentoo.org>
Cc: distributions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 11:26=E2=80=AFPM Sam James <sam@gentoo.org> wrote:
>
> Hi!
>
> For those shipping mesa-24.1.4, please check whether your copy of ffmpeg
> has the patches at https://gitlab.freedesktop.org/mesa/mesa/-/merge_reque=
sts/29400#note_2432971
> applied, i.e.:
>
> * lavc/vaapi_decode: Make it possible to send multiple slice params buffe=
rs
> ** https://github.com/FFmpeg/FFmpeg/commit/fe9d889dcd79ea18d4dfaa39df4ddb=
d4c8c3b15c
> * lavc/vaapi_av1: Avoid sending the same slice buffer multiple times
> ** https://github.com/FFmpeg/FFmpeg/commit/d2d911eb9a2fc6eb8d86b3ae025a56=
c1a2692fba
>
> At a glance, I don't _think_ those patches are shipped in any release or
> backported on any of the ffmpeg branches yet, but please don't take my
> word for it as I only looked briefly and will check properly
> later. Apologies to ffmpeg if I'm wrong.
>
> Firefox's bundled ffmpeg is also affected, see below.
>
> Other references:
> * https://bugs.gentoo.org/936310
> * https://gitlab.freedesktop.org/mesa/mesa/-/issues/11533
> * https://phabricator.services.mozilla.com/D216919
>

Note, this also affects distributions shipping 24.0.6 or newer, too.



--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
