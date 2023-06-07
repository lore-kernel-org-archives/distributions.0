Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B509E7F7
	for <distributions@lists.linux.dev>; Wed,  7 Jun 2023 06:49:49 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1q6mzE-003vH8-Ih; Wed, 07 Jun 2023 08:49:40 +0200
Received: from p57bd9896.dip0.t-ipconnect.de ([87.189.152.150] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1q6mzE-001oi6-Bq; Wed, 07 Jun 2023 08:49:40 +0200
Message-ID: <880e5dc1bd772c843c8375c521516bfb70458754.camel@physik.fu-berlin.de>
Subject: Re: nss-3.90 breaks w/ earlier x86-64 CPUs (SIGILL)
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Sam James <sam@gentoo.org>
Cc: distributions@lists.linux.dev
Date: Wed, 07 Jun 2023 08:49:39 +0200
In-Reply-To: <87ilc0b8fc.fsf@gentoo.org>
References: <87ilc0b8fc.fsf@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.2 
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.152.150
X-ZEDAT-Hint: PO

Hi Sam!

On Tue, 2023-06-06 at 22:12 +0100, Sam James wrote:
> nss-3.90 unconditionally uses adcxq on x86-64 which breaks on <
> Broadwell.

Thanks for the heads-up! It's unfortunately a common problem with
the Mozilla codebase and has happened multiple times before.

Someone contributes new code to accelerate functionality using new
processor features and then they completely forget to guard this
code properly so it isn't used unconditionally.

Also, Mozilla's build system is rather complex which means adding
such guards as an external contributor is quite time consuming,
been there, done that.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
