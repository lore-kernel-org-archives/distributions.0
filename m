Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CEF7FB
	for <distributions@lists.linux.dev>; Tue, 31 Jan 2023 16:49:27 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id gr7so18830061ejb.5
        for <distributions@lists.linux.dev>; Tue, 31 Jan 2023 08:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9qfEJcQ51QT3i7ATMA8Bi2xnMNisGtDqFaJw0ZnJOWk=;
        b=jryObGBXLvOn0MT7UJM7xA44YGY6DqWmx5P8U4UA6suWVMI6rakOeUG1aHlJmsaQUw
         fU5KJhZsM9kfURUgAHBDIewRTBUbR37AmqGAUjX43yVePWhFetKvrtYaB4TEhMSfQQze
         kLWXVOlxptPo9eZZyDkPxcJHrweLLCPcU6Zl2lmmrxJuBV8ukvmDt/sqgIULnQHlpPpn
         RziWl3/fCAvooFulAXIAxS5u0ebznxMiOijebi9DvdEWevbwIsuMcR/x793T2FzxyD8V
         1RgyGu4kjVh0Tv0FxuFzwwwNg7hXgb3t1toPnPrT8bVlM3Jt4BFyghRFbCacSJv95HE8
         ykZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qfEJcQ51QT3i7ATMA8Bi2xnMNisGtDqFaJw0ZnJOWk=;
        b=hyI+lCrnSreAy2VL5UiZLtqJVE3qh8VM+TSnpiQwkuUMBrOANP64v/uwZy6PlC5h1S
         Sbecmim6VlVrXl97xGsJAEix0CegF5dCWtwUGqVkbS08hnvJy/qCctnLYf18cG9oBSGr
         RWtsHEspjTE/M3i2zGLqqPhQPanm3tear8RUTuT99nhcr62BmpGGr40myd1vXprFZTH/
         bhV6XxRwW5P7Kq+YS3y5jvaCP6istz+cxrikcI4tlFiJvmVjqr8Er0Sxn7zDnxuPi/KY
         gJaXLp5fVoowAXDdK1j5sumaya1WbajX3gh11oPz5x0rWRj3oKGEDYZYi+UfvR+Aadf/
         txhg==
X-Gm-Message-State: AO0yUKWRpQLyv6C455K64cxa+WZJBigD3qTHF74L1MFp/wR7RW44JWti
	cIMVRiBOKaZaDhxuBHt41ebmAbUa2hviRUwk4KnJyAObEByoMg==
X-Google-Smtp-Source: AK7set8ujV7kSXvCX5ombCNDv/dEvIcBErMJ+U9xHsrRXzHP3o64NSmcZbgmFg+9xCXeeiLt7NlIc+1V3G1kmcuZvx8=
X-Received: by 2002:a17:906:2347:b0:87a:ed8f:ba12 with SMTP id
 m7-20020a170906234700b0087aed8fba12mr4540511eja.293.1675183764956; Tue, 31
 Jan 2023 08:49:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Neal Gompa <ngompa13@gmail.com>
Date: Tue, 31 Jan 2023 17:48:48 +0100
Message-ID: <CAEg-Je_sqMA4v1L16ngVehwwpxnNNGP9RbOSENUJwzWNvYBQ-Q@mail.gmail.com>
Subject: Self-introduction: Neal Gompa (Fedora, CentOS, openSUSE)
To: distributions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

My name is Neal Gompa. I'm a Linux enthusiast and Linux distro
contributor spanning across many Linux distribution communities. I=E2=80=99=
ve
been using Linux for two decades now, and I=E2=80=99ve been contributing to
open source for almost as long. From a =E2=80=9Cdistro leadership=E2=80=9D
perspective, I participate in leadership roles in multiple Linux
distributions:

* Fedora Engineering Steering Committee (FESCo[1]) member since May 2020
* Mageia.Org Council[2] member since April 2018
* Mageia.Org Board[3] member since March 2021
* openSUSE Project Board[4] member since January 2021

