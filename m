Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D891279DE
	for <distributions@lists.linux.dev>; Fri, 31 Mar 2023 16:01:17 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id t10so91346648edd.12
        for <distributions@lists.linux.dev>; Fri, 31 Mar 2023 09:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680278476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ff3Rrwut7l58pKoo+4L30/zYx7UScuJ/l/vAjKGDWt8=;
        b=k7tZS4gPcCzdKppkRqlUV2eCaUcEgBcqEpkggIvMEa/LfmON7VqEc3E7kc5x1gLmzI
         uss96923KsNATURTaLYvmKOqsg0jcAt2kXe6mx2K8fxeO5hvvBkEhntzD5ID8gHUSOGj
         429c3J//2Wl5NYvTw34/CtaG3szEgSjNjSs9mIdPQGg1GdWcOhFWGQJj4tID+xGV1UqR
         cAstkOg+eVPqFzbQUSH8/ITEwTEnQ1aenW94uaYljhgeyZeJLqaPlpaIJ8HREWIlD6tq
         RLwqA219XjXa39zUxXFsQFfd8M5PMviQ1PUCYhL76UfGqIryzZgKKDKC7kyZeUmh1MfO
         sRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680278476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ff3Rrwut7l58pKoo+4L30/zYx7UScuJ/l/vAjKGDWt8=;
        b=hcBYRjw6ZnXnDCemX1itoq7nNZEdVcg/XzC5/4OpV2+vPgJ/PmzvfPTruIwZzK5LJa
         MLw4fZYh4yNErFKtrfvomhlylXG9olxrblKiFkZ7cW690+WgvBsbeOCKAKP+/xoV4GcN
         UGQCZ+C1hnA6IRK2fdff3/DJydDDLknhw0jo+PmnUSVw2UJD8sWqal9SEgGtsU0UoLt0
         uZeCX5D8t+phpPnH5zdib1LJOoFaNJvEDkfId41LHAUf/9V5dd80IGFOYT2qOJPQfnwT
         3nNqumcMQHTi+1sAm4AsJu+ukZwdnxvsz8QIo8zeQiNX+RjPDrPQRRYn4aS7X06BSqsi
         tKGw==
X-Gm-Message-State: AAQBX9eoC93SH3LtRlcH/Nin5ObVCwXB1sf3tU6MVO4SyRpTAMIIchRp
	sLXiOuR0Z6afpqty7RozquCJLlWvqhfroxk1DI4ULby81EsOwtw7
X-Google-Smtp-Source: AKy350b2AlfTDe/ZJZC7E5oud+1CggGleccBlqGAzp/STWjPPSIh+qUu6MwiUtlsiiCRvcJB1+E/1spLYl7V4P0vZAA=
X-Received: by 2002:a17:907:6092:b0:930:310:abc9 with SMTP id
 ht18-20020a170907609200b009300310abc9mr15302220ejc.9.1680278475782; Fri, 31
 Mar 2023 09:01:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZCb9MrFq5IbdnIZ-@sysrq.in>
In-Reply-To: <ZCb9MrFq5IbdnIZ-@sysrq.in>
From: Neal Gompa <ngompa13@gmail.com>
Date: Fri, 31 Mar 2023 12:00:39 -0400
Message-ID: <CAEg-Je_e_PzcCLyn=Kb8XdcP4JOKX6cFJrncMY9qnuxyWcKFpA@mail.gmail.com>
Subject: Re: Detect QML Dependencies
To: "Anna (cybertailor) Vyalkova" <cyber+gentoo@sysrq.in>
Cc: distributions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 11:39=E2=80=AFAM Anna (cybertailor) Vyalkova
<cyber+gentoo@sysrq.in> wrote:
>
> Hey,
>
> in Debian we package more and more QML applications and face the problem,=
 that
> we don't have tooling to easily get a list of QML dependencies out of the=
 qml
> files. I normally end up doing a grep in the qml files and than I need to
> translate these dependencies to the corresponding Debian packages. What i=
s
> quite error prune.
> Does anyone have already a working solution to detect the QML dependencie=
s -
> maybe there is alaready a qmllinter/qmlchecker tool that returns the need=
ed
> QML dependencies and create package dependencies?
>
> That is currently my way:
>
> grep -r --include=3D"*qml" '^import ' | sed 's/^.*\.qml:import \([^ ]*.*\=
)/\1/g'
> | sort | uniq
>

I've been looking into this for Fedora as well:
https://pagure.io/fedora-kde/SIG/issue/37

There are some examples of dependency generators from openSUSE,
Sailfish OS, and OpenMandriva.

It'd be good to turn this into a unified framework that distributions
can use, because all these implementations are kind of scattered with
their own issues.



--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
