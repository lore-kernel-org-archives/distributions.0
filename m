Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771E4352C5B
	for <distributions@lists.linux.dev>; Wed,  4 Mar 2026 03:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772593759; cv=none; b=aqvPrWeLv9/W9ciNtPZulS2cPm6d16CyD153F8KR2Rbm3bcoYYPhkEqzXlNv9D/naJPstGyDFANwZSFVMCdQuGf9VuE7O+UIMU/tczJAcUPliJ/ouoW8tPL6aybiRIwqO7F/JivMjUAMseEfpeqDEfUU1dAHAppWJeaxBu/yAyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772593759; c=relaxed/simple;
	bh=ATi23aouP+7QWJKfDxynyw8sAC1cMnSdtCUZt6jClt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ipjA0SPkX+jN3nfw/KeGwR4LsjBQSbI3MCNTN1bQIv2Nm8cwUXxxfv9re0ILHMPrlJYRf2uYdgvNts8Bnsxv3P7AT9HKGq1U9QxRytVM19pe4PqYh8/VCcJQAYLc4kxt6hsUcy/dhUW4ioGJKl9dLyHx09Vqz4SjLPDiAigVusc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d596a96475so3698009a34.3
        for <distributions@lists.linux.dev>; Tue, 03 Mar 2026 19:09:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772593757; x=1773198557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RtNUng8o4SZl1lSchFqeylOKzGPG6coX4pdB71ZZlvg=;
        b=fEr9iHHEH7s3eKi0LZDuJnPiXHN/2eNiRIHEwTJeSO9RLflLZ06iddgM1TgW9Lx3+k
         ZR+9vgS/3fT6kzQok92Zss1nygHlUTb5aenYYFNyEsI7LDFJmHsr0ASanm9RhkeOZ/m8
         /jJV+LempcJeW7nxRX9KZWvxgbuWIS6Tw8HvrhJuqe+pZbPSQlTCR5vgzeCZV/efASVM
         AVxOUcmRH5o1Ve5uh9C4D/NTfDw3Fr1swGxS5h5xmzkoNX86rNfnizqqKZHWkjtTSYIS
         QEpfIU48fxtWj5HlUhsay0tdyRa+3KmtiXDLKjNmdd/uU5Y9Tg0W6TuC4VPmex47mZC9
         tA3A==
X-Forwarded-Encrypted: i=1; AJvYcCWGKg6tK/5KHyMYxUCD6RwxmRJsQnRW6rhUDVP3mUvnx3r/XC1vA3YvBD3C7bcGrR2A/nqmfYGqOKCaMt/R@lists.linux.dev
X-Gm-Message-State: AOJu0YwgOQljmP4JmXBq+IbYfeZVrKhDSteA78zJaVlvOzE9D4brJGaq
	+VlcXlbmIaQfO9y/n0EDzswYao0bpK0uzc3k5m3KEcRhkWZvr9mZKxUk0pQPpw==
X-Gm-Gg: ATEYQzzU75wElygKHo6M3E/SXD97p2vgT3h5N+GwERJ2B2uLTXIUWuO5zwRs+2WnRBE
	/Lg1WzVuEVKzOas6jZps/DycBeYRBwW3w0tflQbSQK5cmImVysJf8aFMfhdLNS7G5bWIRKFYqQV
	PoydlbXOWpQuVnUV0HZco0X7sI0Gj9ozYp6fxOASrKgHqdRPOqPO6oi2hQZlcWDL7Qt/NmwYwkn
	MIZpm++OwjmWVH6/spRHDxKSoLnVa1dQWXINMvIWrHQ6FrUbVea883DMaa9IoLOT/udSexVIUzy
	Pldsm+HowbkYOuShkZ9oDT4rjFVmhGMqGvPZHZk9KgKj59KWKJMdB8SDNl1DGPu89bt0RsllyaB
	kuq2EuU2X0zKGdFfsoUT1wFVxYS3FPmx1zwE0nr09drb9SYHpJBbU0x6eILP1sZvhY1mOxP4Q1v
	TGhtBMQwCFuVkOWT7Yi9TaKTwYAZYaLjaoFs0sVToWM+Sy7F+rIpwPKwZ/RAmesTXsHEFHb5iv8
	nU1sIKbkDXK42qmybfJhh9DHP6txOBdZXJI+2k/5LZL0Q7s9whzQNRu/6VX3hPtZefZqnukIA==
