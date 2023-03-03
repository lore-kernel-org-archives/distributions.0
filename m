Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011958F6E;
	Fri,  3 Mar 2023 23:39:22 +0000 (UTC)
References: <A6582515-25ED-4F71-B924-4431F8139376@gentoo.org>
 <7253e4c5-0f36-e725-f180-624f8887bf08@cs.ucla.edu>
 <20230302110244.GK7636@redhat.com> <4158136.ciBtUerH68@nimes>
User-agent: mu4e 1.8.14; emacs 30.0.50
From: Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@gentoo.org>
To: Bruno Haible <bruno@clisp.org>
Cc: Paul Eggert <eggert@cs.ucla.edu>, "Richard W.M. Jones"
 <rjones@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Demi
 Marie Obenour <demiobenour@gmail.com>, Eric Blake <eblake@redhat.com>, Sam
 James <sam@gentoo.org>, Carlos O'Donell via Libc-alpha
 <libc-alpha@sourceware.org>, autoconf@gnu.org,
 c-std-porting@lists.linux.dev, Zack Weinberg <zack@owlfolio.org>, David
 Seifert <soap@gentoo.org>, Gentoo Toolchain <toolchain@gentoo.org>,
 dueno@redhat.com, distributions@lists.linux.dev
Subject: Re: On time64 and Large File Support
Date: Sat, 04 Mar 2023 00:21:33 +0100
In-reply-to: <4158136.ciBtUerH68@nimes>
Message-ID: <86mt4tl80y.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Evening all,

[CC +=3D distributions@lists.linux.dev as a thread about this popped up
 there]

Before anything else, I'd like to say that I'd prefer no distributor
acts on this issue until a smooth (or, at least, common) solution can be
established.

Bruno Haible <bruno@clisp.org> writes:

> Richard W.M. Jones wrote:
>> Another way to look at this is that it's a bug in gnutls and we should
>> fix it only in this package
>
> It's by far not just this one package. An 'fgrep -rl time_t /usr/include'
> search shows a number of libraries that use time_t in their API:
>   alsa, boost, libstdc++, glib-2.0, gtk+-3.0, libpng, nettle, openssl,
>   readline, libuuid, wxwidgets, X11, libxcb
> - and that's just the few that I happen to have installed.
>
> If a distro takes a package-by-package approach:
>   - Some of these packages use Gnulib, and are thus causing trouble now or
>     will soon.
>   - The other packages (and there are a number of them!) will either
>     require a manual switch to _TIME_BITS=3D64 or blow up in 2038.
>
> I agree with Daniel and Paul that a global switch to _TIME_BITS=3D64 + ma=
ss
> rebuild is
>   - more efficient than a package-by-package approach,
>   - also less likely to leave out some packages by mistake.

While I do too, and I believe this is the path forward for supporting
people with 32 bit hardware in y>=3D2038, this is *still* an ABI break,
and there is a regrettably large amount of proprietary software in the
world that users would expect to work (think games et al) which directly
depends on this ABI.  It is not as trivial as it may seem at first.  On
top of that, this still keeps the FFI problems Florian was talking
about.

I see two possibly slightly overlapping camps here:

1) AMD64 -m32 multilib users, who need this ABI for old, crusty non-Free
   binaries,
2) People running 32-bit hardware

(plus one that complains about 64 bit types consuming more memory which
I choose to ignore)

Supporting these both is a conflicting goal, (1) requires that time
remains 32 bit, and (2) does not care about that at all, and would
prefer a flag day which lets them have systems they can smoothly
continue to operate in fifteen years.  This is why I don't think
shoehorning _TIME_BITS=3D64 will work.

I (in personal capacity) think our best shot at supporting all of these
cases is to not opportunistically use _TIME_BITS (as it's difficult to
detect whether the rest of the system was built the same way), and
provide a hard break flag on glibc, with, potentially, a new
multilib/whathaveyou.

Let's establish a convention now, and just call the 64-bit time_t (et
al) gnuy39.  We can then use existing multilib practice we all have to
eventually migrate our i?86 systems to i?86-*-gnuy39 with an i?86-*-gnu
multilib for those that need it.  I imagine amd64 users won't ever need
i?86-*-gnuy39, but, in theory, this maps to that scenario, too.

Keep in mind, also, that we need to form a consensus on this.  Vendors
that produce the kind of software we're spending effort providing
compatibility for will just pick one or two distros to target, and so,
it's crucial that other distros follow the same conventions (including
source-based ones, because source-based needn't imply *fully* built from
source - we often need compatibility with software built for RHEL/Deb).

Enabling this requires the previously suggested ability to shift
"primary" symbols like gettimeofday to time64, rather than segregating
them to _TIME_BITS=3D64.  What I was thinking of above is having that be a
new $os value.  This should be easy to match.

>> In Fedora we have a
>> concept of global C/C++ flags which most C/C++ applications obey:
>>
>> $ rpm --eval '%{__global_cflags}'
>> -O2 -flto=3Dauto -ffat-lto-objects -fexceptions -g -grecord-gcc-switches=
 -pipe
>> -Wall -Werror=3Dformat-security -Wp,-D_FORTIFY_SOURCE=3D2
>> -Wp,-D_GLIBCXX_ASSERTIONS -specs=3D/usr/lib/rpm/redhat/redhat-hardened-c=
c1
>> -fstack-protector-strong -specs=3D/usr/lib/rpm/redhat/redhat-annobin-cc1=
 -m64
>> -mtune=3Dgeneric -fasynchronous-unwind-tables -fstack-clash-protection
>> -fcf-protection
>>
>> We could stick -D_TIME_BITS=3D64 in there and then do a mass rebuild.
>
> How do you detect if a package (by mistake or intentionally) does
> '#undef _TIME_BITS'?
>
> A safer solution might be to hack the compilers (gcc and clang), so that
> they make _TIME_BITS evaluate to 64, regardless of any '#define _TIME_BIT=
S 32'
> or '#undef _TIME_BITS' in the package's source code.

I'm not a huge fan of hacking cpp to do this, packagers could easily
check for this automatically, which is already a lot of "free"
"automated" testing.
=2D-=20
Arsen Arsenovi=C4=87

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOcEARYKAI8WIQT+4rPRE/wAoxYtYGFSwpQwHqLEkwUCZAKFHV8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0RkVF
MkIzRDExM0ZDMDBBMzE2MkQ2MDYxNTJDMjk0MzAxRUEyQzQ5MxEcYXJzZW5AZ2Vu
dG9vLm9yZwAKCRBSwpQwHqLEk+kOAP99yrQS6zsH6KEkg/tn8tyXfz1plqCzOeKm
DOWuOnc+sgEA/bFvGTtjDB6/FZ1+HexMOQEun92VQDMlWHBAaLP9TgE=
=9Yw3
-----END PGP SIGNATURE-----
--=-=-=--