I also informally participate in leadership roles in various
distributions. In the CentOS Project[5], I am the co-chair in the
CentOS Hyperscale SIG[6] and the chief developer of the CentOS Stream
Hyperscale Workstation Spin[7]. Within the Fedora Project[8], I also
run the KDE Special Interest Group (SIG)[9]; the Workstation Working
Group (WG)[10]; the Cloud SIG[11]; and lead the Fedora Btrfs project.
In the openSUSE Project[12], I assist with the planning process for
future openSUSE Leap releases[13] and act as a community bridge to
SUSE Linux Enterprise engineering.

I previously did work in Yocto, OpenMandriva Lx, and ROSA Linux
distributions to help modernize their software management systems, and
established bridges with upstream projects so they could work with the
larger community around RPM-based distributions. I have assisted in
the creation of custom Linux distributions in the past as well.

In the past couple of years, I've done a fair bit of work around
modernizing the Linux desktop experience in Fedora Linux. User-facing
changes I've implemented or assisted with implementing: Btrfs by
default in Fedora Linux 33 on the desktop[14], Wayland by default for
KDE Plasma in Fedora Linux 34[15], PipeWire for audio in Fedora Linux
34[16], Btrfs in Fedora Linux 35 for the cloud[17], WirePlumber for
PipeWire in Fedora Linux 35[18], replaced SDL 1.2 with a shim using
SDL2 in Fedora Linux 35[19], and improved power management on Fedora
Linux 35[20]. Through my work in the CentOS Hyperscale SIG, I have
brought many of these features to CentOS Stream 9[21], which will
enhance the experience for anyone using RHEL 9 and derivatives.

I would like to lend my experience, expertise, and community
connections to help this community solidify their future on Linux. I
would also like to invite anyone interested to come meet me on Matrix in
#kde:fedoraproject.org[22], #workstation:fedoraproject.org[23], or
#centos-hyperscale:fedoraproject.org[24].

If you want to know a little bit more about me personally, I gave a
pretty good interview about myself on the Destination Linux podcast
a couple of years ago[25]. I hope the wall of text doesn't intimidate you, =
I'm
generally a friendly guy and happy to talk about all kinds of tech and
Linux stuff! :)

Thank you for your time and best regards,
Neal

[1]: https://docs.fedoraproject.org/en-US/fesco/
[2]: https://wiki.mageia.org/en/Org_Council
[3]: https://wiki.mageia.org/en/Org_Board
[4]: https://en.opensuse.org/openSUSE:Board
[5]: https://www.centos.org/about/#the-centos-project
[6]: https://sigs.centos.org/hyperscale/
[7]: https://sigs.centos.org/hyperscale/spins/workstation/
[8]: https://docs.fedoraproject.org/en-US/project/
[9]: https://fedoraproject.org/wiki/SIGs/KDE
[10]: https://docs.fedoraproject.org/en-US/workstation-working-group/
[11]: https://fedoraproject.org/wiki/Cloud_SIG
[12]: https://en.opensuse.org/Portal:Project
[13]: https://en.opensuse.org/Feature_Planning_15.4
[14]: https://fedoraproject.org/wiki/Changes/BtrfsByDefault
[15]: https://fedoraproject.org/wiki/Changes/WaylandByDefaultForPlasma
[16]: https://fedoraproject.org/wiki/Changes/DefaultPipeWire
[17]: https://fedoraproject.org/wiki/Changes/FedoraCloudBtrfsByDefault
[18]: https://fedoraproject.org/wiki/Changes/WirePlumber
[19]: https://fedoraproject.org/wiki/Changes/SDL12onSDL2
[20]: https://fedoraproject.org/wiki/Changes/Power_Profiles_Daemon
[21]: https://blog.centos.org/2022/01/centos-hyperscale-sig-quarterly-repor=
t-for-2021q4/
[22]: https://matrix.to/#/#kde:fedoraproject.org
[23]: https://matrix.to/#/#workstation:fedoraproject.org
[24]: https://matrix.to/#/#centos-hyperscale:fedoraproject.org
[25]: https://destinationlinux.org/episode-198/



--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