X-Received: by 2002:a05:6830:6b04:b0:7cf:d1eb:f37a with SMTP id 46e09a7af769-7d6d138b5d9mr451205a34.18.1772593757192;
        Tue, 03 Mar 2026 19:09:17 -0800 (PST)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com. [209.85.210.41])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d5866269a8sm14774580a34.13.2026.03.03.19.09.16
        for <distributions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 19:09:16 -0800 (PST)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d4ba9abbecso7725809a34.1
        for <distributions@lists.linux.dev>; Tue, 03 Mar 2026 19:09:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWd76YFc9WJNCH1bAYvJKqAAJRpKMnGO2sWhk78M9dv83sH63lW6vNGbkpTyBA7Qru7T9jiSfGQR/AwDXNP@lists.linux.dev
X-Received: by 2002:a05:6830:4429:b0:7c7:59a1:48c8 with SMTP id
 46e09a7af769-7d6c7f2183bmr423553a34.4.1772593756183; Tue, 03 Mar 2026
 19:09:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <3061027c-4e67-47bd-b8d9-1d848acf3a38@oracle.com> <878qc8gwg3.fsf@gentoo.org>
In-Reply-To: <878qc8gwg3.fsf@gentoo.org>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 3 Mar 2026 19:08:38 -0800
X-Gmail-Original-Message-ID: <CAEg-Je864o2bVNjmqyiFA3vxwhjPh2zesXD50n0L7j0oprp90Q@mail.gmail.com>
X-Gm-Features: AaiRm522IqT1a4TTpIOGUgsalhuGskzuYepxX2gXRUTjm5HTqpsEnu1bvcEa9tM
Message-ID: <CAEg-Je864o2bVNjmqyiFA3vxwhjPh2zesXD50n0L7j0oprp90Q@mail.gmail.com>
Subject: Re: British Columbia redefines "Pacific Time"
To: Sam James <sam@gentoo.org>
Cc: Alan Coopersmith <alan.coopersmith@oracle.com>, distributions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 6:28=E2=80=AFPM Sam James <sam@gentoo.org> wrote:
>
> Alan Coopersmith <alan.coopersmith@oracle.com> writes:
>
> > The Canadian province of British Columbia announced yesterday that they=
 are:
> >     "Adopting permanent daylight saving time: =E2=80=98Spring forward=
=E2=80=99 on
> >    March 8
> >    will be the last time change, ending twice-yearly clock changes."
> >
> > They've given us 8 months notice to deploy updates to timezone data bef=
ore
> > their now-cancelled switch off of daylight saving time in November
> > [...]
>
> *Just* missed the 2026a release as well
> (https://github.com/eggert/tz/commit/8b46071fd85a7a9434d63894bac64d30362c=
c16d),
> I note it as I'd assumed the fix was in there until I checked.
>
> > but of
> > course, because naming is the hardest thing, they've decided that even =
though
> > their time will now be the same as Mountain Standard Time, they have
> > designated it as "Pacific Time", leading to the IANA TimeZone database =
folks
> > having a bit of discussion on what timezone labels to generate in outpu=
t time
> > stamps:
> >
> > https://lists.iana.org/hyperkitty/list/tz@iana.org/thread/667WE5QTIA7MP=
2E7NC7T3SO7VLMZLVZS/
> >
> > They've also pointed out the blast radius may reach a bit beyond their =
database:
> >
> >> Ruby on Rails' ActiveSupport::TimeZone, for instance, attempts
> >> to "[l]imit the set of zones provided by TZInfo to a meaningful subset=
".
> >> It maps the string "Pacific Time (US & Canada)" to "America/Los_Angele=
s".
> >> The baked-in assumptions, once seemingly reasonable, now swiftly break=
 down.
> >> https://api.rubyonrails.org/classes/ActiveSupport/TimeZone.html

I am surprised they didn't go with a similar solution to the older
Indiana Eastern Time and call it "BC Pacific" or something similar.


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
